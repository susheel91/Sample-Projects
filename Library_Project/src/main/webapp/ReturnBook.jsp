<%@page import="com.library.Borrow"%>
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
<title>Library | RETURN BOOK</title>
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
		<h3 class="text-uppercase text-center">List of borrowed books</h3>
		
		<div class="row">
		<div class="col-12">
		
		<%
		response.setContentType("text/html");
		Session s=FactoryProvider.getSessionFactory().openSession();
		
		Query q=s.createQuery("from Borrow");
		
		%>
		
					<div class="card mt-3">
  
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">BORROW ID</th>
      <th scope="col">TITLE</th>
      <th scope="col">AUTHOR</th>
      <th scope="col">PUBLICATION</th>
      <th scope="col">LANGUAGE</th>
      <th scope="col">COST</th>
      <th scope="col">BORROW DATE</th>
      <th scope="col">BORROWER</th>
    </tr>
  </thead>
  
    <tbody>
    
		
		
		<%
		List<Borrow> list=q.list();
		for(Borrow b:list){
			if(list.size()!=0){
			
			%>
			
      <tr>
      <td><%=b.getBorrowID() %></td>
      <td><b><%=b.getBname() %></b></td>
      <td><%=b.getBauthor() %></td>
      <td><%=b.getBpublication() %></td>
      <td><%=b.getBlanguage() %></td>
      <td><%=b.getCost() %></td>
      <td><%=b.getBorrowDate() %></td>
      <td><%=session.getAttribute("username")%></td>
      <td>
      <div class="container text-center ">
      <form action="ReturnBook?borrow_id=<%= b.getBorrowID()%>" method="post">
      <button type="submit" class="btn btn-success p-1 m-1">Return</button>
      </form>
      
      
    </div>
    
    </tr>

			
<%
			}
			
		}
		
		%>
		    
  </tbody>
</table>
<%
		Query q2=s.createQuery("from Borrow");
		List<Borrow> list3=q2.list();
		if(list3.isEmpty()){
			out.println("<h3><center><b><font color='red'>No books to return</font></b></center></h3>");
		}
		
		s.close();
		%>
		
		</div>
		</div>
		
		
		
	</div>


</body>
</html>