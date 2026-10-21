package com.shopsphere.controller;

import java.io.IOException;

import com.shopsphere.model.Product;
import com.shopsphere.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // /products?id=3  ->  details page
        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                Product product = productService.getById(id);
                if (product == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                    return;
                }
                request.setAttribute("product", product);
                request.getRequestDispatcher("/WEB-INF/views/product-details.jsp")
                       .forward(request, response);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product id");
            }
            return;
        }

        // /products?q=shirt&category=3  ->  list page
        String keyword = request.getParameter("q");
        int categoryId = 0;
        String categoryParam = request.getParameter("category");
        if (categoryParam != null && !categoryParam.isEmpty()) {
            try {
                categoryId = Integer.parseInt(categoryParam);
            } catch (NumberFormatException ignored) {
                // keep 0 = all categories
            }
        }

        request.setAttribute("products", productService.search(keyword, categoryId));
        request.setAttribute("categories", productService.getCategories());
        request.setAttribute("q", keyword);
        request.setAttribute("selectedCategory", categoryId);

        request.getRequestDispatcher("/WEB-INF/views/products.jsp")
               .forward(request, response);
    }
}
