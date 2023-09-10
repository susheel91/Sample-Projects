<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library | ADD BOOK</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

<!-- verifyinf user -->
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");		//HTTP 1.1
	response.setHeader("Pragma", "no-cache");		//HTTP 1.0
	response.setHeader("Expires", "0");		//Proxy
	
	if(session.getAttribute("username")==null)
		response.sendRedirect("index.jsp");
	%>

<%@include file="navbar_full.jsp"%>
	<br>
	<h2 class="text-center">Please fill the book details</h2>
	
	
	<form action="AddBook" method="post">
  <div class="form-group py-2 px-5 m-5">
    <label for="Name of the book">Book Name</label>
    <input name="bname" class="form-control" type="text" placeholder="Enter here" required>
    <br>
    <label for="Author">Author</label>
    <input type="text" class="form-control" name="bauthor" placeholder="Enter here" required>
    <br>
    <label for="Publication">Publication</label>
    <input type="text" class="form-control" name="bpublication" placeholder="Enter here" required>
    <br>
    <label for="Cost">Cost</label>
    <input type="double" class="form-control" name="bcost" placeholder="Enter here" required>
    <br>
    <label for="Language">Language</label>
    <input type="text" class="form-control" name="blanguage" placeholder="Enter here" required>
    <br>
    <input type="checkbox" class="form-check-input" name="checkbox" required>
    <label class="form-check-label" for="exampleCheck1">Are the above details correct</label>
    <br>
    <button type="submit" class="btn btn-success">Add Book</button>
    
  </div>
  
</form>

</body>
</html>