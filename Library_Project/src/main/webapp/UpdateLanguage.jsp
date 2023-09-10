<%@page import="com.library.Language"%>
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
<title>Library | UPDATE LANGUAGE INFO</title>
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
    <h1 class="text-center">Enter Language details to be updated</h1>
    
    
    <%
    String lname=request.getParameter("lname");
    
    Session s=FactoryProvider.getSessionFactory().openSession();
   Criteria c=s.createCriteria(Language.class);
   c.add(Restrictions.like("name", lname));
   
   List<Language> list=c.list();
   for(Language l:list){
    
    %>
    
    <form action="UpdateLanguage" method="post">
    
    <input value="<%=l.getLid() %>" name="lid" type="hidden">
    
		<div class="form-group py-2 px-5 m-5">
			<label for="name">Language name</label> <input name="name" required type="text"
				class="form-control" id="name"
				aria-describedby="emailHelp" placeholder="Enter the new name" 
				value="<%=l.getName() %>" readonly
				> 
		
			<label for="country">Country</label> 
			<input name="country" required type="text"
				class="form-control" id="author"
				aria-describedby="emailHelp" placeholder="Enter Author's name here" 
				value="<%=l.getCountry() %>"> 
			<br>
		<div class="container text-center">
		<button type="submit" class="btn btn-success">Update Language</button>
		</div>
	</form>
	<%
   }
	%>
    
    
    </div>

</body>
</html>