package com.sportyshoes.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import com.sportyshoes.dao.UserDao;
import com.sportyshoes.entities.User;
import com.sportyshoes.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
resp.setContentType("text/html");
	
try(PrintWriter out = resp.getWriter()) {
	
	String email = req.getParameter("email");
	String password = req.getParameter("password");
	
	//VALIDATIONS
	//AUTHENTICATING USER
UserDao userDao =	new UserDao(FactoryProvider.getFactory());
User user = userDao.getUserByEmailAndPassword(email, password);
//System.out.println(user);
HttpSession httpSession = req.getSession();


if(user==null) {
	httpSession.setAttribute("message", "Invalid Detailes ! ! Try with another one");
	resp.sendRedirect("login.jsp");
	return;
}else {
	out.println(" <h1>Welcome "+user.getUserName()+" </h1>");
	
//LOGIN	
	httpSession.setAttribute("current-user", user);
if(user.getUserType().equals("admin")) {
	//ADMIN.JSP
	resp.sendRedirect("admin.jsp");
}	else if(user.getUserType().equals("normal")) {
	//NORMAL.JSP
	resp.sendRedirect("normal.jsp");
}else {
	out.println("we have not identified user type...");
}
	
}

} catch (Exception e) {
e.printStackTrace();}	
	
}
}
