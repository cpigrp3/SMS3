package com.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.service.HomepageService;
import com.service.StocksService;
import com.service.SuppliesService;
import com.service.SupplyIssuanceService;
import com.service.SupplyTypesService;

@SuppressWarnings("serial")
public class ServletMenu extends HttpServlet{
	@SuppressWarnings("unused")
	private static final long serialVersionID=1;
	private DateFormat dateFormat = new SimpleDateFormat("MM/dd/YYYY");	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String action = req.getParameter("action");
		String view="";
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/resource/applicationContext.xml");
		SupplyTypesService typesService = (SupplyTypesService) context.getBean("supplyTypesService");
		HomepageService homepageService = (HomepageService) context.getBean("homepageService");
		StocksService stocksService = (StocksService) context.getBean("stocksService");
		SupplyIssuanceService supplyIssuanceService = (SupplyIssuanceService) context.getBean("supplyIssuanceService");
		SuppliesService suppliesService = (SuppliesService) context.getBean("suppliesService");
		HttpSession session = req.getSession();
		//WHEN CLICK THE LOGIN PAGE GO TO HOME PAGE
		try{
		if(("login").equals(action))
		{	
			String loginStat= homepageService.validateUser(req);
			System.out.println(loginStat);
			if(loginStat.equals("Y")){
				System.out.println("y");
				session.setAttribute("userId",req.getParameter("userName"));
				session.setAttribute("Userlevel",homepageService.getUserlevel(req));
				session.setAttribute("Username",homepageService.getUsername(req));
	
				req.setAttribute("Username", session.getAttribute("Username"));
				req.setAttribute("Userlevel", session.getAttribute("Userlevel"));
	        	view = "views/admin/homepage.jsp";
			}else{
				req.setAttribute("chkSession", "Y");
				req.setAttribute("loginStat", loginStat);
				view = "views/index.jsp";
			}	
		}
		else if("checkSession".equals(action))
		{
			try{
			System.out.println("sesssion");
			session = req.getSession();
			String userSession = (String) session.getAttribute("userId");
			req.setAttribute("userName", userSession);
			System.out.println(userSession +" = "+ session.getAttribute("loginStat"));
			if (userSession == null) {
				req.setAttribute("chkSession", "Y");
				view = "views/index.jsp";
			} else {
				req.setAttribute("Username", homepageService.getUsername(req));
				req.setAttribute("Userlevel", homepageService.getUserlevel(req));
				view = "views/admin/homepage.jsp";
			}
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		/* THIS IS A MENU BAR OF ADMIN PAGE WHEN CLICK THE FOLLOWING
		 * HOME: GOTO TO HOME PAGE (link: views/admin/homepage.jsp)
		 * MAINTENANCE: GOTO TO MAINTENANCE MODULE (link: views/admin/maintenance/index.jsp)
		 * ISSUE: GOTO TO ISSUE SUPPLIES MODULE (link: views/admin/issueSupplies/issueSupplies.jsp)
		 */
		else if(("home").equals(action))
		{
			view="views/admin/homepage.jsp";
		}
		else if(("maintenance").equals(action))
		{
			view="views/admin/maintenance/index.jsp";
		}
		else if(("issue").equals(action))
		{	
			String lastUser = (String) session.getAttribute("userId");
			session.setAttribute("dateToday", dateFormat.format(new Date()));
			req.setAttribute("lastUser", lastUser);
			req.setAttribute("dateToday", session.getAttribute("dateToday"));
			req.setAttribute("deptNameList", supplyIssuanceService.getAllDepartments());
			req.setAttribute("itemNameList", supplyIssuanceService.getAllItems());
			req.setAttribute("issuedSuppliesList", supplyIssuanceService.getIssuedSupplies());
			view="views/admin/issueSupplies/issueRequest.jsp";
		}
		else if(("stock").equals(action))
		{	
			req.setAttribute("itemList", stocksService.getAllItems());
			req.setAttribute("stocksList", stocksService.getAllStocks());
			req.setAttribute("returnScreen","stock" );
			view = "views/admin/stocks/stock.jsp";
		}
		/*
		 * END OF MENU BAR ACTIONS
		 */
		
		/* THIS IS A MENU OPTION OF MAINTENANCE WHEN CLICK THE FOLLOWING
		 * USER: GOTO TO USER MODULE 
		 * TYPES: GOTO TO TYPES MODULE
		 * SUPPLIES: GOTO TO SUPPLIES MODULE
		 */
		else if(("user").equals(action))
		{	
			view="views/admin/maintenance/user/user.jsp";
		}
		else if(("types").equals(action))
		{	
			
				req.setAttribute("supplyTypesList", typesService.getAllSupplyTypes());
			view="views/admin/maintenance/types/types.jsp";
		}
		else if(("supplies").equals(action))
		{
			req.setAttribute("supplyList", suppliesService.getSupplyList());
			view="views/admin/maintenance/supplies/supplies.jsp";
		}
		/*
		 * END OF MENU OPTION OF MAINTENANCE
		 */
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dispatcher=req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String view = "";

		if ("delSession".equals(action)) {
			HttpSession session = request.getSession();
			session.invalidate();
			view = "views/index.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);

	}
}
