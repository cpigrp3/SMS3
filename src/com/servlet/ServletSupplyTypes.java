package com.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.entity.SupplyTypes;
import com.service.SupplyTypesService;

public class ServletSupplyTypes extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String view = "";

		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("/com/resource/applicationContext.xml");
		SupplyTypesService supplyTypesService = (SupplyTypesService) context.getBean("supplyTypesService");

		try {

			if ("add".equals(action)) {
				view = "views/admin/maintenance/types/addNewTypes.jsp";

			} else if ("saveNewType".equals(action)) {
				Integer stNextValId = supplyTypesService.getStNextValId(request);
				supplyTypesService.addNewType(request, stNextValId);

				view = "views/admin/maintenance/types/addNewTypes.jsp";

			} else if ("cancelNewType".equals(action)) {
				request.setAttribute("supplyTypesList", supplyTypesService.getAllSupplyTypes());

				view = "views/admin/maintenance/types/types.jsp";
			} else if ("update".equals(action)) {
				supplyTypesService.updateType(request);
				request.setAttribute("supplyTypesList", supplyTypesService.getAllSupplyTypes());

				view = "views/admin/maintenance/types/types.jsp";
			} else if ("validateTypeName".equals(action)) {
				request.setAttribute("message", "");

				if (supplyTypesService.validateTypeName(request).size() != 0) {
					request.setAttribute("message", "A supply type with same name already exists.");

					view = "views/admin/maintenance/types/message.jsp";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}

	}

}
