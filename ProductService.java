package com.shopsphere.service;

import java.sql.SQLException;
import java.util.List;

import com.shopsphere.dao.CategoryDAO;
import com.shopsphere.dao.ProductDAO;
import com.shopsphere.model.Category;
import com.shopsphere.model.Product;

public class ProductService {

    private final ProductDAO productDAO = new ProductDAO();
    private final CategoryDAO categoryDAO = new CategoryDAO();

    public List<Product> search(String keyword, int categoryId) {
        try {
            return productDAO.search(keyword, categoryId);
        } catch (SQLException e) {
            throw new RuntimeException("Could not load products", e);
        }
    }

    public Product getById(int id) {
        try {
            return productDAO.findById(id);
        } catch (SQLException e) {
            throw new RuntimeException("Could not load product " + id, e);
        }
    }

    public List<Category> getCategories() {
        try {
            return categoryDAO.findAll();
        } catch (SQLException e) {
            throw new RuntimeException("Could not load categories", e);
        }
    }
}
