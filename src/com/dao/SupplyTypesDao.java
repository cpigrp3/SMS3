package com.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.entity.SupplyTypes;

public interface SupplyTypesDao {
	void addNewType(Map<String, Object> params) throws SQLException;
	void updateType(Map<String, Object> params) throws SQLException;
	Integer getStNextValId() throws SQLException;
	List<SupplyTypes> getAllSupplyTypes() throws SQLException;
	List<SupplyTypes> validateTypeName(Map<String, Object> params) throws SQLException;
}
