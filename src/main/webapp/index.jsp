<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.*,com.sportyshoes.helper.Helper, com.sportyshoes.helper.FactoryProvider, com.sportyshoes.dao.ProductDao,com.sportyshoes.dao.CategoryDao, com.sportyshoes.entities.Product,com.sportyshoes.entities.Category"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SportyShoes-HomePage</title>

<%@include file="/components/common_css_js.jsp"  %>

</head>
<body>
<%@include file="/components/navbar.jsp" %>

<div class="container-fluid">
<div class="row mt-3 mx-2">

<%  
String cat=request.getParameter("category");

ProductDao dao= new ProductDao(FactoryProvider.getFactory());
List<Product>  list =null; 
/* if(cat==null){
	list = dao.getAllProducts();
}
else */ 
if(cat == null  ||  cat.trim().equals("all")){
		list = dao.getAllProducts();
	}else{
		int cid = Integer.parseInt(cat.trim());
		 list = dao.getAllProductsById(cid);
	}

CategoryDao cdao = new CategoryDao (FactoryProvider.getFactory()); 
List<Category> clist = cdao.getCategories();

%>
<!-- show category -->
<div class="col-md-2">

<div class="list-group mt-4">
<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
  All Products
</a>


<%  for(Category c:clist){  %>

<a href="index.jsp?category=<%=c.getCategoryId() %>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle() %></a>
	
	
<% } %>

</div>
</div>

<!-- show products -->
<div class="col-md-10">
<div class="row mt-4">
<div class="col-md-12">
<div class="card-columns">

<%  for(Product p : list){   %>
<!-- PRODUCT CARD -->
<div class="card product-card" >
<div class="container text-center">
<img class="card-img-top m-2" src="img/products/<%=p.getpPhoto() %>"  style="max-height: 320px; max-width:100%; width: auto; " alt="Card image cap"> 
 </div> <div class="card-body">
  <h5 class="card-title"><%=p.getpName()  %></h5>
  <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
  </div>
  <div class="card-footer text-center" >
  <button class="btn custom-bg text-white"  onclick="add_to_cart(<%=p.getpId() %>, '<%=p.getpName() %>',<%=p.getPriceAfterApplyDiscount() %>)"  >Add To Cart</button>
    <button class="btn  btn-outline-success"> &#x20B9;<%=p.getPriceAfterApplyDiscount() %>/- <span class="text-secondary discount-label"> &#x20B9;<%=p.getpPrice() %> , <%=p.getpDiscount()  %>% off </span></button> 
  </div>
</div>
<%  
} 
if(list.size() == 0){
	out.println("<h3>No item in this category...</h3>");
}
%>
</div>
</div>
</div>
</div>
</div>
</div>
<%@include file="/components/common_modals.jsp" %>
</body>
</html>
