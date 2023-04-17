package dienthoai.webmvc.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dienthoai.webmvc.model.Catalog;
import dienthoai.webmvc.model.Product;
import dienthoai.webmvc.service.CategoryService;
import dienthoai.webmvc.service.ProductService;
import dienthoai.webmvc.service.impl.CategoryServicesImpl;
import dienthoai.webmvc.service.impl.ProductServiceImpl;

public class ProductSeachByNameController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	CategoryService cateService = new CategoryServicesImpl();
	ProductService productService=new ProductServiceImpl();
	DecimalFormat df = new DecimalFormat("#.000");
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("s");
		List<Catalog> cateList = cateService.getAll();
		req.setAttribute("catelist", cateList);
		
		List<Product> productSeachByName = productService.searchByName(name);
		req.setAttribute("productlist", productSeachByName);
	
		List<Product> productAllList = productService.getAll();
		req.setAttribute("product_all", productAllList);
		List<Product> productsList1 = new ArrayList<Product>();
		for(Product product: productSeachByName)
		{
			Product product1 = productService.get(Integer.parseInt(product.getId()));
			product1.setPrice(String.valueOf(df.format(Double.parseDouble(product.getPrice()) * (1 - (Double.parseDouble(product.getDiscount())/100)))));
			productsList1.add(product1);
			
		}

		req.setAttribute("productlist1", productsList1);
		List<Product> product_oppo= productService.getProductById(6);
		req.setAttribute("product_oppo", product_oppo);	
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/product-search.jsp");
		dispatcher.forward(req, resp);

	}
}
