package com.lut.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lut.entity.Food;
import com.lut.entity.Restaurant;
import com.lut.entity.TypeFood;
import com.lut.util.Log;

public class ResDao extends BaseDao{
/**
 * 商家登录dao
 * @param resid
 * @param pwd
 * @return
 * @throws Exception
 */
	public Restaurant login(String resid, String pwd) throws Exception{
		Restaurant re = null;
		
		String sql = "select * from tb_restaurant where resid=? and pwd=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, resid);
		ps.setString(2, pwd);
		ResultSet res = ps.executeQuery();
		while(res.next()){
			re = new Restaurant();
			re.setResid(resid);
			re.setPwd(pwd);
			re.setResaddres(res.getString("resaddres"));
			re.setResarrivetime(res.getString("resarrivetime"));
			re.setResdes(res.getString("resdes"));
			re.setResname(res.getString("resname"));
			re.setResminmoney(res.getDouble("resminmoney"));
			re.setTel(res.getString("tel"));
			re.setResnotices(res.getString("resnotices"));
			re.setResphoto1(res.getString("resphoto1"));
			re.setResphoto2(res.getString("resphoto2"));
			re.setRespipage(res.getDouble("respipage"));
			re.setState(res.getInt("state"));
		}
		res.close();
		ps.close();
		return re;
	}
	/**
	 * 判断用户名是否存在，如果用户名在数据库中不存在，就是有效的
	 * @param resid
	 * @return
	 * @throws Exception
	 */
	public boolean isValidResID(String resid) throws Exception {
		this.openConnection();
		Restaurant re = null;
		String sql = "select * from tb_restaurant where resid=?";
		this.openConnection();  //必须要在dao层打开connection
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, resid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			re = new Restaurant();
			re.setResid(rs.getString("resid"));	
			break;
		}
		rs.close();
		ps.close();
		//this.closeConnection(conn);   不能在dao层关闭connection
	    if(re==null)	
	    	return true;
	    else
	    	return false;
	}
	/**
	 * 注册商家（添加一条不完整的商家信息）
	 * @param re
	 * @throws Exception
	 */
	public void regist(Restaurant re) throws Exception{
		// TODO Auto-generated method stub
		String sql = "insert into tb_restaurant(resid,pwd,resname)values(?,?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, re.getResid());
		ps.setString(2, re.getPwd());
		ps.setString(3, re.getResname());
		ps.execute();
		ps.close();		
	}
	public void updateRes(Restaurant re) throws Exception{
		// TODO Auto-generated method stub
		String sql = "update tb_restaurant set resname=?,resdes=?,tel=?,resphoto1=?,"
				+ "resphoto2=?,resaddres=?,resnotices=?,resarrivetime=?,resminmoney=?,respipage=?,state='1'"
				+ "where resid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, re.getResname());
		ps.setString(2, re.getResdes());
		ps.setString(3, re.getTel());
		ps.setString(4, re.getResphoto1());
		ps.setString(5, re.getResphoto2());
		ps.setString(6, re.getResaddres());
		ps.setString(7, re.getResnotices());
		ps.setString(8, re.getResarrivetime());
		ps.setDouble(9, re.getResminmoney());
		ps.setDouble(10, re.getRespipage());
		ps.setString(11, re.getResid());
		ps.executeUpdate();
		ps.close();
		
	}
	public String findResPwdById(String resid) throws Exception{
		String pwd = null;
		String sql = "select pwd from tb_restaurant where resid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, resid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			pwd = rs.getString(1);
			break;
		}
		return pwd;
	}
	public void changePwd(String resid, String pwd) throws Exception{
		String sql = "update tb_restaurant set pwd=? where resid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, pwd);
		ps.setString(2, resid);
		ps.executeUpdate();
		ps.close();
		
	}
	public Map<Integer, String> findAllType() throws Exception{
		Map<Integer,String> map = new HashMap<>();
		Log.logger.info("findAllType执行了");
		String	sql = "select * from tb_type";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			int id = rs.getInt("typeid");
			String name = rs.getString("typename");
			map.put((Integer)id, name);
		}
		rs.close();
		ps.close();
		return map;
	}
	public List<Food> findAllFood(String resid)throws Exception {
		List<Food> fl = new ArrayList<>();
		Log.logger.info("findAllFood执行了");
		String sql = "select * from tb_food where resid=? and state='1'";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, resid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Food f = new Food();
			f.setFoodid(rs.getInt("foodid"));
			f.setResid(resid);
			f.setFoodname(rs.getString("foodname"));
			f.setFoodphoto(rs.getString("foodphoto"));
			f.setFoodprice(rs.getDouble("foodprice"));
			f.setState(1);
			fl.add(f);
		}
		rs.close();
		ps.close();
		
		return fl;
	}
	public List<TypeFood> findAllTypeFood(String  resid)throws Exception {
		List<TypeFood> tf = new ArrayList<>();
		Log.logger.info("findAllTypeFood执行了");
		String sql = "select a.tfid,a.typeid,a.foodid from tb_type_food as a,tb_food as b,tb_restaurant as c"
				+ " where a.foodid=b.foodid and b.resid=c.resid and b.state='1' and b.resid=?";
		this.openConnection();		// TODO Auto-generated method stub
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, resid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			TypeFood t = new TypeFood();
			t.setTfid(rs.getInt(1));
			t.setTypeid(rs.getInt(2));
			t.setFoodid(rs.getInt(3));
			tf.add(t);
		}
		rs.close();
		ps.close();
		return tf;
	}
	public Restaurant findResById(String resid) throws Exception{
		Restaurant re = null;
		
		String sql = "select * from tb_restaurant where resid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, resid);
		ResultSet res = ps.executeQuery();
		while(res.next()){
			re = new Restaurant();
			re.setResid(resid);
			re.setPwd(res.getString("pwd"));
			re.setResaddres(res.getString("resaddres"));
			re.setResarrivetime(res.getString("resarrivetime"));
			re.setResdes(res.getString("resdes"));
			re.setResname(res.getString("resname"));
			re.setResminmoney(res.getDouble("resminmoney"));
			re.setTel(res.getString("tel"));
			re.setResnotices(res.getString("resnotices"));
			re.setResphoto1(res.getString("resphoto1"));
			re.setResphoto2(res.getString("resphoto2"));
			re.setRespipage(res.getDouble("respipage"));
			re.setState(res.getInt("state"));
		}
		res.close();
		ps.close();
		return re;
	}

}
