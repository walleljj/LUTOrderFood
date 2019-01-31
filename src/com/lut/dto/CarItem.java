package com.lut.dto;

import com.lut.entity.Food;

public class CarItem {
	private Food food;
	private int qty;
	
	public Food getFood() {
		return food;
	}
	public void setFood(Food food) {
		this.food = food;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	

}
