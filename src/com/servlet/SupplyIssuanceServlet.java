package com.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.service.SupplyIssuanceService;

public class SupplyIssuanceServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String view = "";
		String message = "";
		
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/resource/applicationContext.xml");
		SupplyIssuanceService supplyIssuanceService = (SupplyIssuanceService)context.getBean("supplyIssuanceService");
	
		try{
		
			request.setAttribute("deptNameList", supplyIssuanceService.getAllDepartments());
			request.setAttribute("itemNameList", supplyIssuanceService.getAllItems());
			request.setAttribute("issuedSuppliesList", supplyIssuanceService.getIssuedSupplies());
			
			if("cancel".equals(action)){	
				view="views/admin/homepage.jsp";
			}else if("saveRequest".equals(action)){
				Integer actualCount = (Integer)supplyIssuanceService.getActualCount(request);
				Integer reorderLevel = (Integer) supplyIssuanceService.getReorderLevel(request);
				Integer quantity1 = Integer.parseInt(request.getParameter("quantity"));
				//request.setAttribute("issuedSuppliesList", supplyIssuanceService.getIssuedSupplies());
				
				// Checks if the actual count of the item is greater than or equal to the quantity 
				if (actualCount >= quantity1){
					request.setAttribute("quantity", quantity1);
					supplyIssuanceService.issueRequest(request);
					supplyIssuanceService.updateQuantity(request);
					
					actualCount = (Integer)supplyIssuanceService.getActualCount(request);
					System.out.println("\n\n"+actualCount);
					
					// Checks if the actual count is below or equal to the reorder level of the item 
					if(actualCount <= reorderLevel){
						 //request.setAttribute("issuedSuppliesList", supplyIssuanceService.getIssuedSupplies());
						 message = "*NOTE: The actual count of "+request.getParameter("itemName")+" is below or equal to the reorder level";
					}else{
						 message = "";
					}
					
					request.setAttribute("message", message);
					//request.setAttribute("issuedSuppliesList", supplyIssuanceService.getIssuedSupplies());
					view="views/admin/issueSupplies/issueSupplies.jsp";
				}else{
					message = request.getParameter("itemName")+" has only "+ actualCount + " items, which is below the requested number of items.";
					
					request.setAttribute("message", message);
					//request.setAttribute("issuedSuppliesList", supplyIssuanceService.getIssuedSupplies());
					view = "views/admin/issueSupplies/issueSuppliesMessage.jsp";
				}
				
				request.setAttribute("issuedSuppliesList", supplyIssuanceService.getIssuedSupplies());
			}else if("issueRequest".equals(action)){
				request.setAttribute("issuedSuppliesList", supplyIssuanceService.getIssuedSupplies());
				view="views/admin/issueSupplies/issueRequest.jsp";
				
			}else if ("issueHome".equals(action) || "issueSupplies".equals(action)){
				view = "views/admin/issueSupplies/issueSupplies.jsp";
				
			}else if ("updateRecord".equals(action)){
				Integer supplyid = Integer.parseInt(request.getParameter("supplyId"));
				request.setAttribute("supplyId", supplyid);
				Integer actualCount = (Integer)supplyIssuanceService.getActualCount(request);
				Integer reorderLevel = (Integer) supplyIssuanceService.getReorderLevel(request);
				Integer quantity1 = (Integer) supplyIssuanceService.getQuantity(request);
				Integer newQuantity = Integer.parseInt(request.getParameter("quantity"));
				Integer count = newQuantity - quantity1;
				
				System.out.println(request.getParameter("supplyId"));
				System.out.println("Old quantity: "+ quantity1 + "   New Quantity: "+ newQuantity);
				System.out.println("Actual Count: " + actualCount);
				System.out.println("Count: "+count);
				System.out.println("Supply ID: "+supplyid);
				request.setAttribute("quantity", count);
				System.out.println("quantity: "+request.getAttribute("quantity"));
				System.out.println("Reorder level: "+ reorderLevel);
				
				if(actualCount>=count){
					supplyIssuanceService.updateRequest(request);
					supplyIssuanceService.updateQuantity(request);
					
					actualCount = (Integer)supplyIssuanceService.getActualCount(request);
					System.out.println("Actual count of the item is: "+ actualCount);
					if(actualCount <= reorderLevel){
						 //request.setAttribute("issuedSuppliesList", supplyIssuanceService.getIssuedSupplies());
						 message = "*NOTE: The actual count of "+request.getParameter("itemName")+" is below or equal to the reorder level";
						 view = "views/admin/issueSupplies/issueSupplies.jsp";	
					}else{
						 //request.setAttribute("issuedSuppliesList", supplyIssuanceService.getIssuedSupplies());
						 message = "";
						 view = "views/admin/issueSupplies/issueSupplies.jsp";
					}
					
					request.setAttribute("issuedSuppliesList", supplyIssuanceService.getIssuedSupplies());
				}else{
					message = request.getParameter("itemName")+" has only "+ actualCount + " items, which is below the requested number of items.";
					request.setAttribute("message", message);
					view = "views/admin/issueSupplies/issueSuppliesMessage.jsp";
				}
				request.setAttribute("message", message);
				System.out.println(message);
			}

		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("message", e.getMessage());
			view = "views/admin/issueSupplies/issueSuppliesMessage.jsp";
		}finally{
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}

	
}
