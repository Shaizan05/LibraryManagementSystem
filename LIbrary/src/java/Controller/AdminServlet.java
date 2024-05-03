/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Service.AdminService;
import Service.BookContactService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author njuser
 */
public class AdminServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            AdminService as = new AdminService();

            String process = request.getParameter("process");

            if (process.equals("adminDashboard")) {
                int bookCount = as.getBookCount();
                int userCount = as.getUserCount();
                int issuedBooksCount = as.getIssuedBooksCount();
                request.setAttribute("BookCount", bookCount);
                request.setAttribute("UserCount", userCount);
                request.setAttribute("IssuedBooksCount", issuedBooksCount);
                request.setAttribute("process", process);
                RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
                rd.forward(request, response);
            } else if (process.equals("user")) {

                ResultSet rs = as.getAllUser();
                request.setAttribute("ResultSet", rs);
                request.setAttribute("process", process);
                RequestDispatcher rd = request.getRequestDispatcher("AdminUsers.jsp");
                rd.forward(request, response);
            } else if (process.equals("book")) {
                ResultSet rs = as.getAllBooks();
                request.setAttribute("ResultSet", rs);
                request.setAttribute("process", process);
                RequestDispatcher rd = request.getRequestDispatcher("AdminBooks.jsp");
                rd.forward(request, response);
            } else if (process.equals("issued")) {
                ResultSet rs = as.issuedBooks();
                request.setAttribute("IssuedResultSet", rs);
                request.setAttribute("process", process);
                RequestDispatcher rd = request.getRequestDispatcher("AdminBooks.jsp");
                rd.forward(request, response);
            } else if (process.equals("bookRecords")) {
            } else if (process.equals("query")) {
                ResultSet rs = as.getAllQuery();
                request.setAttribute("ResultSet", rs);
                request.setAttribute("process", process);
                RequestDispatcher rd = request.getRequestDispatcher("AdminUsers.jsp");
                rd.forward(request, response);
            } else if (process.equals("addUser")) {
                request.setAttribute("process", process);
                RequestDispatcher rd = request.getRequestDispatcher("AdminUsers.jsp");
                rd.forward(request, response);
            } else if (process.equals("insertUser")) {
                String name = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                int status = as.addUser(name, email, password);
                out.print(status);

            } else if (process.equals("deleteUser")) {
                int userId = Integer.parseInt(request.getParameter("userId"));
                int status = as.deleteUser(userId);
                out.print(status);

            } else if (process.equals("addBook")) {
                request.setAttribute("process", process);
                RequestDispatcher rd = request.getRequestDispatcher("AdminBooks.jsp");
                rd.forward(request, response);
            } else if (process.equals("addBooksInDb")) {

                String name = request.getParameter("name");
                String author = request.getParameter("author");
                String image = request.getParameter("url");
                String desc = request.getParameter("desc");
                String category = request.getParameter("category");
                int price = Integer.parseInt(request.getParameter("price"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                int status = as.addBooks(name, author, image, desc, category, price, stock);
                out.print(status);
            } else if (process.equals("deleteBook")) {
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                int status = as.deleteBook(bookId);
                out.print(status);
            } else if (process.equals("editBook")) {
                int bookId = Integer.parseInt(request.getParameter("bookId"));
                ResultSet rs = as.ShowBook(bookId);
                request.setAttribute("ResultSet", rs);
                request.setAttribute("process", process);
                RequestDispatcher rd = request.getRequestDispatcher("AdminBooks.jsp");
                rd.forward(request, response);
            } else if (process.equals("updateBook")) {
                String name = request.getParameter("name");
                String author = request.getParameter("author");
                String image = request.getParameter("url");
                String desc = request.getParameter("desc");
                String category = request.getParameter("category");
                int price = Integer.parseInt(request.getParameter("price"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                int bookId = Integer.parseInt(request.getParameter("bookId"));

                int status = as.updateBook(bookId, name, author, image, desc, category, price, stock);
                out.print(status);
            } else if (process.equals("deleteQuery")) {
                int id = Integer.parseInt(request.getParameter("id"));
                int status = as.deleteQuery(id);
                out.print(status);
            } else if (process.equals("editUser")) {
                int id = Integer.parseInt(request.getParameter("id"));
                ResultSet rs = as.editUser(id);
                request.setAttribute("ResultSet", rs);
                request.setAttribute("process", process);
                RequestDispatcher rd = request.getRequestDispatcher("AdminUsers.jsp");
                rd.forward(request, response);
            } else if (process.equals("updateUser")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                int status = as.updateUser(id, username, email, password);
                out.print(status);

            }else if (process.equals("deleteIssue")) {
                int id = Integer.parseInt(request.getParameter("id"));
                int status = as.deleteIssue(id);
                
            } 

        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
