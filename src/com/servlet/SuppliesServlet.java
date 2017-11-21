package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.service.SuppliesService;

public class SuppliesServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String view = "";
		
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/resource/applicationContext.xml");
		SuppliesService suppliesService = (SuppliesService) context.getBean("suppliesService");
		
		try{
			request.setAttribute("supplyName", suppliesService.getSupplyName());
			if("cancel".equals(action)){
				request.setAttribute("supplyList", suppliesService.getSupplyList());
				view = "views/admin/maintenance/supplies/supplies.jsp";
			} else if("addNew".equals(action)){
				request.setAttribute("supplyName", suppliesService.getSupplyName());
				view = "views/admin/maintenance/supplies/suppliesAdd.jsp";
			} else if("save".equals(action)){
				suppliesService.addRec(request);
				request.setAttribute("supplyList", suppliesService.getSupplyList());
				view = "views/admin/maintenance/supplies/supplies.jsp";
			} else if ("cancelHome".equals(action)){
				request.setAttribute("supplyList", suppliesService.getSupplyList());
				view = "views/admin/maintenance/supplies/supplies.jsp";
			} else if ("update".equals(action)){
				suppliesService.updateList(request);
				request.setAttribute("supplyList", suppliesService.getSupplyList());
				view = "views/admin/maintenance/supplies/supplies.jsp";
			}
			
		} catch(Exception e){
			request.setAttribute("message", e.getMessage());
			view = "views/admin/maintenance/supplies/suppliesMessage.jsp";
			e.printStackTrace();
		} finally {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}
}
