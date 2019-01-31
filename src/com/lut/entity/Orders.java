package com.lut.entity;

import java.util.Date;
import java.util.List;

public class Orders {

	private String orderid;
	private String userid;
	private String resid;
	private String completeaddress;
	private String receivername;
	private String tel;
	private Date paytime;
	private int state;
	private double allmoney;
	private List<Item> items;
	

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public String getCompleteaddress() {
		return completeaddress;
	}

	public void setCompleteaddress(String completeaddress) {
		this.completeaddress = completeaddress;
	}

	public String getReceivername() {
		return receivername;
	}

	public void setReceivername(String receivername) {
		this.receivername = receivername;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getResid() {
		return resid;
	}

	public void setResid(String resid) {
		this.resid = resid;
	}

	public Date getPaytime() {
		return paytime;
	}

	public void setPaytime(Date paytime) {
		this.paytime = paytime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public double getAllmoney() {
		return allmoney;
	}

	public void setAllmoney(double allmoney) {
		this.allmoney = allmoney;
	}

}
