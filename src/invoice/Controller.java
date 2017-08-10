package invoice;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//import com.twilio.Twilio;
//import com.twilio.rest.api.v2010.account.Message;
//import com.twilio.type.PhoneNumber;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

 
public class Controller {
	
	//variables for connecting to DB
	private static final String JDBC_Driver = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://localhost:3306/invoice_db";
	private static final String USER = "root";
	private static final String PASSWORD = "password123";
	 
	protected static final String ACCOUNT_SID = "AC50abab0d2168a2a87d80a7eb9bdf1592", AUTH_TOKEN = "e22618296a9bbbcddbf68907bfbcc84f"; // Twilio Info
	
	
	public static void main (String [] args) throws SQLException {
		
		  final String username = "andy7mail7@gmail.com";
		  final String password = "andypassword";
		  
		  final String username2 = "hamin8mail8@gmail.com";
		  final String password2 = "haminpassword";
		
	      String host = "smtp.gmail.com";

	      // Get system properties
	      Properties properties = System.getProperties();

	   
	      properties.put("mail.smtp.user", username);
	      properties.put("mail.smtp.host", host);
	      properties.put("mail.smtp.port", "587");
	      properties.put("mail.smtp.password", password);
	      properties.put("mail.debug", "true");  
	      properties.put("mail.smtp.auth", "true");
	      properties.put("mail.smtp.starttls.enable", "true");
	 
		Session session = Session.getInstance(properties,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("andy7mail7@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("andy7mail7@gmail.com"));
			message.setSubject("AIG Invoice");
			message.setText("Dear Andy Lambropoulos,"
				+ "\n\n Here is your link: http://localhost:11308/Invoice/GenerateLink2/*");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	/*	Connection conn = null;
		conn = getDBConnection();
		
		final String getLinkCode = "SELECT invoicelink.LinkCode, customer.PrimaryPhone, customer.FirstName, customer.LastName "
									+ "FROM invoicelink INNER JOIN customer on invoicelink.PolicyID = customer.PolicyID "
									+ "WHERE customer.FirstName = 'Andy' ";
		final PreparedStatement ps = conn.prepareStatement(getLinkCode);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			String phoneNum = rs.getString("PrimaryPhone");
			String code = rs.getString("LinkCode");
			String firstName = rs.getString("FirstName");
			String lastName = rs.getString("LastName");
			String userLink = "Your payment is due please use the following link to pay http://USP7L62G4R32:8080/Invoice/GenerateLink2/*";
			System.out.println(phoneNum);
			System.out.println(code);
			System.out.println(firstName);
			System.out.println(lastName);
			
			sendMessage(phoneNum, userLink);

		} */	
	
	/*public static void sendMessage(String phoneNum, String userMessage) {
	    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
	    Message message = Message.creator(new PhoneNumber(phoneNum),  // to
	    		new PhoneNumber("+17049315488 "),  // from
	    		userMessage) // Message or you can use a hashmap
	    		.create();
	    message.getStatus();
	}*/
	
	/*private static Connection getDBConnection() {
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
	}*/
}
