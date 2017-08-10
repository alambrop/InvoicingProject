package invoice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GenerateLink2")
public class GenerateLink2 extends HttpServlet {
	  
	private static final long serialVersionUID = 1L;
    private String code = "D123K";
    private	String policyID = null;
    private String lastName = null, firstName = null, email = null, phone = null;
    private Date paymentDueDate = null;
    
    private static final String JDBC_Driver = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/invoice_db";
	private static final String USER = "root";
	private static final String PASSWORD = "password123";
	
    public GenerateLink2() { 
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
				
				Connection conn = null;
				conn = getDBConnection();
				
				final String getPolicyID = "SELECT * from invoiceLink WHERE LinkCode = ?";
				final String getCustomer = "SELECT * from customer WHERE PolicyID = ?";
				final PreparedStatement ps = conn.prepareStatement(getPolicyID);
				final PreparedStatement ps1 = conn.prepareStatement(getCustomer);
				
				ps.setString(1, code);
				
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
	
					policyID = rs.getString("PolicyID");
					paymentDueDate = rs.getDate("PaymentDueDate");
				}
				
				ps1.setString(1, policyID);
				rs = ps1.executeQuery();
				
				while (rs.next()) {
					lastName = rs.getString("LastName");
					firstName = rs.getString("FirstName");
					email = rs.getString("PrimaryEmail");
					phone = rs.getString("PrimaryPhone");
				}
				  
				System.out.println("policy id : " + policyID );
				System.out.println("Payment due date " + paymentDueDate);
				System.out.println("Last name : " + lastName);
				System.out.println("First name : " + firstName);
				System.out.println("Email : " + email);
				System.out.println("phone : " + phone);
				
				request.setAttribute("firstName", firstName);
				request.setAttribute("lastName", lastName);
				request.setAttribute("code", code);
				request.getRequestDispatcher("/invoice2.jsp").include(request, response);
			
				
				
		}  catch(SQLException se) {
		        se.printStackTrace();
		} catch(Exception e) {
		        e.printStackTrace();
		} 
		 
	}													
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//doGet(request, response);
		//request.setAttribute("firstName", policyID);
		String code = request.getParameter("code");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		request.setAttribute("code", code);
		request.getRequestDispatcher("/ConfirmationPage.jsp").include(request, response);
	}
	
	
	public void link() {
		Random rand = new Random();
		int n = rand.nextInt(50000) + 10000;
		System.out.println(n);
		
	}
		
	
	private static Connection getDBConnection() {

		Connection dbConnection = null;

		try {
			Class.forName(JDBC_Driver);		
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}

		try {
			dbConnection = DriverManager.getConnection(DB_URL, USER, PASSWORD);
			return dbConnection;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return dbConnection;
	}

}
