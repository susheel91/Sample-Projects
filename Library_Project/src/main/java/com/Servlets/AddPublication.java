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
import com.library.Language;
import com.library.Publication;


public class AddPublication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddPublication() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String pname=request.getParameter("pname");
		String year=request.getParameter("year");
		
		
		
		
		try {
			
			SessionFactory factory=FactoryProvider.getSessionFactory();
			Session s=factory.openSession();
		
			Transaction tx=s.beginTransaction();
			
			System.out.println("Transaction has begun");
			
			Criteria c=s.createCriteria(Publication.class);
			Projection projection=Projections.property("name");
			c.setProjection(projection);
			c.add(Restrictions.like("name", pname));
			List<String> list1=c.list();
			
			if(list1.isEmpty()) {
			
			Publication p=new Publication(pname, year);
			
			
			s.save(p);
			tx.commit();
			
			System.out.println("details of publication saved saved in db");
			
			s.close();
			
			System.out.println("Publication info added successfully");
			System.out.println("Publication details are: "+p);
			
			response.sendRedirect("Publication.jsp");
			}else {
				out.println("<h3><center><b><font color='red'>Publication info already present</font></b></center></h3>");
				RequestDispatcher rd=request.getRequestDispatcher("AddPublication.jsp");
				rd.include(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<h2><center>Error while adding author info. Please try again</center></h2>");
			RequestDispatcher rd=request.getRequestDispatcher("AddPublication.jsp");
			rd.include(request, response);
		}
		
	}
	}


