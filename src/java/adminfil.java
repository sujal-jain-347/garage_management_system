import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class adminfil implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code if needed
    }

    /**
     *
     * @param request
     * @param response
     * @param chain
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false); // Get existing session if exists

        // Check if session exists and if admin attribute is set
        boolean isAdmin = session != null && session.getAttribute("admin") != null;
        
        System.out.println("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        System.out.println("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        System.out.println("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        System.out.println("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        System.out.println("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        System.out.println("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        
        

        // If admin session is set, redirect to admin home page
        if (isAdmin) {
            httpResponse.sendRedirect("adminHome.jsp");
        } else {
            httpResponse.sendRedirect("index.html");
            chain.doFilter(request, response);
        }
    }

    /**
     *
     */
    @Override
    public void destroy() {
        // Cleanup code if needed
    }
}
