package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ServletMenu extends HttpServlet{
	@SuppressWarnings("unused")
	private static final long serialVersionID=1;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String action = req.getParameter("action");
		System.out.println(action);
		String view="";
		if(("login").equals(action))
		{
			view="views/admin/homepage.jsp";
		}
		else if(("maintenance").equals(action))
		{
			view="views/admin/maintenance/index.jsp";
		}
		else if(("issue").equals(action))
		{	
			view="views/admin/maintenance/stocks.jsp";
		}
		else if(("user").equals(action))
		{	
			view="views/admin/maintenance/user/user.jsp";
		}
		else if(("types").equals(action))
		{	
			view="views/admin/maintenance/types/types.jsp";
		}
		else if(("supplies").equals(action))
		{
			view="views/admin/maintenance/supplies/supplies.jsp";
		}
		RequestDispatcher dispatcher=req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
}
