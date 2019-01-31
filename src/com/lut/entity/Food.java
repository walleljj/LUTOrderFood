package com.lut.entity;

public class Food {

	private int foodid;
	private String resid;
	private String foodname;
	private String foodphoto;
	private double foodprice;
	private int state;

	public int getFoodid() {
		return foodid;
	}

	public void setFoodid(int foodid) {
		this.foodid = foodid;
	}

	public String getResid() {
		return resid;
	}

	public void setResid(String resid) {
		this.resid = resid;
	}



	public String getFoodname() {
		return foodname;
	}

	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}

	public String getFoodphoto() {
		return foodphoto;
	}

	public void setFoodphoto(String foodphoto) {
		this.foodphoto = foodphoto;
	}

	public double getFoodprice() {
		return foodprice;
	}

	public void setFoodprice(double foodprice) {
		this.foodprice = foodprice;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Food [foodid=" + foodid + ", resid=" + resid + ", foodname=" + foodname + ", foodphoto=" + foodphoto
				+ ", foodprice=" + foodprice + ", state=" + state + "]";
	}
	

	

}
