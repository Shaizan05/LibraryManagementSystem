/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Service.BookContactService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
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
public class ProcessServlet extends HttpServlet {
    BookContactService bcs = new BookContactService();
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
            /* TODO output your page here. You may use following sample code. */
            String process = request.getParameter("process");
            if (process.equals("dashboard")||process.equals("userDashboard")){
                request.setAttribute("process",process);
                RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
                rd.forward(request, response);
            }else if (process.equals("trendingBooks")) {
                  ResultSet rs = bcs.getallbooks();
                    request.setAttribute("ResultSet", rs);
                    request.setAttribute("process",process);
                RequestDispatcher rd = request.getRequestDispatcher("trendingbooks.jsp");
                rd.forward(request, response);
            }else if (process.equals("book")) {
                ResultSet rs = bcs.getallbooks();
                request.setAttribute("process", process);
                request.setAttribute("ResultSet", rs);
                RequestDispatcher rd = request.getRequestDispatcher("books.jsp");
                rd.forward(request, response);
            } else if (process.equals("aboutUs")) {
                RequestDispatcher rd = request.getRequestDispatcher("aboutUs.jsp");
                rd.forward(request, response);
            } else if (process.equals("contactUs")) {
                RequestDispatcher rd = request.getRequestDispatcher("contactUs.jsp");
                rd.forward(request, response);
            }else if(process.equals("login")||process.equals("register")){
                request.setAttribute("process", process);
                RequestDispatcher rd = request.getRequestDispatcher("loginRegister.jsp");
                rd.forward(request, response);
            }else if (process.equals("query")) {
                
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String subject = request.getParameter("subject");
                    String message = request.getParameter("message");

                    int status = bcs.insertQuery(name, email, subject, message);
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
            Logger.getLogger(ProcessServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ProcessServlet.class.getName()).log(Level.SEVERE, null, ex);
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