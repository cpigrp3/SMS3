package com.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dao.SuppliesDao;
import com.entity.Supplies;
import com.service.SuppliesService;

public class SuppliesServiceImpl implements SuppliesService{
	
	private SuppliesDao suppliesDao;
	
	public SuppliesDao getSuppliesDao() {
		return suppliesDao;
	}

	public void setSuppliesDao(SuppliesDao suppliesDao) {
		this.suppliesDao = suppliesDao;
	}


	@Override
	public void addRec(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		
		HttpSession session = request.getSession();
		//session.setAttribute("currentUser", "jr_magsino");
		String lastUser = (String) session.getAttribute("userId");
		
		params.put("supplyTypeId", request.getParameter("supplyTypeId"));
		params.put("itemName", request.getParameter("itemName"));
		params.put("itemUnit", request.getParameter("itemUnit"));
		params.put("obsoleteTag", request.getParameter("obsoleteTag"));
		params.put("location", request.getParameter("location"));
		params.put("reorderLevel", request.getParameter("reorderLevel"));
		params.put("actualCount", request.getParameter("actualCount"));
		params.put("remarks", request.getParameter("remarks"));
		params.put("lastUser", lastUser);
		
		this.getSuppliesDao().addRec(params);
		
	}

	@Override
	public void updateList(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		
		HttpSession session = request.getSession();
		String lastUser = (String) session.getAttribute("userId");
		
		params.put("supplyId", request.getParameter("supplyId"));
		params.put("itemName", request.getParameter("itemName"));
		params.put("itemUnit", request.getParameter("itemUnit"));
		params.put("obsoleteTag", request.getParameter("obsoleteTag"));
		params.put("location", request.getParameter("location"));
		params.put("reorderLevel", request.getParameter("reorderLevel"));
		params.put("remarks", request.getParameter("remarks"));
		params.put("lastUser", lastUser);
		
		this.getSuppliesDao().updateList(params);
		
	}

		//for getting the contents of the supplies3 and supply_types3 table
	@Override
	public List<Supplies> getSupplyList() throws SQLException {
		return this.getSuppliesDao().getSupplyList();
	}
		//for getting the supply_type_name and supply_type_id from the supply_types3 table
	@Override
	public List<Supplies> getSupplyName() throws SQLException {
		return this.getSuppliesDao().getSupplyName();
	}

}
