package com.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.entity.User;

public interface UserService 
{
	void addUser(HttpServletRequest request) throws SQLException;
	//List<User> getAllUsers() throws SQLException;
}
