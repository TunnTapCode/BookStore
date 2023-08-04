/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Book;
import Model.Category;
import Model.DAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ManagerControl", urlPatterns = {"/managerbook"})
public class ManagerControl extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        DAO dao = new DAO();
        List<Category> listC = dao.getAllCategory();
        int total = dao.CountBook();
        int  endpage = total / 9 ;
        if (total % 9 != 0) {
            endpage ++;
        }
        String index = request.getParameter("index");
        if (index == null) {
          index = "1" ;
        }
        int ind = Integer.parseInt(index);
        List<Book> list = dao.pagingBook(ind);
         request.setAttribute("tag", ind);
        request.setAttribute("page", total);
        request.setAttribute("endP", endpage);
        request.setAttribute("ListCC", listC);
        request.setAttribute("ListBB", list);
        request.getRequestDispatcher("ManagerBook.jsp").forward(request, response);
        
        }
    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
