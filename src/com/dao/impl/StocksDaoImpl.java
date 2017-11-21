package com.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dao.StocksDao;
import com.entity.Stocks;
import com.ibatis.sqlmap.client.SqlMapClient;

public class StocksDaoImpl implements StocksDao {
	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@SuppressWarnings("unchecked")
	public List<Stocks> getAllItems() throws SQLException {
		return (List<Stocks>) this.getSqlMapClient().queryForList("getAllItem");
	}

	@SuppressWarnings("unchecked")
	public List<Stocks> getAllStocks() throws SQLException {
		return (List<Stocks>) this.getSqlMapClient().queryForList("getAllStock");
	}

	@Override
	public void addStock(Map<String, Object> params) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();

			this.sqlMapClient.update("addStock", params);
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();

		} catch (SQLException e) {
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		} finally {
			this.getSqlMapClient().endTransaction();
		}
	}

	@Override
	public void updateStock(Map<String, Object> params) throws SQLException {
		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();

			this.sqlMapClient.update("updateStock", params);
			this.sqlMapClient.executeBatch();
			this.sqlMapClient.getCurrentConnection().commit();

		} catch (SQLException e) {
			this.sqlMapClient.getCurrentConnection().rollback();
			throw e;
		} finally {
			this.getSqlMapClient().endTransaction();
		}
		
	}
}
