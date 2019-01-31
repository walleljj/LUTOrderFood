package com.lut.dto;

import java.util.Date;

public class OrderItem {
	private String orderid;
	private Date paytime;
	private String resphoto;
	private String resname;
	private int allnumber;
	private double allmoney;
	private int state;
	
	public String getResname() {
		return resname;
	}
	public void setResname(String resname) {
		this.resname = resname;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public Date getPaytime() {
		return paytime;
	}
	public void setPaytime(Date paytime) {
		this.paytime = paytime;
	}
	public String getResphoto() {
		return resphoto;
	}
	public void setResphoto(String resphoto) {
		this.resphoto = resphoto;
	}
	public int getAllnumber() {
		return allnumber;
	}
	public void setAllnumber(int allnumber) {
		this.allnumber = allnumber;
	}
	public double getAllmoney() {
		return allmoney;
	}
	public void setAllmoney(double allmoney) {
		this.allmoney = allmoney;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	

}
