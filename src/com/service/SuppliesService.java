package com.service;

import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.entity.Supplies;

public interface SuppliesService {
		
	void addRec(HttpServletRequest request) throws SQLException;
	void updateList(HttpServletRequest request) throws SQLException;
	List<Supplies> getSupplyList() throws SQLException;
	List<Supplies> getSupplyName() throws SQLException;
}
