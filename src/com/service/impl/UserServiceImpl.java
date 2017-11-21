package com.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.dao.UserDao;
import com.entity.User;
import com.service.UserService;

public class UserServiceImpl implements UserService {

	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void addUser(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("USER_ID", request.getParameter("userId"));
		params.put("PASSWORD", request.getParameter("password"));
		params.put("FIRST_NAME", request.getParameter("firstName"));
		params.put("LAST_NAME", request.getParameter("lastName"));
		params.put("MIDDLE_INITIAL", request.getParameter("middleInitial"));
		params.put("EMAIL", request.getParameter("email"));
		params.put("ACTIVE_TAG", request.getParameter("active"));
		params.put("ACCESS_LEVEL", request.getParameter("accessLevel"));
		params.put("LAST_USER", request.getParameter("lastUser"));
		this.getUserDao().addUser(params);
	}
}
