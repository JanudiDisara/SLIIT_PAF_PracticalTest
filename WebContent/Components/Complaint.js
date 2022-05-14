$(document).ready(function() {
	$("#response").prop('disabled', true);    
	if ($("#alertSuccess").text().trim() == "") {
 		$("#alertSuccess").hide();
 	}
 	$("#alertError").hide();
});

// Insert Record to DB
$(document).on("click", "#btnSave", function(event) {
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	var status = validateItemForm();
	if (status != true) {
 		$("#alertError").text(status);
 		$("#alertError").show();
 		return;
	}

	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";
 	$.ajax(
 	{
		url : "ComplaintAPI",
 		type : type,
 		data : $("#formItem").serialize(),
 		dataType : "text",
 		complete : function(response, status)
 	{
 		onItemSaveComplete(response.responseText, status);
	}
 	});
});

function onItemSaveComplete(response, status) {
	if (status == "success") {
 		var resultSet = JSON.parse(response);
 		if (resultSet.status.trim() == "success")
 	{
 		$("#alertSuccess").text("The record has been inserted successfully with the latest changes!");
 		$("#alertSuccess").show();
 		$("#divItemsGrid").html(resultSet.data);
 	} else if (resultSet.status.trim() == "error") {
 		$("#alertError").text(resultSet.data);
 		$("#alertError").show();
 	}
 	} else if (status == "error") {
 		$("#alertError").text("Error while inserting the record!");
 		$("#alertError").show();
 	} else {
 		$("#alertError").text("Error while inserting the record!");
 		$("#alertError").show();
 	}
 		$("#hidItemIDSave").val("");
 		$("#formItem")[0].reset();
}

// Update Records in the DB
$(document).on("click", ".btnUpdate", function(event) {
	$("#senderName").prop('disabled', true);     
	$("#recipientDept").prop('disabled', true);     
	$("#email").prop('disabled', true);     
	$("#subject").prop('disabled', true); 
	$("#complaint").prop('disabled', true);     
	$("#response").prop('disabled', false);   

 	$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());
	$("#senderName").val($(this).closest("tr").find('td:eq(1)').text());
 	$("#recipientDept").val($(this).closest("tr").find('td:eq(2)').text());
 	$("#email").val($(this).closest("tr").find('td:eq(3)').text());
 	$("#subject").val($(this).closest("tr").find('td:eq(4)').text());
 	$("#complaint").val($(this).closest("tr").find('td:eq(5)').text());
 	$("#response").val((decodeURI($(this).closest("tr").find('td:eq(6)').text())));
});

// Delete Records from the DB
$(document).on("click", ".btnRemove", function(event) {
	$.ajax(
	{
 		url : "ComplaintAPI",
 		type : "DELETE",
 		data : "ComplaintID=" + $(this).data("itemid"),
 		dataType : "text",
 		complete : function(response, status)
 	{
 		onItemDeleteComplete(response.responseText, status);
 	}
 	});
});

function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
 		if (resultSet.status.trim() == "success") {
 			$("#alertSuccess").text("The record has been deleted successfully!");
 			$("#alertSuccess").show();
 			$("#divItemsGrid").html(resultSet.data);
 		} else if (resultSet.status.trim() == "error") {
 			$("#alertError").text(resultSet.data);
 			$("#alertError").show();
 		}
 	} else if (status == "error") {
		$("#alertError").text("Error while deleting the record!");
 		$("#alertError").show();
 	} else {
 		$("#alertError").text("Unknown error while deleting the record!");
 		$("#alertError").show();
 	}
}

// Validating the client model
function validateItemForm() {
	var filter = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	if ($("#senderName").val().trim() == "") {
 		return "Please enter the name of the sender!";
 	}
	if ($("#recipientDept").val().trim() == "") {
		return "Please enter the recipient department name!";
 	}
	//if (($("#email").val().trim() == "")||(!filter.test($("email").val()))) {
 		//return "Please enter an email address!";
 	//}
	if ($("#subject").val().trim() == "") {
 		return "Please enter the subject of the complaint!";
 	}
 	if ($("#complaint").val().trim() == "") {
 		return "Please enter the complaint details!";
 	}
	return true;
}
