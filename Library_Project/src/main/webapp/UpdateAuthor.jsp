<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="org.hibernate.criterion.Projection"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="com.library.Authors"%>
<%@page import="com.library.Book"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library | UPDATE AUTHOR INFO</title>
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
    <%@include file="navbar_full.jsp" %>
    <h1 class="text-center">Enter Author details to be updated</h1>
    
    
    <%
    String aname=request.getParameter("aname");
    
    Session s=FactoryProvider.getSessionFactory().openSession();
   Criteria c=s.createCriteria(Authors.class);
   c.add(Restrictions.like("name", aname));
   
   List<Authors> list=c.list();
   for(Authors a:list){
    
    %>
    
    <form action="UpdateAuthor" method="post">
    
    <input value="<%= a.getAid() %>" name="aid" type="hidden">
    
		<div class="form-group py-2 px-5 m-5">
			<label for="name">Author name</label> <input name="name" required type="text"
				class="form-control" id="name"
				aria-describedby="emailHelp" placeholder="Enter the new name" 
				value="<%=a.getName() %>" readonly
				> 
		
			<label for="genere">Genere</label> 
			<input name="genere" required type="text"
				class="form-control" id="author"
				aria-describedby="emailHelp" placeholder="Enter Author's name here" 
				value="<%=a.getGenere() %>"> 
			
		
			<label for="origin">Origin</label> 
			<input name="origin" required type="text"
				class="form-control" id="name"
				aria-describedby="emailHelp" placeholder="Enter publisher's name here" 
				value="<%=a.getOrigin() %>"
				> 
				<br>
		<div class="container text-center">
		<button type="submit" class="btn btn-success">Update Author</button>
		</div>
	</form>
	<%
   }
	%>
    
    
    </div>

</body>
</html>