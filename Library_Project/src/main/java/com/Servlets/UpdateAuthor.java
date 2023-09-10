package com.Servlets;

import java.io.IOException;
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

public class UpdateAuthor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateAuthor() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String aname=request.getParameter("name");
		String genere=request.getParameter("genere");
		String origin=request.getParameter("origin");
		int aid=Integer.parseInt(request.getParameter("aid"));
		
		Session s=FactoryProvider.getSessionFactory().openSession();
		Transaction tx=s.beginTransaction();
		
		Query q=s.createQuery("update Authors set genere=:g, origin=:o where name=:n");
		q.setParameter("g", genere);
		q.setParameter("o", origin);
		q.setParameter("n", aname);
		
		int r=q.executeUpdate();
		
		tx.commit();
		s.close();
		
		response.sendRedirect("Authors.jsp");
		
		
		
		
		
	}

}
