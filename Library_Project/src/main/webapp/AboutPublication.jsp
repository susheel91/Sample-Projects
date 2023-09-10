<%@page import="com.library.Publication"%>
<%@page import="com.library.Language"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="com.library.Authors"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About <%=request.getParameter("pname") %></title>
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
	
	<h2 class="text-center"><u>About <%=request.getParameter("pname") %></u></h2>
	<br><br>
	
	<%
	String pname=request.getParameter("pname");
	Session s=FactoryProvider.getSessionFactory().openSession();
	
	Query q=s.createQuery("from Publication where name=:n");
	q.setParameter("n", pname);
	
	List<Publication> list=q.list();
	for(Publication p:list){
	
	%>
	<div class="text-center">
	<%=p.getName() %> is a publication house started in the year <%=p.getYear() %>.
	<br>
	For more info <a href="https://www.google.co.in/search?q=<%=p.getName() %>+publication"><u>click here.</u></a> 
	<br><br>
	
	<a href="Publication.jsp"><button class="btn btn-warning p-1 m-1">Back</button></a>
	
	</div>
	
	<%
	}if(list.isEmpty()){
		%>
		
		<div class="text-center">
		<a href="AddPublication.jsp?pname=<%=pname %>" class="btn btn-primary p-1 m-1">Add info</a>
		</div>
		
	<%	
	}
	%>
	

</body>
</html>