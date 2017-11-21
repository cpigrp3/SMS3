package com.dao.impl;

import java.sql.SQLException;
import java.util.Map;

import com.dao.HomepageDao;
import com.ibatis.sqlmap.client.SqlMapClient;

public class HomepageDaoImpl implements HomepageDao {
private SqlMapClient sqlMapClient;
	
	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	public String validateLogin(Map<String, Object> params) throws SQLException {	
		System.out.println("Dao params = "+ params);
		return (String) this.getSqlMapClient().queryForObject("validateLogin", params);
	}

	@Override
	public void updateUser(Map<String, Object> params) throws SQLException {
		try{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.sqlMapClient.update("updateActiveTag", params);
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
		}catch (SQLException e){
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		}finally{
			this.getSqlMapClient().endTransaction();
		}
		
	}

	@Override
	public String getUsername(Map<String, Object> params) throws SQLException {
		System.out.println("Dao params = "+ params);
		return (String) this.getSqlMapClient().queryForObject("getUsername", params);
	}

	@Override
	public String getUserlevel(Map<String, Object> params) throws SQLException {
		return (String) this.getSqlMapClient().queryForObject("getUserlevel", params);
	}

}
