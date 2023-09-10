package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.helper.FactoryProvider;


public class UpdateLanguage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UpdateLanguage() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String country=request.getParameter("country");
		
		Session s=FactoryProvider.getSessionFactory().openSession();
		Transaction tx=s.beginTransaction();
		
		Query q=s.createQuery("update Language set country=:c where name=:n");
		q.setParameter("c", country);
		q.setParameter("n", name);
		
		int r=q.executeUpdate();
		
		tx.commit();
		s.close();
		
		response.sendRedirect("Languages.jsp");
		
		
	}

}
