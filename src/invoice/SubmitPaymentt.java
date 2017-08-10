package invoice;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SubmitPaymentt")
public class SubmitPaymentt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SubmitPaymentt() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String code = request.getParameter("code");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		System.out.println("in submit Payment");
		
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		request.setAttribute("code", code);
		request.getRequestDispatcher("/ConfirmationPage.jsp").include(request, response);
		
	}

}
