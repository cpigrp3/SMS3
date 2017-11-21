package com.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dao.SuppliesDao;
import com.entity.Supplies;
import com.ibatis.sqlmap.client.SqlMapClient;

public class SuppliesDaoImpl implements SuppliesDao{
	
	private SqlMapClient sqlMapClient;
	

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	
	@Override
	public void addRec(Map<String, Object> params) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.sqlMapClient.update("addSupplies",params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
			
		} finally {
			this.getSqlMapClient().endTransaction();
		}
		
	}

	@Override
	public void updateList(Map<String, Object> params) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();
			
			this.sqlMapClient.update("updateSupplies", params);
			
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();
			
		} catch (SQLException e){
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		} finally {
			this.getSqlMapClient().endTransaction();
		}
		
	}

		//for getting the contents of the supplies3 and supply_types3 table
	@SuppressWarnings("unchecked")
	@Override
	public List<Supplies> getSupplyList() throws SQLException {
		return (List<Supplies>) this.sqlMapClient.queryForList("getSupplyList");
	}
		//for getting the supply_type_name and supply_type_id from the supply_types3 table
	@SuppressWarnings("unchecked")
	@Override
	public List<Supplies> getSupplyName() throws SQLException {
		return (List<Supplies>) this.sqlMapClient.queryForList("getSupplyName");
	}

}
