package com.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.entity.Supplies;

public interface SuppliesDao {
	
	void addRec(Map<String, Object> params) throws SQLException;
	void updateList(Map<String, Object> params) throws SQLException;
	List<Supplies> getSupplyList()throws SQLException;
	List<Supplies> getSupplyName() throws SQLException;
	
}
