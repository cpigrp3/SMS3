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

import com.service.UserService;

public class UserServlet extends HttpServlet
{
	private static final long serialVersionUID = 1;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String action=req.getParameter("action");
		String view = "";
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/resource/applicationContext.xml");
		UserService userService = (UserService) context.getBean("userService");
		if ("addNewUser".equals(action)) 
		{
			
			view = "views/admin/maintenance/user/addNewUser.jsp";

		}
		else if ("cancelAddUser".equals(action))
		{
			view = "views/admin/maintenance/user/user.jsp";
		}
		else if ("saveNewUser".equals(action))
		{
			try {
				userService.addUser(req);
				System.out.println("save user");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//view = "views/admin/maintenance/user/user.jsp";
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}
}
