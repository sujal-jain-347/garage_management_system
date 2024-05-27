/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deluser")
public class deluser extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve parameters from the form
        String username = request.getParameter("username");

        // Database connection parameters
        String url = "jdbc:postgresql://localhost:5432/world";
        String user = "postgres" ;
        String dbPassword = "sujal"; // Change this to your actual database password
        
        // SQL query to insert a new user
        String query = " delete from auth where name = ?";

        try {
            // Load the PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Establish a connection to the database
            try (Connection connection = DriverManager.getConnection(url, user, dbPassword)) {
                // Create a prepared statement with the query
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, username);
                    preparedStatement.executeUpdate();
                    
                    System.out.println("delete the users");
                    response.sendRedirect("adminHome.jsp");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("adminHome.jsp");
        }
    }
}


