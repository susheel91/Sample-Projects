package com.Servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.library.Book;
import com.library.Borrow;

public class BorrowBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BorrowBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bid=request.getParameter("book_id");
		int bookId=Integer.parseInt(bid);
		
		Session s=FactoryProvider.getSessionFactory().openSession();
		
		Book b=(Book)s.load(Book.class, bookId);
		
		Borrow br=new Borrow(b.getName(), b.getAuthor(), b.getPublication(), b.getLanguage(), b.getCost(), new Date());
		HttpSession sess=request.getSession();
		br.setBorrower(sess.getAttribute("username").toString());
		
		Transaction tx=s.beginTransaction();
		
		s.save(br);
		s.delete(b);
		tx.commit();
		s.close();
		
		response.sendRedirect("AllBooks.jsp");
		
	}

}
