package com.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.entity.Departments;
import com.entity.IssuedSupplies;
import com.entity.Items;

public interface SupplyIssuanceDao {
	
	void issueRequest(Map<String, Object> params) throws SQLException;
	void updateRequest(Map<String, Object> params) throws SQLException;
	void updateQuantity(Map<String, Object> params) throws SQLException;
	
	List<Departments> getAllDepartments() throws SQLException;
	List<Items> getAllItems() throws SQLException;
	List<IssuedSupplies> getIssuedSupplies() throws SQLException;
	
	public Integer getActualCount(Map<String, Object> params) throws SQLException;
	public Integer getReorderLevel(Map<String, Object> params) throws SQLException;
	public Integer getQuantity(Map<String, Object> params) throws SQLException; 
}
