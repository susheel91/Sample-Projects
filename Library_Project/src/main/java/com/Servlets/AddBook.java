package com.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.helper.FactoryProvider;
import com.library.Authors;
import com.library.Book;
import com.library.Language;
import com.library.Publication;


public class AddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Transaction tx=null;
		String bname=request.getParameter("bname");
		String bauthor=request.getParameter("bauthor");
		String bpublication=request.getParameter("bpublication");
		String bcost=request.getParameter("bcost");
		Double cost=Double.parseDouble(bcost);
		String blanguage=request.getParameter("blanguage");
		
		PrintWriter out=response.getWriter();
		
		response.setContentType("text/html");
	
		
		SessionFactory factory=FactoryProvider.getSessionFactory();
		Session s=factory.openSession();
		tx=s.beginTransaction();
		
		try {
			
			System.out.println("Transaction has begun");
			
			
			Book b=new Book(bname, bauthor, bpublication, cost, new Date(), blanguage);
			
			s.save(b);
			
			tx.commit();
			System.out.println("details of book saved saved in db");
			
			s.close();
			
			System.out.println("Book added successfully");
			System.out.println("Added book details are: "+b);
			
			response.sendRedirect("AddBook.jsp");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<h2><center>Error while adding. Please try again</center></h2>");
			RequestDispatcher rd=request.getRequestDispatcher("AddBook.jsp");
			rd.include(request, response);
			
		}
		
		
	}

}
