package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.service.StocksService;

public class ServletStocks extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String view = "";
		
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/resource/applicationContext.xml");
		StocksService stocksService = (StocksService) context.getBean("stocksService");
		
		try {
			if ("insert".equals(action)) {
				stocksService.addStocks(request);
				request.setAttribute("itemList", stocksService.getAllItems());
				request.setAttribute("stocksList", stocksService.getAllStocks());
				request.setAttribute("result", "inserted");
				view = "views/admin/stocks/stock.jsp";
			}else if ("goinsert".equals(action)){
				request.setAttribute("action", "goinsert");
				request.setAttribute("itemList", stocksService.getAllItems());
				request.setAttribute("stocksList", stocksService.getAllStocks());
				request.setAttribute("returnScreen",request.getParameter("returnScreen") );
				view = "views/admin/stocks/stock.jsp";
			}else if ("update".equals(action)){
				stocksService.updateStocks(request);
				request.setAttribute("itemList", stocksService.getAllItems());
				request.setAttribute("stocksList", stocksService.getAllStocks());
				request.setAttribute("result", "updated");
				view = "views/admin/stocks/stock.jsp";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
