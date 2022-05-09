
$(document).ready(function()
{
$("#response").prop('disabled', true);    
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 }
 $("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{

// Clear alerts---------------------
 $("#alertSuccess").text("");
 $("#alertSuccess").hide();
 $("#alertError").text("");
 $("#alertError").hide();
// Form validation-------------------
var status = validateItemForm();
if (status != true)
 {
 $("#alertError").text(status);
 $("#alertError").show();
 return;
 }
 // If valid------------------------
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


function onItemSaveComplete(response, status)
{
if (status == "success")
 {
 var resultSet = JSON.parse(response);
 if (resultSet.status.trim() == "success")
 {
 $("#alertSuccess").text("Successfully saved.");
 $("#alertSuccess").show();
 $("#divItemsGrid").html(resultSet.data);
 } else if (resultSet.status.trim() == "error")
 {
 $("#alertError").text(resultSet.data);
 $("#alertError").show();
 }
 } else if (status == "error")
 {
 $("#alertError").text("Error while saving.");
 $("#alertError").show();
 } else
 {
 $("#alertError").text("Unknown error while saving..");
 $("#alertError").show();
 }
 14
 $("#hidItemIDSave").val("");
 $("#formItem")[0].reset();
}


// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
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
 $("#response").val($(this).closest("tr").find('td:eq(6)').text());
});


//REMOVE==============================
$(document).on("click", ".btnRemove", function(event)
{
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


function onItemDeleteComplete(response, status)
{
if (status == "success")
 {
 var resultSet = JSON.parse(response);
 if (resultSet.status.trim() == "success")
 {
 $("#alertSuccess").text("Successfully deleted.");
 $("#alertSuccess").show();
 $("#divItemsGrid").html(resultSet.data);
 } else if (resultSet.status.trim() == "error")
 {
 $("#alertError").text(resultSet.data);
 $("#alertError").show();
 }
 } else if (status == "error")
 {
 $("#alertError").text("Error while deleting.");
 $("#alertError").show();
 } else
 {
 $("#alertError").text("Unknown error while deleting..");
 $("#alertError").show();
 }
}



// CLIENT-MODEL================================================================
function validateItemForm()
{
// CODE
if ($("#senderName").val().trim() == "")
 {
 return "Insert SenderName";
 }
// NAME
if ($("#recipientDept").val().trim() == "")
 {
 return "Insert RecipientDept";
 }
if ($("#email").val().trim() == "")
 {
 return "Insert EmailAddress";
 }

if ($("#subject").val().trim() == "")
 {
 return "Insert Subject";
 }
 
 if ($("#complaint").val().trim() == "")
 {
 return "Insert Complaint";
 }
return true;
}
