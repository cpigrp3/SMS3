package com.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.entity.Departments;
import com.entity.IssuedSupplies;
import com.entity.Items;

public interface SupplyIssuanceService {
	void issueRequest(HttpServletRequest request)throws SQLException;
	void updateRequest(HttpServletRequest request) throws SQLException;
	void updateQuantity(HttpServletRequest request) throws SQLException;
	
	List<Items> getAllItems() throws SQLException;
	List<Departments> getAllDepartments() throws SQLException;
	List<IssuedSupplies> getIssuedSupplies() throws SQLException;
	
	public Integer getActualCount(HttpServletRequest request) throws SQLException;
	public Integer getReorderLevel(HttpServletRequest request) throws SQLException;
	public Integer getQuantity(HttpServletRequest request) throws SQLException;
}
