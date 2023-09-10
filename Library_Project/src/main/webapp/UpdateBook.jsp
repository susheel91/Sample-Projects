<%@page import="com.library.Book"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library | UPDATE BOOK</title>
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
    <h1 class="text-center">Enter Book details to be updated</h1>
    
    
    <%
    int bookId=Integer.parseInt(request.getParameter("book_id").trim());
    
    Session s=FactoryProvider.getSessionFactory().openSession();
    
    Book b=(Book)s.get(Book.class,bookId);
    %>
    
    <form action="UpdateServlet" method="post">
    
    <input value="<%= b.getBookID() %>" name="bookId" type="hidden">
    
		<div class="form-group py-2 px-5 m-5">
			<label for="name">Book name</label> <input name="name" required type="text"
				class="form-control" id="name"
				aria-describedby="emailHelp" placeholder="Enter the new name" 
				value="<%=b.getName() %>"
				> 
		
			<label for="author">Author</label> 
			<input name="author" required type="text"
				class="form-control" id="author"
				aria-describedby="emailHelp" placeholder="Enter Author's name here" 
				value="<%=b.getAuthor() %>"> 
			
		
			<label for="publication">Publication</label> 
			<input name="publication" required type="text"
				class="form-control" id="name"
				aria-describedby="emailHelp" placeholder="Enter publisher's name here" 
				value="<%=b.getPublication() %>"
				> 
		
			<label for="language">Language</label> 
			<input name="language" required type="text"
				class="form-control" id="name"
				aria-describedby="emailHelp" placeholder="Enter language of the book here" 
				value="<%=b.getLanguage() %>"
				> 
		
		
			<label for="cost">Cost</label> 
			<input name="cost" required type="text"
				class="form-control" id="name"
				aria-describedby="emailHelp" placeholder="Enter the cost here" 
				value="<%=b.getCost() %>"
				> <br>
		
		<div class="container text-center">
		<button type="submit" class="btn btn-success">Update book</button>
		</div>
	</form>
    
    
    </div>

</body>
</html>