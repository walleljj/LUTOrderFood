package com.lut.entity;

public class Item {

	private int aid;
	private int itemid;
	private String orderid;
	private double listprice;
	private int qty;

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public double getListprice() {
		return listprice;
	}

	public void setListprice(double listprice) {
		this.listprice = listprice;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

}
