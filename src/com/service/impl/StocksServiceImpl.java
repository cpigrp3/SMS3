package com.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dao.StocksDao;
import com.entity.Stocks;
import com.service.StocksService;

public class StocksServiceImpl implements StocksService {
	private StocksDao stocksDao;

	public StocksDao getStocksDao() {
		return stocksDao;
	}

	public void setStocksDao(StocksDao stocksDao) {
		this.stocksDao = stocksDao;
	}

	public List<Stocks> getAllItems() throws SQLException {
		return this.getStocksDao().getAllItems();
	}

	public List<Stocks> getAllStocks() throws SQLException {
		return this.getStocksDao().getAllStocks();
	}

	public void addStocks(HttpServletRequest request) throws SQLException {
		this.stocksDao.addStock(this.initiateParam(request));
	}

	public void updateStocks(HttpServletRequest request) throws SQLException {
		this.stocksDao.updateStock(this.initiateParam(request));
	}

	public Map<String, Object> initiateParam(HttpServletRequest request) throws SQLException 
	{
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("userId");
		Map<String, Object> params = new HashMap<>();
		params.put("stockId", request.getParameter("stkStkId"));
		params.put("suppId", request.getParameter("stkSuppId"));
		params.put("dateAdd", request.getParameter("stkDateAdd"));
		params.put("purDate", request.getParameter("stkPurDate"));
		params.put("refNo", request.getParameter("stkRefNo"));
		params.put("quantity", request.getParameter("stkQuantity"));
		params.put("userId",loginUser);
		return params;
	}

}
