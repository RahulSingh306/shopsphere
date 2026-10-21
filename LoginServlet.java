package com.shopsphere.controller;

import java.io.IOException;

import com.shopsphere.model.User;
import com.shopsphere.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/products");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/views/login.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.login(email, password);

        if (user == null) {
            request.setAttribute("error", "Invalid email or password.");
            request.setAttribute("email", email);
            request.getRequestDispatcher("/WEB-INF/views/login.jsp")
                   .forward(request, response);
            return;
        }

        HttpSession session = request.getSession();

        // page the user originally wanted (saved by a filter), if any
        String target = (String) session.getAttribute("redirectAfterLogin");
        session.removeAttribute("redirectAfterLogin");

        // new session id after login protects against session fixation
        request.changeSessionId();

        session.setAttribute("user", user);
        session.setAttribute("role", user.getRole());

        if (target == null) {
            target = "ADMIN".equals(user.getRole()) ? "/admin/dashboard" : "/products";
        }
        response.sendRedirect(request.getContextPath() + target);
    }
}
