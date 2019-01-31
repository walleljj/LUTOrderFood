package com.lut.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lut.entity.Food;
import com.lut.entity.Type;
import com.lut.util.Log;

public class FoodDao extends BaseDao {

	public List<Food> findAllFoodByResId(String resid) throws Exception{
		
		List<Food> lu = new ArrayList<>();
		
		String sql = "select * from tb_food where resid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, resid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Food f = new Food();
			f.setFoodid(rs.getInt(1));
			f.setResid(rs.getString(2));
			f.setFoodname(rs.getString(3));
			f.setFoodphoto(rs.getString(4));
			f.setFoodprice(rs.getDouble(5));
			f.setState(rs.getInt(6));
			lu.add(f);
		}
		return lu;
	}

	public void addFood(Food f)throws Exception {
		String sql = "insert into tb_food(resid,foodname,foodphoto,foodprice,state)values(?,?,?,?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, f.getResid());
		ps.setString(2, f.getFoodname());
		ps.setString(3, f.getFoodphoto());
		ps.setDouble(4, f.getFoodprice());
		ps.setInt(5, f.getState());
		ps.execute();
		ps.close();
		
		
	}

	public void deletFood(String foodid) throws Exception{
		// TODO Auto-generated method stub
		String sql = "delete from tb_food where foodid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, foodid);
		ps.execute();
		ps.close();
	}

	public List<Type> findAlltype(String foodid) throws Exception{
		List<Type> li = new ArrayList<>();
		
		String sql = "select tb_type.typeid,typename from tb_type_food,tb_type where foodid=? and tb_type_food.typeid=tb_type.typeid";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, foodid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Type t = new Type();
			t.setTypeid(rs.getInt(1));
			t.setTypename(rs.getString(2));
			li.add(t);
		}
		return li;
	}

	public void deleteType(String foodid, String typeid) throws Exception{
		String sql = "delete from tb_type_food where foodid=? and typeid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, foodid);
		ps.setString(2, typeid);
		ps.execute();
		ps.close();
	}

	public Type findTypeByName(String typename) throws Exception{
		Type t = null;
		String sql = "select * from tb_type where typename=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, typename);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			t = new Type();
			t.setTypeid(rs.getInt(1));
			t.setTypename(rs.getString(2));
			break;
		}
		rs.close();
		ps.close();
		
		return t;
	}

	public void addType(String foodid, int typeid) throws Exception{
		String sql = "insert into tb_type_food (foodid,typeid) values(?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, foodid);
		ps.setInt(2, typeid);
		ps.execute();
		ps.close();
	}

	public void updateFood(Food f) throws Exception{
		String sql = "update tb_food set foodname=?,foodphoto=?,foodprice=?,state=? where foodid=?";
		Log.logger.info(sql);
		Log.logger.info(f.toString());
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, f.getFoodname());
		ps.setString(2, f.getFoodphoto());
		ps.setDouble(3, f.getFoodprice());
		ps.setInt(4, f.getState());
		ps.setInt(5, f.getFoodid());
		ps.execute();
		ps.close();
		
	}

	public Food findFoodById(String foodid) throws Exception{
		Food f = new Food();
		 String sql = "select * from tb_food where foodid=?";
		 this.openConnection();
		 PreparedStatement ps = this.conn.prepareStatement(sql);
		 ps.setString(1, foodid);
		 ResultSet rs = ps.executeQuery();
		 while(rs.next()){
			f.setFoodid(rs.getInt("foodid"));
			f.setResid(rs.getString("resid"));
			f.setFoodname(rs.getString("foodname"));
			f.setFoodphoto(rs.getString("foodphoto"));
			f.setFoodprice(rs.getDouble("foodprice"));
		 }
		 rs.close();
		 ps.close();
		 
		 return f;
		// TODO Auto-generated method stub
		
	}
}
