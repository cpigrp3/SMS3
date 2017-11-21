package com.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dao.SupplyIssuanceDao;
import com.entity.Departments;
import com.entity.IssuedSupplies;
import com.entity.Items;
import com.ibatis.sqlmap.client.SqlMapClient;

public class SupplyIssuanceDaoImpl implements SupplyIssuanceDao{

	private SqlMapClient sqlMapClient;
	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@Override
	public void issueRequest(Map<String, Object> params) throws SQLException {
		try{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.sqlMapClient.update("issueReq", params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
		}catch(SQLException e){
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		}finally{
			this.getSqlMapClient().endTransaction();
		}
	}
	@Override
	public void updateRequest(Map<String, Object> params) throws SQLException {
		try{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.sqlMapClient.update("updateReq", params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
		}catch(SQLException e){
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		}finally{
			this.getSqlMapClient().endTransaction();
		}
	}
	
	@Override
	public void updateQuantity(Map<String, Object> params) throws SQLException {
		try{
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.sqlMapClient.update("updateQuantity", params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
		}catch(SQLException e){
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		}finally{
			this.getSqlMapClient().endTransaction();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Departments> getAllDepartments() throws SQLException {
		return (List<Departments>)this.sqlMapClient.queryForList("getAllDepartments");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Items> getAllItems() throws SQLException {
		return (List<Items>) this.sqlMapClient.queryForList("getAllItems");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<IssuedSupplies> getIssuedSupplies() throws SQLException {
		return (List<IssuedSupplies>) this.sqlMapClient.queryForList("getIssuedSupplies");
	}

	@Override
	public Integer getActualCount(Map<String, Object> params) throws SQLException {
		return (Integer) this.sqlMapClient.queryForObject("getActualCount", params);
	}

	@Override
	public Integer getReorderLevel(Map<String, Object> params) throws SQLException {
		return (Integer) this.sqlMapClient.queryForObject("getReorderLevel", params);
	}

	@Override
	public Integer getQuantity(Map<String, Object> params) throws SQLException {
		return (Integer) this.sqlMapClient.queryForObject("getQuantity", params);
	}

}
