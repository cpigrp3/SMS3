package com.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dao.UserDao;
import com.entity.User;
import com.ibatis.sqlmap.client.SqlMapClient;

public class UserDaoImpl implements UserDao {

	private SqlMapClient sqlMapClient;
	
	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}
	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@Override
	public void addUser(Map<String, Object> params) throws SQLException 
	{
		try 
		{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.sqlMapClient.update("addUser",params);
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
		} catch (SQLException e) 
		{
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		}
		finally{
			this.getSqlMapClient().endTransaction();
		}
	}
	/*public List<User> getAllUsers() throws SQLException {
		return (List<User>) this.getSqlMapClient().queryForList("getAllUsers");
	}*/
}
