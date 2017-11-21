package com.entity;

public class Stocks {
       private String itemName;
       private String stockId;
       private Integer suppId;
       private Integer quantity;
       private String refNo;
       private String dateAdd;
       private String purDate;
       private String updateBy;
       private String updateLast;
       

	public String getStockId() {
		return stockId;
	}

	public void setStockId(String stockId) {
		this.stockId = stockId;
	}

	public String getRefNo() {
		return refNo;
	}

	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}

	public String getDateAdd() {
		return dateAdd;
	}

	public void setDateAdd(String dateAdd) {
		this.dateAdd = dateAdd;
	}

	public String getPurDate() {
		return purDate;
	}

	public void setPurDate(String purDate) {
		this.purDate = purDate;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public String getUpdateLast() {
		return updateLast;
	}

	public void setUpdateLast(String updateLast) {
		this.updateLast = updateLast;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getSuppId() {
		return suppId;
	}

	public void setSuppId(Integer suppId) {
		this.suppId = suppId;
	}
	
	
}
