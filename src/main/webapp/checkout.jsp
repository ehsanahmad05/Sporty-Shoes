<%@page import="com.sportyshoes.entities.User, com.sportyshoes.dao.CategoryDao, com.sportyshoes.entities.Category, java.util.*, com.sportyshoes.helper.FactoryProvider"%>


<%  
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in ! ! login first to access checkout page");
	response.sendRedirect("login.jsp");
	return;
} 
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>checkOut Page</title>
<%@include file="/components/common_css_js.jsp"%>
</head>
<body>
<%@include file="/components/navbar.jsp"%>

<div class="container">
<div class="row mt-5">
<div class="col-md-6">
<!-- card -->
<div class="card">
<div class="card-body">
<h3 class="text-center mb-5">Your selected items</h3>
<div class="cart-body">

</div>
</div>
</div>
</div>
<div class="col-md-6">
<!-- form detailes -->
<!-- card -->
<div class="card">
<div class="card-body">
<h3 class="text-center mb-5">Your detailes for order</h3>
<from action=" #!"></from>
  <div class="form-group">
    <label for="exampleInputEmail1">Email Address :</label>
    <input type="email"  value="<%=user.getUserEmail() %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
   <div class="form-group">
    <label for="name">Your Name :</label>
    <input type="text" value="<%=user.getUserName()%>" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
  </div>
  <div class="form-group">
    <label for="number">Your Contact :</label>
    <input type="number" value="<%=user.getUserPhone()%>" class="form-control" id="number" aria-describedby="emailHelp" placeholder="Enter  contact number">
  </div>
   <div class="form-group">
    <label for="exampleFormControlTextarea1">Your Shipping Address :</label>
    <textarea value="<%=user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter address"></textarea>
  </div>
  <div class="container text-center">
  <button class="btn btn-outline-success">Order Now</button>
    <button class="btn btn-outline-primary">Continue Shopping</button>
  
  </div>
</div>
</div>
</div>
</div>
</div>



<%@include file="/components/common_modals.jsp" %>
</body>
</html>