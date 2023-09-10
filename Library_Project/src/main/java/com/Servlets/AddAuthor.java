package com.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;

import com.helper.FactoryProvider;
import com.library.Authors;
import com.library.Book;


public class AddAuthor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public AddAuthor() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String aname=request.getParameter("aname");
		String genere=request.getParameter("genere");
		String origin=request.getParameter("origin");
		
		
		
		try {
			
			SessionFactory factory=FactoryProvider.getSessionFactory();
			Session s=factory.openSession();
		
			Transaction tx=s.beginTransaction();
			
			System.out.println("Transaction has begun");
			
			Criteria c=s.createCriteria(Authors.class);
			Projection projection=Projections.property("name");
			c.setProjection(projection);
			c.add(Restrictions.like("name", aname));
			List<String> list1=c.list();
			
			if(list1.isEmpty()) {
			
			Authors a=new Authors(aname, genere, origin);
			
			
			s.save(a);
			tx.commit();
			
			System.out.println("details of author saved saved in db");
			
			s.close();
			
			System.out.println("Author info added successfully");
			System.out.println("Author details are: "+a);
			
			response.sendRedirect("Authors.jsp");
			}else {
				out.println("<h3><center><b><font color='red'>Author info already present</font></b></center></h3>");
				RequestDispatcher rd=request.getRequestDispatcher("AddAuthor.jsp");
				rd.include(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<h2><center>Error while adding author info. Please try again</center></h2>");
			RequestDispatcher rd=request.getRequestDispatcher("AddAuthor.jsp");
			rd.include(request, response);
		}
		
	}

}
