<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="org.hibernate.criterion.Projection"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.library.Book"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library | PUBLICATIONS</title>
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

<div class="container-fluid p-0 m-0">
		<%@include file="navbar_full.jsp"%>
	</div>
	<h2 class="text-center">
			<u><b>Publication</b></u>
		</h2>
		<br><br>
		
		<%
		response.setContentType("text/html");
		Session s=FactoryProvider.getSessionFactory().openSession();
		
		Criteria c=s.createCriteria(Book.class);
		Projection projection=Projections.property("publication");
		c.setProjection(projection);
		
		List<String> list=c.list();
		Set<String> set=new HashSet<String>(list);
		for(String publication:set){
			
				
			
	
		%>
		
 <!-- Example split danger button -->
		<div class="row">
    <div class="col-md-8 offset-md-2">
<div class="btn-group">

<a href="BookByPublication.jsp?publication=<%=publication %>">
  <button type="button" class="btn btn-light btn-lg" style="width:800px;"><%=publication %>
  </button>
  </a>
  <button type="button" class="btn btn-light dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="AboutPublication.jsp?pname=<%= publication %>">About</a>
    <a class="dropdown-item" href="AddPublication.jsp?pname=<%= publication %>">Add info</a>
    <a class="dropdown-item" href="UpdatePublication.jsp?pname=<%= publication %>">Update info</a>
</div>

</div>
	
</div>
</div>	

<%}
		
		%>
		


<% s.close(); %>



</body>
</html>