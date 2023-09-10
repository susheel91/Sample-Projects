<%@page import="java.io.PrintWriter"%>
<%@page import="com.library.Book"%>
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
<title>Library | ALL BOOKS</title>
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
		<br>
		<h2 class="text-uppercase text-center">All Books</h2>
		
		<div class="row">
		<div class="col-12">
		
		<%
		Session s=FactoryProvider.getSessionFactory().openSession();
		
		Query q=s.createQuery("from Book");
		
		%>
		
					<div class="card mt-3">
  
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">BOOK ID</th>
      <th scope="col">TITLE</th>
      <th scope="col">AUTHOR</th>
      <th scope="col">PUBLICATION</th>
      <th scope="col">LANGUAGE</th>
      <th scope="col">COST</th>
      <th scope="col">ADDED DATE</th>
    </tr>
  </thead>
  
    <tbody>
    
		
		
		<%
		List<Book> list=q.list();
		for(Book b:list){
			if(list.size()!=0){
			
			%>
			
      <tr>
      <td><%=b.getBookID() %></td>
      <td><b><%=b.getName() %></b></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPublication() %></td>
      <td><%=b.getLanguage() %></td>
      <td><%=b.getCost() %></td>
      <td><%=b.getAddDate() %></td>
      <td>
      <div class="container text-center ">
      <form action="DeleteBook?book_id=<%= b.getBookID()%>" method="post">
      <button type="submit" class="btn btn-danger p-1 m-1">Delete</button>
      
      </form>
      </td>
      <td>
      <form action="BorrowBook?book_id=<%= b.getBookID()%>" method="post">
      <button type="submit" class="btn btn-success p-1 m-1">BORROW</button>
      </form>
      </td>
      <td>
    <a href="UpdateBook.jsp?book_id=<%=b.getBookID() %>" class="btn btn-primary p-1 m-1">Update</a>
    </div>
    </td>
    </tr>

			
<%
			}
			
		}
		
		
		%>
		    

  </tbody>
</table>
<%
		Query q2=s.createQuery("from Book");
		List<Book> list3=q2.list();
		if(list3.isEmpty()){
			out.println("<h3><center><b><font color='red'>No Books available</font></b></center></h3>");
		}
		
		s.close();
		%>
		
		</div>
		</div>
		
		
		
	</div>


</body>
</html>