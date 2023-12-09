<%@page import="com.sportyshoes.entities.User, com.sportyshoes.dao.CategoryDao, com.sportyshoes.entities.Category, java.util.*, com.sportyshoes.helper.*"%>

<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in ! ! login first");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You are not admin ! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

	<%
		CategoryDao cdo = new CategoryDao(FactoryProvider.getFactory());
		List<Category> list = cdo.getCategories();
		//Getting Count
	Map<String,Long> m=	Helper.getCounts(FactoryProvider.getFactory());
		
		%>	


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminPage</title>
<%@include file="/components/common_css_js.jsp"%>

<style>
.admin .card {
	border: 2px solid #673ab7;
}

.admin .card:hover {
	background: #e2e2e2;
	cursor: pointer;
}
</style>

</head>
<body>
	<%@include file="/components/navbar.jsp"%>

	<div class="container admin">
	
	<div class="container-fluid mt-3">
	<%@include file="/components/message.jsp" %>
	
	</div>
	
		<div class="row mt-3">
			<!-- first col -->
			<div class="col-md-4">
				<!-- 	first-box -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/team.png">
						</div>
						<h1><%=m.get("userCount") %></h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>
			<!-- Second col -->
			<div class="col-md-4">
				<!-- 	first-box -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/list.png">
						</div>
						<h1><%=list.size() %></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<!-- Third col -->
			<div class="col-md-4">
				<!-- 	first-box -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/offer.png">
						</div>
						<h1><%=m.get("productCount") %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- Second row -->
		<div class="row  mt-3">
			<!-- Second : row:first column -->
			<div class="col-md-6">
				<div class="card"  data-toggle="modal" data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/calculator.png">
						</div>
						<p class="mt-2">Click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>
			
				<!-- Add Category Model -->
	
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill category detailes</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form  action="ProdOpeServ" method="post">
				
				<input type="hidden" name="operation" value="addcategory" />
				
				<div class="form-group">
				<input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required="required" />
				</div>
				<div class="form-group">
				<textarea style="height:300px;" class="form-control"  placeholder="Enter category description" name="catDescription" required="required"></textarea>
				</div>
				
				<div class="container text-center">
				<button class="btn btn-outline-success">Add Category</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
				
				</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Category Model -->
			
			<!-- Second : row:second column -->
			<div class="col-md-6">
				<div class="card"  data-toggle="modal" data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="user_icon" src="img/plus.png">
						</div>
						<p class="mt-2">Click here to add new Product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
			
				<!-- Add Product Model -->
	
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill product detailes</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<form action="ProdOpeServ" method="post" enctype="multipart/form-data">
				<input type="hidden" name="operation" value="addproduct" />
				<div class="form-group">
				<input type="text" class="form-control" name="pName" placeholder="Enter product name" required="required" />
				</div>
				<div class="form-group">
				<input type="number" class="form-control" name="pPrice" placeholder="Enter product price" required="required" />
				</div>
				<div class="form-group">
				<input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required="required" />
				</div>
				<div class="form-group">
				<input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required="required" />
				</div>
				<div class="form-group">
				<label for="pPhoto">Select Picture of Product</label>
				<input type="file" class="form-control"  id="pPhoto"  name="pPhoto" placeholder="Choose File" required="required" />
				</div>
				<div class="form-group">
				<textarea style="height:150px;" class="form-control"  placeholder="Enter product description" name="pDesc" required="required"></textarea>
				</div>
				
			<!-- 	product category -->
			
	
			
<div class="form-group">
<select name="catId" class="form-control">
<option value="Select....">Select....</option>

<%
for(Category c : list){
	
%>
<option value="<%= c.getCategoryId() %>"><%=c.getCategoryTitle() %></option>

<%} %>
</select>
				</div>
				<div class="container text-center">
				<button class="btn btn-outline-success">Add Product</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Category Model -->
	<%@include file="/components/common_modals.jsp"%>
		</div>
	</div>

</body>
</html>