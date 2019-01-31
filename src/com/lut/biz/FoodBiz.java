package com.lut.biz;

import java.util.ArrayList;
import java.util.List;

import com.lut.dao.FoodDao;
import com.lut.entity.Food;
import com.lut.entity.Type;

public class FoodBiz {

	public List<Food> findAllFoodByResId(String resid)throws Exception {
		// TODO Auto-generated method stub
		List<Food> lu = new ArrayList<>();
		
		FoodDao dao = new FoodDao();
		
		try {
			lu = dao.findAllFoodByResId(resid);
		} finally {
			// TODO: handle finally clause
			dao.closeConnection();
		}
		return lu;
	}

	public void addFood(Food f)throws Exception {
		FoodDao dao = new FoodDao();
		try {
			dao.addFood(f);
		} finally {
			dao.closeConnection();
		}
		
	}

	public void deletFood(String foodid) throws Exception{
		FoodDao dao = new FoodDao();
		try {
			dao.deletFood(foodid);
		} finally {
			dao.closeConnection();
		}
		
		
	}

	public List<Type> findAllType(String foodid) throws Exception{
		List<Type> li = new ArrayList<>();
		
		FoodDao dao = new FoodDao();
		try {
			li = dao.findAlltype(foodid);
		} finally {
			dao.closeConnection();
		}
		
		return li;
	}

	public void deleteType(String foodid, String typeid) throws Exception{
		FoodDao dao = new FoodDao();
		try {
			dao.deleteType(foodid,typeid);
		} finally {
			dao.closeConnection();
		}
		
		
	}

	public Type findTypeByName(String typename) throws Exception{
		Type t = null;
		
		FoodDao dao = new FoodDao();
		try {
			t = dao.findTypeByName(typename);
		} finally {
			dao.closeConnection();
		}
		
		return t;
	}

	public void addType(String foodid, int typeid) throws Exception{
		FoodDao dao = new FoodDao();
		
		try {
			dao.addType(foodid,typeid);
		} finally {
			// TODO: handle finally clause
		}
		
	}

	public void updateFood(Food f) throws Exception{
		FoodDao dao = new FoodDao();
		try {
			dao.updateFood(f);
		} finally {	
			dao.closeConnection();
		}
		
		
	}

	public Food findFoodById(String foodid)throws Exception{
		Food f ;
		FoodDao dao = new FoodDao();
		try {
			f = dao.findFoodById(foodid);
		} finally {
			dao.closeConnection();
		}
		return f;
	}

}
