package com.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public interface HomepageService {
	String validateUser(HttpServletRequest request) throws SQLException;
	void updateUser (HttpServletRequest request) throws SQLException;
	String getUsername(HttpServletRequest request) throws SQLException;
	String getUserlevel(HttpServletRequest request) throws SQLException;
}
