/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.DAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "add", urlPatterns = {"/add"})
public class AddBook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String sprice = request.getParameter("price");
        String title = request.getParameter("title");
        String image = request.getParameter("image");
        String author = request.getParameter("author");
        String scategory = request.getParameter("category");
        if(name == null && name == "" ){
            name = "abc";
        }
        int price = Integer.parseInt(sprice);
        int category = Integer.parseInt(scategory);
        DAO d = new DAO();
        d.insertBook(title, price, image, author, name, category);
        response.sendRedirect("managerbook");
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
