package dienthoai.webmvc.controller;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import dienthoai.webmvc.model.Product;
import dienthoai.webmvc.service.ProductService;
import dienthoai.webmvc.service.impl.ProductServiceImpl;
import javax.servlet.http.HttpServletResponse;



public class HomeController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	ProductService productService = new ProductServiceImpl();
	DecimalFormat df = new DecimalFormat("#.000");
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Product iphone
		List<Product> product_iphone= productService.getProductById(1);
		req.setAttribute("product_iphone", product_iphone);	
		
		// Product samsung
		List<Product> product_samsung= productService.getProductById(2);
		req.setAttribute("product_samsung", product_samsung);	
		
		// Product xiaomi
		List<Product> product_xiaomi= productService.getProductById(3);
		req.setAttribute("product_xiaomi", product_xiaomi);	
		
		// Product pixel
		List<Product> product_pixel= productService.getProductById(4);
		req.setAttribute("product_pixel", product_pixel);	
		
		// Product sony
		List<Product> product_sony= productService.getProductById(5);
		req.setAttribute("product_sony", product_sony);	
				
		// Product oppo
		List<Product> product_oppo= productService.getProductById(6);
		req.setAttribute("product_oppo", product_oppo);	
		
		List<Product> productList = productService.getAll();
		req.setAttribute("productlist", productList);	
		//Giá giảm
		List<Product> productsList1 = new ArrayList<Product>();
		for(Product product: productList)
		{
			Product product1 = productService.get(Integer.parseInt(product.getId()));
			product1.setPrice(String.valueOf(df.format(Double.parseDouble(product.getPrice()) * (1 - (Double.parseDouble(product.getDiscount())/100)))));
			productsList1.add(product1);
			
		}

		req.setAttribute("productlist1", productsList1);
		
		// Product gaming
		List<Product> product_gaming= productService.getProductById(7);
		req.setAttribute("product_gaming", product_gaming);	
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/view/client/index.jsp");
		dispatcher.forward(req, resp);
	}
}
