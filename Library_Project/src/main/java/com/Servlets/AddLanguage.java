package com.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.helper.FactoryProvider;
import com.library.Authors;
import com.library.Language;


public class AddLanguage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddLanguage() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String lname=request.getParameter("lname");
		String country=request.getParameter("country");
		
		
		
		
		try {
			
			SessionFactory factory=FactoryProvider.getSessionFactory();
			Session s=factory.openSession();
		
			Transaction tx=s.beginTransaction();
			
			System.out.println("Transaction has begun");
			
			Criteria c=s.createCriteria(Language.class);
			Projection projection=Projections.property("name");
			c.setProjection(projection);
			c.add(Restrictions.like("name", lname));
			List<String> list1=c.list();
			
			if(list1.isEmpty()) {
			
			Language l=new Language(lname, country);
			
			
			s.save(l);
			tx.commit();
			
			System.out.println("details of author saved saved in db");
			
			s.close();
			
			System.out.println("Language info added successfully");
			System.out.println("Language details are: "+l);
			
			response.sendRedirect("Languages.jsp");
			}else {
				out.println("<h3><center><b><font color='red'>Language info already present</font></b></center></h3>");
				RequestDispatcher rd=request.getRequestDispatcher("AddLanguage.jsp");
				rd.include(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<h2><center>Error while adding author info. Please try again</center></h2>");
			RequestDispatcher rd=request.getRequestDispatcher("AddLanguage.jsp");
			rd.include(request, response);
		}
		
	}
		
	}


