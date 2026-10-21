package com.shopsphere.service;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.regex.Pattern;

import com.shopsphere.dao.UserDAO;
import com.shopsphere.model.User;
import com.shopsphere.util.PasswordUtil;

public class UserService {

    private static final Pattern EMAIL =
        Pattern.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
    private static final Pattern MOBILE = Pattern.compile("^[0-9]{10}$");

    private final UserDAO userDAO = new UserDAO();

    // Returns an error message, or null when registration succeeded
    public String register(String name, String email, String password, String mobile) {
        name = (name == null) ? "" : name.trim();
        email = (email == null) ? "" : email.trim().toLowerCase();
        mobile = (mobile == null) ? "" : mobile.trim();

        if (name.length() < 2 || name.length() > 100) {
            return "Please enter your name (2 to 100 characters).";
        }
        if (email.length() > 150 || !EMAIL.matcher(email).matches()) {
            return "Please enter a valid email address.";
        }
        if (password == null || password.length() < 6) {
            return "Password must be at least 6 characters.";
        }
        if (!mobile.isEmpty() && !MOBILE.matcher(mobile).matches()) {
            return "Mobile number must be exactly 10 digits.";
        }

        try {
            if (userDAO.findByEmail(email) != null) {
                return "This email is already registered.";
            }

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(PasswordUtil.hash(password));
            user.setMobile(mobile.isEmpty() ? null : mobile);
            user.setRole("CUSTOMER");
            userDAO.insert(user);
            return null;

        } catch (SQLIntegrityConstraintViolationException e) {
            return "This email is already registered.";
        } catch (SQLException e) {
            throw new RuntimeException("Registration failed", e);
        }
    }

    // Returns the user (without the password hash) or null if login failed
    public User login(String email, String password) {
        if (email == null || password == null) {
            return null;
        }
        try {
            User user = userDAO.findByEmail(email.trim().toLowerCase());
            if (user == null || !user.isStatus()) {
                return null;
            }
            if (!PasswordUtil.matches(password, user.getPassword())) {
                return null;
            }
            user.setPassword(null); // never keep the hash in the session
            return user;
        } catch (SQLException e) {
            throw new RuntimeException("Login failed", e);
        }
    }
}
