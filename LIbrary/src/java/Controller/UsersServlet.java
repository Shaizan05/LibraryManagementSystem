/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Service.BookContactService;
import Service.UserService;
import java.io.IOException;
import java.io.PrintWriter;
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
public class UsersServlet extends HttpServlet {

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
            UserService us = new UserService();
            BookContactService bcs = new BookContactService();
            String process = request.getParameter("process");
            if (process.equals("rentBook")) {
                String bookId = request.getParameter("bookId");
                String bookName = request.getParameter("bookName");
                request.setAttribute("process", process);
                request.setAttribute("bookId", bookId);
                request.setAttribute("bookName", bookName);
                RequestDispatcher rd = request.getRequestDispatcher("books.jsp");
                rd.forward(request, response);
            }  else if (process.equals("issubook")) {

                String userId = request.getParameter("uid");
                String username = request.getParameter("uname");
                String bookId = request.getParameter("bid");
                String bookName = request.getParameter("bname");
                String startDate = request.getParameter("startdate");
                String endDate = request.getParameter("enddate");
                String Status = request.getParameter("status");
                int status = us.updated(userId, username, bookId, bookName, startDate, endDate, Status);
                out.print(status);
//                request.setAttribute("process", process);

            } else if (process.equals("countBook")) {
                String bookId = request.getParameter("bookId");
                int status = bcs.countBook(bookId);
                out.print(status);
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
            Logger.getLogger(UsersServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UsersServlet.class.getName()).log(Level.SEVERE, null, ex);
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