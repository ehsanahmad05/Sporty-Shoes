package com.sportyshoes.servlets;
import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import com.sportyshoes.dao.CategoryDao;
import com.sportyshoes.dao.ProductDao;
import com.sportyshoes.entities.Category;
import com.sportyshoes.entities.Product;
import com.sportyshoes.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@MultipartConfig
@WebServlet("/ProdOpeServ")
public class ProductOperationServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	resp.setContentType("text/html");
	
	try(PrintWriter out = resp.getWriter()) {

	//fetching category data
	
		//servlet-2
		//add category
		//add product	
		
		String op = req.getParameter("operation");
	
		if(op.trim().equals("addcategory")) {
			
		//add category	
			
			String title=req.getParameter("catTitle");
			String description=req.getParameter("catDescription");
			
			Category catergory= new Category();
			catergory.setCategoryTitle(title);
			catergory.setCategoryDescription(description);
			
			//save to db
			CategoryDao categoryDao	= new CategoryDao(FactoryProvider.getFactory());
		int catId = categoryDao.saveCategory(catergory);
//			out.println("Category Saved....");
			
		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("message", catId +":  Id category added successfully...");
		resp.sendRedirect("admin.jsp");
		return;
		
		}else if(op.trim().equals("addproduct")) {
			
		//add product	
			String pName=req.getParameter("pName");
			int pPrice=Integer.parseInt(req.getParameter("pPrice"));
			int pDiscount=Integer.parseInt(req.getParameter("pDiscount"));
			int pQuantity=Integer.parseInt(req.getParameter("pQuantity"));
			Part part=req.getPart("pPhoto");
			String pDesc=req.getParameter("pDesc");
			int catId =Integer.parseInt(req.getParameter("catId"));
			
			Product p = new Product();
			p.setpName(pName);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			p.setpPhoto(part.getSubmittedFileName());
			p.setpDesc(pDesc);
			
			//get category by  id
			
			CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory());
			Category category = cdoa.getCategoryById(catId);
			p.setCategory(category);
			
			//product save...
	ProductDao pdao= new ProductDao(FactoryProvider.getFactory());
	pdao.saveProduct(p);
	
	//pic - upload
String path = getServletContext().getRealPath("img")+File.separator+"products" +File.separator+part.getSubmittedFileName();
System.out.println(path);
	
	//uploading code ..
try {
	FileOutputStream fos = new FileOutputStream(path);
	InputStream is=part.getInputStream();
	
	//reading data
	byte []data = new byte[is.available()];
	is.read(data);
	
	//writing the data
	fos.write(data);
	fos.close();
}catch (Exception e) {
e.printStackTrace();
}
	
	
	out.println("Product saved success...");
	
	HttpSession httpsession = req.getSession();
	httpsession.setAttribute("message", "Product is added successfully...");
	resp.sendRedirect("admin.jsp");
	
		}
	
	}catch (Exception e) {
e.printStackTrace();
}
}}
