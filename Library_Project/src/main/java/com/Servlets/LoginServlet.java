package com.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.library.Login_details;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String un=request.getParameter("username");
		String pw=request.getParameter("password");
		PrintWriter out=response.getWriter();
		
		response.setContentType("text/html");
		Transaction tx=null;
		SessionFactory s=FactoryProvider.getSessionFactory();
		Session session=s.openSession();
		tx=session.beginTransaction();
		
		Login_details user=(Login_details)session.get(Login_details.class, un);
		if(user!=null && user.getPassword().equals(pw)) {

			tx.commit();
			session.close();
			
			HttpSession sess=request.getSession();
			sess.setAttribute("username", user.getUsername());
			
			response.sendRedirect("home.jsp");
			
		}else {
			out.println("<h2><center>Login failed. Please try again.</center></h2>");
			RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
			rd.include(request, response);
		}
		
	}

}
