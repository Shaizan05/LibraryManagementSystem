package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Service.LoginRegisterService;
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
import javax.servlet.http.HttpSession;


/**
 *
 * @author njuser
 */
public class loginRegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            LoginRegisterService lrs = new LoginRegisterService();
            String process = request.getParameter("process");
            if (process.equals("register")) {
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                int status = lrs.registerUser(username, email, password);
                out.print(status);
            } else if (process.equals("login")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                int checkAdmin = lrs.checkAdmin(username, password);

                if (checkAdmin > 0) {
                    session.setAttribute("username", username);
                    session.setAttribute("login", "admin");
                    out.print("2");
//                RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
//                rd.forward(request, response);

                } else {

                    int status = lrs.checkLogin(username, password);
                    if (status > 0) {
                        String sEmail = lrs.getEmail(username, password);
                        String sName = lrs.getName(username, password);
                        String sId = lrs.getId(username, password);
                        session.setAttribute("EmailResult", sEmail);
                        session.setAttribute("NameResult", sName);
                        session.setAttribute("IdResult", sId);
                        session.setAttribute("login", "user");
                        out.print("1");
                    } else {
                        out.print("0");
                    }
                }
            } else if (process.equals("logOut")) {
                session.invalidate();
           
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
            Logger.getLogger(loginRegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(loginRegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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