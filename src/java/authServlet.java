/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;
import jakarta.servlet.annotation.WebServlet;


/**s
 *
 * @author SUJAL JAIN
 */
@WebServlet("/authServlet")
public class authServlet extends HttpServlet {

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
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String role = request.getParameter("role");

if(role.equals("admin")){
    
    if(username.equals("sujal") && pass.equals("123")){
        

        HttpSession session = request.getSession();
        session.setAttribute("admin", "ok");
        response.sendRedirect("adminHome.jsp");

    }
    else{

response.sendRedirect("index.html");}

}

if(role.equals("worker")){
    
        String url = "jdbc:postgresql://localhost:5432/world";
        String user = "postgres";
        String password = "sujal";
        
        try {
                Class.forName("org.postgresql.Driver");
                try (Connection connection = DriverManager.getConnection(url, user, password)) {
                    String query = "SELECT * FROM users WHERE username = ? AND password = ?";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                        preparedStatement.setString(1, username);
                        preparedStatement.setString(2, pass);
                        try (ResultSet resultSet = preparedStatement.executeQuery()) {
                            if (resultSet.next()) {
                                HttpSession session = request.getSession();
                                session.setAttribute("worker", "ok");
                                response.sendRedirect("workerHome.jsp");
                            } else {
                                response.sendRedirect("index.html");
                            }
                        }
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                System.out.println("Error: " + e.getMessage());
                response.sendRedirect("index.html");
            }
        }
    }
    
    

}
    

  
