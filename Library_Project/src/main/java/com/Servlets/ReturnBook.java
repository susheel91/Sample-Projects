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
import com.library.Borrow;

public class ReturnBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReturnBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String borrowId=request.getParameter("borrow_id");
		int brId=Integer.parseInt(borrowId);
		
		Session s=FactoryProvider.getSessionFactory().openSession();
		Transaction tx=s.beginTransaction();
		Borrow br=s.load(Borrow.class, brId);
		
		Book b=new Book(br.getBorrowID(), br.getBname(), br.getBauthor(), br.getBpublication(), br.getCost(), new Date(), br.getBlanguage());
		
		s.save(b);
		s.delete(br);
		
		tx.commit();
		s.close();
		
		response.sendRedirect("ReturnBook.jsp");
		
	}

}
