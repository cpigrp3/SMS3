package com.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.entity.Stocks;


public interface StocksService {
    List<Stocks> getAllItems() throws SQLException;
    List<Stocks> getAllStocks() throws SQLException;
    void addStocks(HttpServletRequest request) throws SQLException;
    void updateStocks(HttpServletRequest request) throws SQLException;
}
