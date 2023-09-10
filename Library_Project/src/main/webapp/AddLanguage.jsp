<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library | ADD LANGUAGE INFO</title>
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
	<h2 class="text-center">Please fill details about <%=request.getParameter("lname") %></h2>
	
	
	<form action="AddLanguage" method="post">
  <div class="form-group py-2 px-5 m-5">
    <label for="Name of the language">Language name</label>
    <input name="lname" class="form-control" type="hidden" placeholder="Enter here" required value="<%= request.getParameter("lname") %>">
    <br>
    <label for="Country">Country</label>
    <input type="text" class="form-control" name="country" placeholder="Enter here" required>
    <br>
  
    <input type="checkbox" class="form-check-input" name="checkbox" required>
    <label class="form-check-label" for="exampleCheck1">Are the above details correct</label>
    <br>
    <button type="submit" class="btn btn-success">Add info</button>
    
  </div>
  
</form>

</body>
</html>