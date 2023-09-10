package com.Servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;


import com.helper.FactoryProvider;
import com.library.Book;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
			
			int bid=Integer.parseInt(request.getParameter("bookId").trim());
			String name=request.getParameter("name");
			String author=request.getParameter("author");
			String publication=request.getParameter("publication");
			String language=request.getParameter("language");
			Double cost=Double.parseDouble(request.getParameter("cost").trim());
			
			
			Session s=FactoryProvider.getSessionFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			Book b=(Book)s.get(Book.class, bid);
			
			b.setName(name);
			b.setAuthor(author);
			b.setPublication(publication);
			b.setLanguage(language);
			b.setCost(cost);
			b.setAddDate(new Date());
			
			tx.commit();
			s.close();
			
			response.sendRedirect("AllBooks.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
