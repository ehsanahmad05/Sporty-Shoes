package com.sportyshoes.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.sportyshoes.entities.User;
import com.sportyshoes.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		try {

			String userName=req.getParameter("user_name");
			String userEmail=req.getParameter("user_email");
			String userPassword=req.getParameter("user_password");
			String userPhone=req.getParameter("user_phone");
			String userAddress=req.getParameter("user_address");

			PrintWriter out=resp.getWriter();

			//VALIDATION

			if(userName.isEmpty()) {
				out.println("Name is blank ");
				return;
			}

			//CREATING USER OBJECT TO STORE DATA

			User user=new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");

			Session hibernateSession = FactoryProvider.getFactory().openSession();
			Transaction tx	= hibernateSession.beginTransaction();

			int userId=(int)hibernateSession.save(user);


			tx.commit();
			hibernateSession.close();

			
			HttpSession httpSession = req.getSession();
			httpSession.setAttribute("message","Registration Successful ! !  User id is : "+ userId);
			
			resp.sendRedirect("register.jsp");
			return;

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
