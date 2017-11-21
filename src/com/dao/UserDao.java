package com.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.entity.User;
public interface UserDao {
	void addUser(Map<String,Object> params)throws SQLException;
	//List<User> getAllUsers()throws SQLException;
}
