package invoice;
import java.util.*;
import java.sql.*;
import java.sql.Date;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;




@WebServlet("/GenerateLink2/mainServlet")
public class mainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String code = "D123k";
	private static final String JDBC_Driver = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/invoice_db";
	private static final String USER = "root";
	private static final String PASSWORD = "password123";
       
  
    public mainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			//request.setAttribute("attrib", true);
			//request.getRequestDispatcher("/payment.jsp").include(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String socialSecurityNumber = request.getParameter("SSN1") + request.getParameter("SSN2") + request.getParameter("SSN3");
		String policyID = "", lastName = null, firstName = null, email, phone;
		System.out.println(socialSecurityNumber);
		
		if (socialSecurityNumber.length() != 9) {
			System.out.println(socialSecurityNumber.length());
			PrintWriter writer = response.getWriter();
			//writer.println("alert('Enter Valid Social Security Number')");*/
			//JOptionPane.showMessageDialog(null, "Enter a valid social security number!");
			writer.println("<html><body onload=\"alert('Enter a valid Social Security Number')\"></body></html>");
			request.getRequestDispatcher("/invoice2.jsp").include(request, response);
		}
		else {
			double paymentDue = 0, paidAmount = 0;
			Date paymentDueDate = null, paidDate;
			
			System.out.println("socialSecurityNumber: " + socialSecurityNumber);
			
			try {
				
				Connection conn = null;
				conn = getDBConnection();
				
				final String getPolicyID = "SELECT * from customer WHERE SSN = ?";
				final String getPayment = "SELECT * from payment WHERE PolicyID = ?";
				final PreparedStatement ps = conn.prepareStatement(getPolicyID);
				final PreparedStatement ps1 = conn.prepareStatement(getPayment);
			
				ps.setString(1, socialSecurityNumber);
				
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
	
					policyID = rs.getString("PolicyID");
					lastName = rs.getString("LastName");
					firstName = rs.getString("FirstName");
					email = rs.getString("PrimaryEmail");
					phone = rs.getString("PrimaryPhone");
							
					System.out.println("policy id : " + policyID );
					System.out.println("Last name : " + lastName);
					System.out.println("First name : " + firstName);
					System.out.println("Email : " + email);
					System.out.println("phone : " + phone);
				}
				
				ps1.setString(1, policyID);
				rs = ps1.executeQuery();
				
				while (rs.next()) {
					policyID = rs.getString("PolicyID");
					paymentDue = rs.getDouble("PaymentDue");
					paymentDueDate = rs.getDate("PaymentDueDate");
					paidAmount = rs.getDouble("PaidAmount");
					paidDate = rs.getDate("PaidDate");
					
					System.out.println("payment due: " + paymentDue);
					System.out.println("Payment due date " + paymentDueDate);
					System.out.println("Paid amount: " + paidAmount);
					System.out.println("Paid Date: " + paidDate);
					
				}
				
				request.setAttribute("policyID", policyID);
				request.setAttribute("paymentDue", paymentDue);
				request.setAttribute("paymentDueDate", paymentDueDate);
				request.setAttribute("code", code);
				request.setAttribute("firstName", firstName);
				request.setAttribute("lastName", lastName);
				PrintWriter writer = response.getWriter();
				
				System.out.println("helloooooooooooooooo");
				
				writer.println("<link href='CSS/selectDraftPaymentThree.css' type='text/css' rel= 'stylesheet' >");
				writer.println("<link href='https://fonts.googleapis.com/css?family=Raleway' type='text/css' rel='stylesheet' >");
				writer.println("<link rel = 'stylesheet' type = 'text/css' href = 'CSS/selectDraftPaymentThree.css'>");
				writer.println("<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro' type='text/css' rel='stylesheet' >");
				writer.println("<link rel='stylesheet' href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css'>");
				request.getRequestDispatcher("/Payment2.jsp").include(request, response);
				
				
			}  catch(SQLException se) {
		        se.printStackTrace();
		    } catch(Exception e) {
		        e.printStackTrace();
		    } 
		}
	}
	
	//Establishes the database connection.
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
	
	

