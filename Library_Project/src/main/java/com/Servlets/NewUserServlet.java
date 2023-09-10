package com.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.helper.FactoryProvider;
import com.library.Login_details;

public class NewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public NewUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Transaction tx=null;
		String un=request.getParameter("uname");
		String pass=request.getParameter("pass");
		String pass1=request.getParameter("pass1");
		
		System.out.println(un+pass+pass1);
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		if(pass.equals(pass1)) {
			System.out.println("if is true");
				try {
				SessionFactory factory=FactoryProvider.getSessionFactory();
				Session s=factory.openSession();
				tx=s.beginTransaction();
				
				Login_details details=new Login_details();
				details.setUsername(un);
				details.setPassword(pass);
				
				System.out.println(details);
				
				s.save(details);
				tx.commit();
				s.close();
				System.out.println("New user created");
				response.sendRedirect("Login.jsp");
				}catch (Exception e) {
					e.printStackTrace();
					if(tx!=null)tx.rollback();
				}
				
			}else {
				out.println("<h2><center>Please enter correct details</center></h2>");
				RequestDispatcher rd=request.getRequestDispatcher("NewUser.jsp");
				rd.include(request, response);
			}
		
			
		}
		
	}


