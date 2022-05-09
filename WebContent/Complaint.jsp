<%@ page import="com.Complaint"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Complaint Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/Complaint.js"></script>
</head>
<body bgcolor = "#cccccc">
<div class="container" >
	<div class="row">
		<div class="col-30">
		<br><br>
		<center>
		<h1 style="font-size:34px; color:black; font-weight:bold;"> MAKE COMPLAINTS </h1>
		</center>
		<br><br>
	
		<form id="formItem" name="formItem">
	 		<h2 style="font-size:18px; color:black;">Sender Name:</h2>
	 		<input style="border-color: black; border-width: 2px" id="senderName" name="senderName" type="text" class="form-control form-control-sm">
	 		<br> 
			<div class="input-group input-group-sm mb-3">
				<div class="input-group-prepend">
		 			<span class="input-group-text" id="recipientDeptName">Recipient Department:</span>
				</div>
				<select id="recipientDept" name="recipientDept">
					<option value="0">--Select Department--</option>
					<option value="Customer Service Department">Customer Service Department</option>
					<option value="Power Cut Department">Power Cut Department</option>
					<option value="Billing Department">Billing Department</option>
					<option value="New Connections Department">New Connections Department</option>
				</select>
			</div>
			
	 		<h2 style="font-size:17px; color:black;">Email Address:</h2>
	 		<input style="border-color: black; border-width: 2px" id="email" name="email" type="text"
	 		class="form-control form-control-sm">
	 		<br> 
	 		<h2 style="font-size:17px; color:black;">Subject:</h2>
	 		<input style="border-color: black; border-width: 2px" id="subject" name="subject" type="text"
	 		class="form-control form-control-sm">
	 		<br> 
	 		<h2 style="font-size:17px; color:black;">Complaint:</h2>
	 		<input style="border-color: black; border-width: 2px; height: 50px" id="complaint" name="complaint" type="text"
	 		class="form-control form-control-sm">
	 		<br> 
	 		<h2 style="font-size:17px; color:black;">Response:</h2>
	 		<input style="border-color: black; border-width: 2px; height: 50px" id="response" name="response" type="text"
			class="form-control form-control-sm">
	 		<br><br>
	 		<center><input style="font-size:17px; width: 200px; background-color: #00cc00; border-color:#00cc00; color: black" id="btnSave" name="btnSave" type="button" value="SAVE" class="btn btn-primary"></center>
	 		<br><br>
	 		<input type="hidden" id="hidItemIDSave"
	 		name="hidItemIDSave" value="">
		</form>
	<div id="alertSuccess" class="alert alert-success"></div>
	<div id="alertError" class="alert alert-danger"></div>
	<br>
	<div id="divItemsGrid">
 <%
 Complaint complaintObj = new Complaint();
 out.print(complaintObj.ViewAllComplaints());
 %>
</div>
</div> </div> </div>
</body>
</html>