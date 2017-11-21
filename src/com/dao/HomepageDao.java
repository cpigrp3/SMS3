package com.dao;

import java.sql.SQLException;
import java.util.Map;

public interface HomepageDao {
	public String validateLogin(Map<String, Object> params) throws SQLException;
	void updateUser(Map<String, Object> params) throws SQLException;
	public String getUsername(Map<String, Object> params) throws SQLException;
	String getUserlevel(Map<String, Object> params) throws SQLException;
}
