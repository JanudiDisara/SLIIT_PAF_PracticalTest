
package com;
import java.sql.*;

//Registration Number: IT20037888
//Name: J.D. Ranasinghe
//Service: User Management Service

public class Complaint {
	private Connection connect() { 
		Connection con = null; 
		try { 
			Class.forName("com.mysql.jdbc.Driver"); 
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/usermanagementservice", "root", ""); 
			//For testing
			System.out.print("Successfully connected to the database!"); 
		} 
		catch (Exception e) {
			System.out.print("Failed to connect to the databse!"); 
			e.printStackTrace();
		} 
		return con; 
	 }
	
	public String MakeComplaint (String SenderName, String RecipientDept, String EmailAddress, String Subject, String Complaint, String Response) { 
		String output = ""; 
		String response = "";
		try { 
			Connection con = connect(); 
			if (con == null) {
				return "Error while connecting to the database when making complaints!"; 
			} 
			 
			// Create a prepared statement
			String query = " INSERT INTO complaint (`ComplaintID`,`SenderName`,`RecipientDept`,`EmailAddress`,`Subject`, `Complaint`, `Response`)" + " VALUES (?, ?, ?, ?, ?, ?, ?)"; 
			PreparedStatement preparedStmt = con.prepareStatement(query); 
				
			// Binding values
			preparedStmt.setInt(1, 0); 
			preparedStmt.setString(2, SenderName); 
			preparedStmt.setString(3, RecipientDept); 
			preparedStmt.setString(4, EmailAddress); 
			preparedStmt.setString(5, Subject); 
			preparedStmt.setString(6, Complaint); 
			preparedStmt.setString(7, response); 
				
			// Execute the statement
			preparedStmt.execute(); 
			con.close(); 
			String newComplaints = ViewAllComplaints();
			 output = "{\"status\":\"success\", \"data\": \"" +
					 newComplaints + "\"}"; 
		} 
		catch (Exception e) { 
			output = "{\"status\":\"error\", \"data\": \"Error while making the complaint.\"}";
			System.err.println(e.getMessage()); 
		} 
		return output; 
	 }
	
	 //Read all complaints --> Update word doc function it says update complaint
	 public String ViewAllComplaints() { 
		 String output = ""; 
		 try { 
			 Connection con = connect(); 
			 if (con == null) {
				 return "Error while connecting to the database for viewing complaints!"; 
			 } 
			 output = "<table style = 'background-color: #8c8c8c; border: 2; border-color: black; padding: 2px'><tr>"
					+ "<th style = 'color: black; margin-left: 10px; border-color: black'>Complaint ID</th>"
			 		+ "<th>Sender Name</th>"
			 		+ "<th> Recipient Department</th>" 
			 		+ "<th>Email Address</th>" 
			 		+ "<th>Subject</th>"
			 		+ "<th>Complaint</th>"
			 		+ "<th>Response</th>"
			 		+ "<th>Action</th></tr>"; 
	 
			 String query = "SELECT * FROM complaint"; 
			 Statement stmt = con.createStatement(); 
			 ResultSet rs = stmt.executeQuery(query); 
	 
			 while (rs.next()) { 
				 String ComplaintID = Integer.toString(rs.getInt("ComplaintID")); 
				 String SenderName = rs.getString("SenderName"); 
				 String RecipientDept = rs.getString("RecipientDept"); 
				 String EmailAddress = rs.getString("EmailAddress"); 
				 String Subject = rs.getString("Subject"); 
				 String Complaint = rs.getString("Complaint"); 
				 String Response = rs.getString("Response"); 
				 
			 
				// Add into the html table
				 output += "<tr><td style = 'word-break: break-all;'><input id='hidItemIDUpdate'name='hidItemIDUpdate'type='hidden' value='" + ComplaintID
				  + "'>" + ComplaintID + "</td>";
				 output += "<td style = 'width: 210px'>" + SenderName + "</td>";
				 output += "<td style = 'width: 210px'>" + RecipientDept + "</td>";
				  output += "<td style = 'width: 180px'>" + EmailAddress + "</td>";
				  output += "<td style = 'width: 210px'>" + Subject + "</td>";
				  output += "<td style = 'width: 210px'>" + Complaint + "</td>";
				  output += "<td style = 'width: 210px'>" + Response + "</td>";
				// buttons
				  output += "<td style = 'width: 210px'><input name='btnUpdate'type='button' value='Update'class='btnUpdate btn btn-secondary'></td>"+ "<td style = 'width: 210px'><input name='btnRemove'type='button' "
				  		+ "value='Remove'class='btnRemove btn btn-danger'data-itemid='"
						  + ComplaintID + "'>" + "</td></tr>"; 

			 
			 } 
			 
			 con.close(); 
			 output += "</table>"; 
		 } 
		 catch (Exception e) { 
			 output = "Error while viewing complaints!"; 
			 System.err.println(e.getMessage()); 
		 } 
		 return output; 
	 } 
	
	 //Respond to complaints
	 public String AddResponse (String ComplaintID, String Response) {
		 String output = "";
		 String decodedmon = java.net.URLDecoder.decode(Response);
		 try {
			 Connection con = connect();
			 if (con == null) {
				 return "Error while connecting to the database when responding to complaints!"; 
			 }

			 String query = "UPDATE complaint SET Response = ? WHERE ComplaintID = ?";
			 PreparedStatement preparedStmt = con.prepareStatement(query);
			 
			 //Binding values
			 preparedStmt.setString(1, decodedmon);
			 preparedStmt.setInt(2, Integer.parseInt(ComplaintID));
			 //Execute the statement
			 preparedStmt.execute();
			 con.close();
			 String newComplaints = ViewAllComplaints();
			 output = "{\"status\":\"success\", \"data\": \"" + newComplaints + "\"}";
			}
		 catch (Exception e) {
			 output = "{\"status\":\"error\", \"data\":\"Error while updating the item.\"}";
			 System.err.println(e.getMessage());
		 }
		 return output;
	 } 
	 
	 public String RemoveComplaint (String ComplaintID) {
		 String output = "";
		 try {
			 Connection con = connect();
			 if (con == null) {
				 return "Error while connecting to the database to remove complaint!"; 
			 }
			 
			 //Create a prepared statement
			 String query = "DELETE FROM complaint WHERE ComplaintID = ?";
			 PreparedStatement preparedStmt = con.prepareStatement(query);
			 
			 // binding values
			 preparedStmt.setInt(1, Integer.parseInt(ComplaintID));
	 
			 // execute the statement
			 preparedStmt.execute();
			 con.close();
			 String newComplaints = ViewAllComplaints();
			 output = "{\"status\":\"success\", \"data\": \"" +
					 newComplaints + "\"}";
		 }
		 catch (Exception e) {
			 output = "{\"status\":\"error\", \"data\":\"Error while deleting the item.\"}";
			 System.err.println(e.getMessage());
		 }
		 return output;
	 } 
	
}
