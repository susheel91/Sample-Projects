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
<title>About <%=request.getParameter("aname") %></title>
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
	
	<h2 class="text-center"><u>About <%=request.getParameter("aname") %></u></h2>
	<br><br>
	
	<%
	String aname=request.getParameter("aname");
	Session s=FactoryProvider.getSessionFactory().openSession();
	
	Query q=s.createQuery("from Authors where name=:n");
	q.setParameter("n", aname);
	
	List<Authors> list=q.list();
	for(Authors a:list){
	
	%>
	<div class="text-center">
	<%=a.getName() %> was an author of <%=a.getOrigin() %> origin. He is known for his writings of the genere "<%=a.getGenere() %>".
	<br>
	For more info <a href="https://www.google.co.in/search?q=<%=a.getName() %>"><u>click here.</u></a> 
	<br><br>
	
	<a href="Authors.jsp"><button class="btn btn-warning p-1 m-1">Back</button></a>
	
	</div>
	
	<%
	}
	%>
	

</body>
</html>