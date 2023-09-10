package com.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.library.Book;

public class DeleteBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			int bookId=Integer.parseInt(request.getParameter("book_id").trim());
			
			Session s=FactoryProvider.getSessionFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			Book b=(Book)s.get(Book.class, bookId);
			s.delete(b);
			
			tx.commit();
			
			s.close();
			
			response.sendRedirect("AllBooks.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
