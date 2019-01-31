package com.lut.entity;

public class Restaurant {

	private String resid;
	private String resname;
	private String pwd;
	private String resdes;
	private String tel;
	private String resphoto1;
	private String resphoto2;
	private String resaddres;
	private String resnotices;
	private String resarrivetime;
	private double resminmoney;
	private double respipage;
	private int state;
	

	@Override
	public String toString() {
		return "Restaurant [resid=" + resid + ", resname=" + resname + ", pwd=" + pwd + ", resdes=" + resdes
				+ ", resphoto1=" + resphoto1 + ", resphoto2=" + resphoto2 + ", resaddres=" + resaddres + ", resnotices="
				+ resnotices + ", resarrivetime=" + resarrivetime + ", resminmoney=" + resminmoney + ", respipage="
				+ respipage + ", state=" + state + "]";
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getResid() {
		return resid;
	}

	public void setResid(String resid) {
		this.resid = resid;
	}

	public String getResname() {
		return resname;
	}

	public void setResname(String resname) {
		this.resname = resname;
	}

	public String getResdes() {
		return resdes;
	}

	public void setResdes(String resdes) {
		this.resdes = resdes;
	}

	public String getResphoto1() {
		return resphoto1;
	}

	public void setResphoto1(String resphoto1) {
		this.resphoto1 = resphoto1;
	}

	public String getResphoto2() {
		return resphoto2;
	}

	public void setResphoto2(String resphoto2) {
		this.resphoto2 = resphoto2;
	}

	public String getResaddres() {
		return resaddres;
	}

	public void setResaddres(String resaddres) {
		this.resaddres = resaddres;
	}

	public String getResnotices() {
		return resnotices;
	}

	public void setResnotices(String resnotices) {
		this.resnotices = resnotices;
	}

	public String getResarrivetime() {
		return resarrivetime;
	}

	public void setResarrivetime(String resarrivetime) {
		this.resarrivetime = resarrivetime;
	}

	public double getResminmoney() {
		return resminmoney;
	}

	public void setResminmoney(double resminmoney) {
		this.resminmoney = resminmoney;
	}

	public double getRespipage() {
		return respipage;
	}

	public void setRespipage(double respipage) {
		this.respipage = respipage;
	}

}
