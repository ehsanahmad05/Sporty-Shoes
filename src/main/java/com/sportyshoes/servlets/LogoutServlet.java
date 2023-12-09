package com.sportyshoes.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
resp.setContentType("text/html");
	
	try(PrintWriter out = resp.getWriter()) 

	{

		HttpSession httpSession=req.getSession();
		httpSession.removeAttribute("current-user");
		resp.sendRedirect("login.jsp");

	}catch (Exception e) {
e.printStackTrace();
	}
}}
