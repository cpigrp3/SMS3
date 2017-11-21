package com.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.entity.Stocks;

public interface StocksDao {
    List<Stocks> getAllItems() throws SQLException;
    List<Stocks> getAllStocks() throws SQLException;
    void addStock(Map<String,Object> params) throws SQLException;
    void updateStock(Map<String,Object> params) throws SQLException;
}
