package com.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dao.SupplyTypesDao;
import com.entity.SupplyTypes;
import com.service.SupplyTypesService;

public class SupplyTypesServiceImpl implements SupplyTypesService{
	
	private SupplyTypesDao supplyTypesDao;
	
	public SupplyTypesDao getSupplyTypesDao() {
		return supplyTypesDao;
	}

	public void setSupplyTypesDao(SupplyTypesDao supplyTypesDao) {
		this.supplyTypesDao = supplyTypesDao;
	}

	@Override
	public void addNewType(HttpServletRequest request, Integer nextValId) throws SQLException {
		
		System.out.println("Performing addNewType() from SupplyTypeServiceImpl....");
		
		HttpSession session = request.getSession();
		//session.setAttribute("userId", "marco_user");
		String loginUser = (String) session.getAttribute("userId");
		
		Map<String, Object> params = new HashMap<>();
		params.put("supplyTypeId", nextValId);
		params.put("supplyTypeName", request.getParameter("supplyTypeName"));
		params.put("loginUser", loginUser);
		
		request.setAttribute("supplyTypeId", nextValId.toString());
		request.setAttribute("supplyTypeName", request.getParameter("supplyTypeName"));
		
		this.getSupplyTypesDao().addNewType(params);
	}
	
	@Override
	public void updateType(HttpServletRequest request) throws SQLException {
		
		System.out.println("Performing updateType() from SupplyTypeServiceImpl....");
		
		HttpSession session = request.getSession();
		//session.setAttribute("userId", "update_user");
		String loginUser = (String) session.getAttribute("userId");
		
		Map<String, Object> params = new HashMap<>();
		params.put("supplyTypeId", request.getParameter("supplyTypeId"));
		params.put("supplyTypeName", request.getParameter("supplyTypeName"));
		params.put("loginUser", loginUser);
		
		this.getSupplyTypesDao().updateType(params);
		
	}

	@Override
	public Integer getStNextValId(HttpServletRequest request) throws SQLException {
		
		return this.getSupplyTypesDao().getStNextValId();
	}

	@Override
	public List<SupplyTypes> getAllSupplyTypes() throws SQLException {
		return this.getSupplyTypesDao().getAllSupplyTypes();
	}

	@Override
	public List<SupplyTypes> validateTypeName(HttpServletRequest request) throws SQLException {
		
		System.out.println("Performing validateTypeName() from SupplyTypeServiceImpl....");
	
		Map<String, Object> params = new HashMap<>();
		params.put("supplyTypeName", request.getParameter("supplyTypeName"));
		
		System.out.println(request.getParameter("supplyTypeName"));
		
		return this.getSupplyTypesDao().validateTypeName(params);
	}

}
