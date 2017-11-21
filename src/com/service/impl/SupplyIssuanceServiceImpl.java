package com.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dao.SupplyIssuanceDao;
import com.entity.Departments;
import com.entity.IssuedSupplies;
import com.entity.Items;
import com.service.SupplyIssuanceService;


public class SupplyIssuanceServiceImpl implements SupplyIssuanceService{

	private SupplyIssuanceDao supplyIssuanceDao;
	
	public SupplyIssuanceDao getSupplyIssuanceDao() {
		return supplyIssuanceDao;
	}

	public void setSupplyIssuanceDao(SupplyIssuanceDao supplyIssuanceDao) {
		this.supplyIssuanceDao = supplyIssuanceDao;
	}

	@Override
	public void issueRequest(HttpServletRequest request) throws SQLException {
		HttpSession session = request.getSession();
		String lastUser = (String) session.getAttribute("userId");
		Map<String, Object> params = new HashMap<>();
		params.put("supplyId", request.getParameter("supplyId"));
		params.put("requestor", request.getParameter("requestor"));
		params.put("quantity", request.getParameter("quantity"));
		params.put("deptId", request.getParameter("deptId"));
		params.put("lastUser", lastUser);

		this.getSupplyIssuanceDao().issueRequest(params);
	} 

	@Override
	public void updateRequest(HttpServletRequest request) throws SQLException {
		HttpSession session = request.getSession();
		String lastUser = (String) session.getAttribute("userId");
		
		Map<String, Object> params = new HashMap<>();
		params.put("issueId", request.getParameter("issueId"));
		params.put("supplyId", request.getParameter("supplyId"));
		params.put("quantity", request.getParameter("quantity"));
		params.put("lastUser", lastUser);

		this.getSupplyIssuanceDao().updateRequest(params);
	}
	
	@Override
	public void updateQuantity(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		
		params.put("supplyId", request.getParameter("supplyId"));
		params.put("newCount", getActualCount(request) - (Integer.parseInt(request.getAttribute("quantity").toString())));
	
		System.out.println("eto yuhnbg sadf sdf: "+ getActualCount(request));
		this.getSupplyIssuanceDao().updateQuantity(params);;
	}

	@Override
	public List<Items> getAllItems() throws SQLException {
		return this.getSupplyIssuanceDao().getAllItems();
	}

	@Override
	public List<Departments> getAllDepartments() throws SQLException {
		return this.getSupplyIssuanceDao().getAllDepartments();
	}
	
	@Override
	public List<IssuedSupplies> getIssuedSupplies() throws SQLException {
		return this.getSupplyIssuanceDao().getIssuedSupplies();
	}
	
	@Override
	public Integer getActualCount(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("supplyId", request.getParameter("supplyId"));
		return this.getSupplyIssuanceDao().getActualCount(params);
	}

	@Override
	public Integer getReorderLevel(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("supplyId", request.getParameter("supplyId"));
		return this.getSupplyIssuanceDao().getReorderLevel(params);
	}

	@Override
	public Integer getQuantity(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("issueId", request.getParameter("issueId"));
		return this.getSupplyIssuanceDao().getQuantity(params);
	}

	
}
