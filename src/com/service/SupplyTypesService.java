package com.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.entity.SupplyTypes;

public interface SupplyTypesService {
	void addNewType(HttpServletRequest request, Integer nextValId) throws SQLException;
	void updateType(HttpServletRequest request) throws SQLException;
	Integer getStNextValId(HttpServletRequest request) throws SQLException;
	List<SupplyTypes> getAllSupplyTypes() throws SQLException;
	List<SupplyTypes> validateTypeName(HttpServletRequest request) throws SQLException;
}
