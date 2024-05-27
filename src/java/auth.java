import java.io.IOException;
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


public class auth extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
                    System.out.println("**************************************");
                    System.out.println("**************************************");
                    System.out.println("**************************************");
                    System.out.println("**************************************");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (role.equals("admin")) {
            if (username.equals("sujal") && password.equals("123")) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", "ok");
                response.sendRedirect("adminHome.jsp");
            } else {
                response.sendRedirect("index.html");
            }
        }

        if (role.equals("worker")) {
            String url = "jdbc:postgresql://localhost:5432/world";
            String user = "postgres";
            String dbPassword = "sujal"; // Changed variable name to avoid conflict with 'password' parameter
            try {
                Class.forName("org.postgresql.Driver");
                try (Connection connection = DriverManager.getConnection(url, user, dbPassword)) {
                    String query = "SELECT * FROM auth WHERE name = ? AND password = ?";
                    
                    System.out.println("**************************************");
                    System.out.println("**************************************");
                    System.out.println("**************************************");
                    System.out.println("**************************************");
                    try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                        preparedStatement.setString(1, username);
                        preparedStatement.setString(2, password);
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
