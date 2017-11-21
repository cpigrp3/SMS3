package com.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.dao.SupplyTypesDao;
import com.entity.SupplyTypes;
import com.ibatis.sqlmap.client.SqlMapClient;

public class SupplyTypesDaoImpl implements SupplyTypesDao {

	private SqlMapClient sqlMapClient;

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient sqlMapClient) {
		this.sqlMapClient = sqlMapClient;
	}

	@Override
	public void addNewType(Map<String, Object> params) throws SQLException {

		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();

			this.sqlMapClient.update("saveRec", params);

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
	public void updateType(Map<String, Object> params) throws SQLException {

		try {
			this.sqlMapClient.startTransaction();
			this.sqlMapClient.getCurrentConnection().setAutoCommit(false);
			this.sqlMapClient.startBatch();

			this.sqlMapClient.update("updateRec", params);

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
	public Integer getStNextValId() throws SQLException {

		return (Integer) this.getSqlMapClient().queryForObject("stNextValId");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SupplyTypes> getAllSupplyTypes() throws SQLException {
		return (List<SupplyTypes>) this.getSqlMapClient().queryForList("getAllSupplyTypes");
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SupplyTypes> validateTypeName(Map<String, Object> params) throws SQLException {

		return (List<SupplyTypes>) this.getSqlMapClient().queryForList("validateTypeName", params);
	}

}
