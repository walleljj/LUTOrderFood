package com.lut.biz;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lut.dao.ResDao;
import com.lut.entity.Food;
import com.lut.entity.Restaurant;
import com.lut.entity.TypeFood;
import com.lut.entity.TypeFood2;
import com.lut.exception.ValideNullException;
import com.lut.util.Log;

public class ResBiz {
	
	/**
	 * 商家登录
	 * @param resid
	 * @param pwd
	 * @return
	 * @throws Exception
	 */
	public Restaurant login(String resid, String pwd) throws Exception{
		Restaurant re = null;
		
		if(resid == null||pwd == null||resid.equals("")||pwd.equals("")){
			throw new ValideNullException("用户名或密码为空！");
		}
		ResDao dao = new ResDao();
		try {
			re = dao.login(resid,pwd);
		} finally {
			dao.closeConnection();
		}
		
		return re;
	}
	/**
	 * 注册商家
	 * @param re
	 * @throws Exception
	 */
	public void regist(Restaurant re)throws Exception{
		
		if(re.getResid() == null || re.getPwd()==null || re.getResid().equals("") || re.getPwd().equals("")) {
			throw new ValideNullException("用户名或密码为空，请检查");
		}
		ResDao dao = new ResDao();
		try {
			dao.regist(re);	
		} catch (Exception e) {
			throw e;
		}finally {
			dao.closeConnection();       
		}			
			
	}
	public boolean isValidResID(String resid)throws Exception{
		boolean isok = false;
		
		ResDao dao = new ResDao();
		try {
			isok = dao.isValidResID(resid);
		} finally {
			dao.closeConnection();
		}
		return isok;
	}
	public void updateRes(Restaurant re) throws Exception{
		
		ResDao dao = new ResDao();
		try {
			dao.updateRes(re);
		} finally {
			dao.closeConnection();
		}
		// TODO Auto-generated method stub
		
	}
	public String findResPwdById(String resid) throws Exception{
		String pwd = null;
		ResDao dao = new ResDao();
		try {
			pwd = dao.findResPwdById(resid);
		} finally {
			dao.closeConnection();
		}
		return pwd;
	}
	public void changePwd(String resid, String pwd) throws Exception{
		ResDao dao = new ResDao();
		try {
			dao.changePwd(resid,pwd);
		} finally {
			dao.closeConnection();
		}
		
	}
	public List<TypeFood2> listTypeFood(String resid) throws Exception{
		List<TypeFood2> li =  new ArrayList<>();
		Log.logger.info("biz执行了");
		List<TypeFood> tf = new ArrayList<>();
		Map<Integer,String> t = new HashMap<Integer, String>();
		List<Food> f = new ArrayList<>();
		ResDao dao = new ResDao();
		try {
			tf = dao.findAllTypeFood(resid);
			t = dao.findAllType();
			f = dao.findAllFood(resid);
			for(int i = 0 ; i<tf.size() ; i++){
				int temp = 0;
				A:for(int j = 0 ; j<li.size() ; j++){
					if(tf.get(i).getTypeid()==li.get(j).getTypeid()){
						temp = 1;
						TypeFood2 tf2 = li.remove(j);
						List<Food> food = tf2.getFood();
						for(int k = 0 ; k<f.size() ; k++){
							if(f.get(k).getFoodid()==tf.get(i).getFoodid()){
								food.add(f.get(k));
							}
						}
						tf2.setFood(food);
						li.add(tf2);
						break A;
					}
				}
				if(temp==0){
					TypeFood2 tf2 = new TypeFood2();
					tf2.setTypeid(tf.get(i).getTypeid());
					tf2.setTypename(t.get((Integer)tf.get(i).getTypeid()));
					List<Food> food = new ArrayList<>();
					for(int k = 0 ; k<f.size() ; k++){
						if(f.get(k).getFoodid()==tf.get(i).getFoodid()){
							food.add(f.get(k));
							break;
						}
					}
					tf2.setFood(food);
					li.add(tf2);
					
				}
			}
			
		} finally {
			dao.closeConnection();
		}
		
		return li;
	}
	public Restaurant findResById(String resid)throws Exception {
		Restaurant re = null;
		
		ResDao dao = new ResDao();
		try {
			re = dao.findResById(resid);
		} finally {
			dao.closeConnection();
		}
		return re;
	}

}
