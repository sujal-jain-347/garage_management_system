import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addVec")
public class addvec extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve parameters from the form
        String id = request.getParameter("id");
        String description = request.getParameter("description");
        String problem = request.getParameter("problem");
        String mech = request.getParameter("mech");
        
        

        // Database connection parameters
        String url = "jdbc:postgresql://localhost:5432/your_database";
        String user = "postgres";
        String password = "sujal";

        // SQL query to insert a new vehicle
        String query = "INSERT INTO vehicle (id, description, prob , mech) VALUES (?, ?, ?, ?)";

        try {
            // Load the PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");

            // Establish a connection to the database
            try (Connection connection = DriverManager.getConnection(url, user, password)) {
                // Create a prepared statement with the query
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, id);
                    preparedStatement.setString(2, description);
                    preparedStatement.setString(3, problem);
                    preparedStatement.setString(4, mech);
                    preparedStatement.executeUpdate();

                    // Redirect back to the form page after successful insertion
                    response.sendRedirect("adminvech.jsp");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle the exception or redirect to an error page
            response.sendRedirect("adminvech.jsp");
        }
    }
}
