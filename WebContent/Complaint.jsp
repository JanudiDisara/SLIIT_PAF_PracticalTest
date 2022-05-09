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
<body>
<div class="container"><div class="row"><div class="col-30">
	<h1>Complaint Management</h1>
	<form id="formItem" name="formItem">
	 Sender Name:
	 <input id="senderName" name="senderName" type="text"
	 class="form-control form-control-sm">
	 <br> Recipient Department:
	 <input id="recipientDept" name="recipientDept" type="text"
	 class="form-control form-control-sm">
	 <br> Email Address:
	 <input id="email" name="email" type="text"
	 class="form-control form-control-sm">
	 <br> Subject:
	 <input id="subject" name="subject" type="text"
	 class="form-control form-control-sm">
	 <br> Complaint:
	 <input id="complaint" name="complaint" type="text"
	 class="form-control form-control-sm">
	 <br> Response:
	 <input id="response" name="response" type="text"
	 class="form-control form-control-sm">
	 <br>
	 <input id="btnSave" name="btnSave" type="button" value="Save"
	 class="btn btn-primary">
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