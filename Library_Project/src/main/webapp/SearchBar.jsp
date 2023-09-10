<%@page import="java.util.Iterator"%>
<%@page import="org.hibernate.query.NativeQuery"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="org.hibernate.criterion.Projection"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="com.library.Book"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library | SEARCH</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<!-- verifyinf user -->
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setHeader("Expires", "0"); //Proxy

	if (session.getAttribute("username") == null)
		response.sendRedirect("index.jsp");
	%>

	<%@include file="navbar_full.jsp"%>
	<br>

	<div class="card mt-3">



		<%
		response.setContentType("text/html");
		String search = request.getParameter("search");

		Session s = FactoryProvider.getSessionFactory().openSession();

		//Book b=null;

		try {
			if (search.length() != 0) {
		%>

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

			<%
			int bid = Integer.parseInt(search);
			Criteria c1 = s.createCriteria(Book.class);
			c1.add(Restrictions.like("bookID", bid));

			List<Book> list1 = c1.list();
			for (Book b : list1) {
			%>
			<tr>
				<td><u><%=b.getBookID()%></u></td>
				<td><b><%=b.getName()%></b></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPublication()%></td>
				<td><%=b.getLanguage()%></td>
				<td><%=b.getCost()%></td>
				<td><%=b.getAddDate()%></td>
				<td>
					<div class="container text-center ">
						<form action="DeleteBook?book_id=<%=b.getBookID()%>" method="post">
							<button type="submit" class="btn btn-danger p-1 m-1">Delete</button>
						</form>
				</td>
				<td>
      <form action="BorrowBook?book_id=<%= b.getBookID()%>" method="post">
      <button type="submit" class="btn btn-success p-1 m-1">BORROW</button>
      </form>
      </td>
				<td><a href="UpdateBook.jsp?book_id=<%=b.getBookID()%>"
					class="btn btn-primary p-1 m-1">Update</a>
					</div></td>
			</tr>

			<%
			}
			} else {
			out.println("<h3><center><b><font color='red'>Enter something to search</font></b></center></h3>");
			}
			} catch (Exception exception) {
			try {
			if (search.length() != 0) {
			Criteria c2 = s.createCriteria(Book.class);
			c2.add(Restrictions.like("name", "%" + search + "%"));

			List<Book> list2 = c2.list();
			for (Book b : list2) {
			%>
			<tr>
				<td><%=b.getBookID()%></td>
				<td><b><u><%=b.getName()%></u></b></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPublication()%></td>
				<td><%=b.getLanguage()%></td>
				<td><%=b.getCost()%></td>
				<td><%=b.getAddDate()%></td>
				<td>
					<div class="container text-center ">
						<form action="DeleteBook?book_id=<%=b.getBookID()%>" method="post">
							<button type="submit" class="btn btn-danger p-1 m-1">Delete</button>
						</form>
				</td>
				<td>
      <form action="BorrowBook?book_id=<%= b.getBookID()%>" method="post">
      <button type="submit" class="btn btn-success p-1 m-1">BORROW</button>
      </form>
      </td>
				<td><a href="UpdateBook.jsp?book_id=<%=b.getBookID()%>"
					class="btn btn-primary p-1 m-1">Update</a>
					</div></td>
			</tr>

			<%
			}
			if (list2.isEmpty()) {
			Criteria c3 = s.createCriteria(Book.class);
			c3.add(Restrictions.like("author", "%" + search + "%"));

			List<Book> list3 = c3.list();
			for (Book b : list3) {
			%>
			<tr>
				<td><%=b.getBookID()%></td>
				<td><b><%=b.getName()%></b></td>
				<td><u><%=b.getAuthor()%></u></td>
				<td><%=b.getPublication()%></td>
				<td><%=b.getLanguage()%></td>
				<td><%=b.getCost()%></td>
				<td><%=b.getAddDate()%></td>
				<td>
					<div class="container text-center ">
						<form action="DeleteBook?book_id=<%=b.getBookID()%>" method="post">
							<button type="submit" class="btn btn-danger p-1 m-1">Delete</button>
						</form>
				</td>
				<td>
      <form action="BorrowBook?book_id=<%= b.getBookID()%>" method="post">
      <button type="submit" class="btn btn-success p-1 m-1">BORROW</button>
      </form>
      </td>
				<td><a href="UpdateBook.jsp?book_id=<%=b.getBookID()%>"
					class="btn btn-primary p-1 m-1">Update</a>
					</div></td>
			</tr>
			<%
			}

			if (list3.isEmpty()) {
			Criteria c4 = s.createCriteria(Book.class);
			c4.add(Restrictions.like("publication", "%" + search + "%"));

			List<Book> list4 = c4.list();
			for (Book b : list4) {
			%>
			<tr>
				<td><%=b.getBookID()%></td>
				<td><b><%=b.getName()%></b></td>
				<td><%=b.getAuthor()%></td>
				<td><u><%=b.getPublication()%></u></td>
				<td><%=b.getLanguage()%></td>
				<td><%=b.getCost()%></td>
				<td><%=b.getAddDate()%></td>
				<td>
					<div class="container text-center ">
						<form action="DeleteBook?book_id=<%=b.getBookID()%>" method="post">
							<button type="submit" class="btn btn-danger p-1 m-1">Delete</button>
						</form>
				</td>
				<td>
      <form action="BorrowBook?book_id=<%= b.getBookID()%>" method="post">
      <button type="submit" class="btn btn-success p-1 m-1">BORROW</button>
      </form>
      </td>
				<td><a href="UpdateBook.jsp?book_id=<%=b.getBookID()%>"
					class="btn btn-primary p-1 m-1">Update</a>
					</div></td>
			</tr>

			<%
			}
			if (list4.isEmpty()) {
			Criteria c5 = s.createCriteria(Book.class);
			c5.add(Restrictions.like("language", "%" + search + "%"));

			List<Book> list5 = c5.list();
			for (Book b : list5) {
			%>

			<tr>
				<td><%=b.getBookID()%></td>
				<td><b><%=b.getName()%></b></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPublication()%></td>
				<td><u><%=b.getLanguage()%></u></td>
				<td><%=b.getCost()%></td>
				<td><%=b.getAddDate()%></td>
				<td>
					<div class="container text-center ">
						<form action="DeleteBook?book_id=<%=b.getBookID()%>" method="post">
							<button type="submit" class="btn btn-danger p-1 m-1">Delete</button>
						</form>
				</td>
				<td>
      <form action="BorrowBook?book_id=<%= b.getBookID()%>" method="post">
      <button type="submit" class="btn btn-success p-1 m-1">BORROW</button>
      </form>
      </td>
				<td><a href="UpdateBook.jsp?book_id=<%=b.getBookID()%>"
					class="btn btn-primary p-1 m-1">Update</a>
					</div></td>
			</tr>

			<%
			}
			if (list5.isEmpty()) {
			Double cost = Double.parseDouble(search);
			Criteria c6 = s.createCriteria(Book.class);
			c6.add(Restrictions.eq("cost", cost));

			List<Book> list6 = c6.list();
			for (Book b : list6) {
			%>

			<tr>
				<td><%=b.getBookID()%></td>
				<td><b><%=b.getName()%></b></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPublication()%></td>
				<td><%=b.getLanguage()%></td>
				<td><u><%=b.getCost()%></u></td>
				<td><%=b.getAddDate()%></td>
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
			}
			}
			}
			
			} else {
			out.println("<h3><center><b><font color='red'>Enter Something to search</font></b></center></h3>");
			}
			} catch (Exception e) {
			out.println("<h3><center><b><font color='red'>No result found</font></b></center></h3>");
			}
			}
			%>
		
</body>
</html>