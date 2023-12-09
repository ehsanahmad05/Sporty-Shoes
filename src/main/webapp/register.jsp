<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>NewUserRegistration</title>
<%@include file="/components/common_css_js.jsp"  %>

</head>

<body>
<%@include file="/components/navbar.jsp" %>

<div class="container-fluid">

<div class="row mt-5">
<div class="col-md-4 offset-md-4">

<div class="card">
<%@include file="/components/message.jsp" %>
<div class="body px-5 py-2">

<h3 class="text-center my-3">Sign Up Here !!</h3>

<form action="register" method="post">
<div class="form-group">
    <label for="name">User Name :</label>
    <input type="text"  name="user_name" class="form-control" id="name"  placeholder="Enter here"   aria-describedby="emailHelp" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label for="email">User Email :</label>
    <input type="email" name="user_email"  class="form-control" id="email"  placeholder="Enter here"   aria-describedby="emailHelp" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label for="password">User Password :</label>
    <input type="password"  name="user_password"  class="form-control" id="password"  placeholder="Enter here"   aria-describedby="emailHelp" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label for="phone">User Phone :</label>
    <input type="number" name="user_phone"  class="form-control" id="phone"  placeholder="Enter here"   aria-describedby="emailHelp" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label for="address">User Address :</label>
    <textarea  style="height:100px;" name="user_address"  class="form-control" placeholder="Enter your address" ></textarea>
  </div>
  
  <div class="container text-center">
  <button class="btn btn-outline-success">Register</button>
   <button class="btn btn-outline-warning">Reset</button>
  </div>
  
</form>

</div>
</div>
</div>
</div>

</div>


</body>
</html>