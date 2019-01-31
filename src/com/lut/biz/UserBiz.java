package com.lut.biz;

import java.util.List;

import com.lut.dao.UserDao;
import com.lut.entity.Address;
import com.lut.entity.User;
import com.lut.exception.UnameViolateException;
import com.lut.exception.ValideNullException;
import com.lut.util.Log;


public class UserBiz {
	/**
	 * 用户登录
	 * 
	 * @param uname
	 * @param pwd
	 * @return
	 * @throws Exception
	 */
	public User login(String userid, String pwd) throws Exception {

		User user = null;
		Log.logger.info("UserBiz-->>login()");
		if (userid == null || pwd == null || userid.equals("") || pwd.equals("")) {
			throw new ValideNullException("用户名或密码为空");
		}
		UserDao dao = new UserDao();
		try {
			user = dao.login(userid, pwd);
		} finally {
			// 关闭数据库
			dao.closeConnection();
		}
	
		return user;
	}
	
	public boolean isValidUname(String userid) throws Exception {
		boolean bRet;
		
		UserDao dao = new UserDao();
		try {
			bRet = dao.isValidUname(userid);	
		} finally {
			dao.closeConnection();
		}
		
		return bRet;		
	}
	
	public void register(User user) throws ValideNullException,UnameViolateException,Exception {
		/*1. 判断用户名是否唯一
		       判断用户名、密码长度 
		     是否为空判断
		  2. 写入新用户信息
		  3. 用户写入成功，自动分配邮箱，新手红包
		*/
		if(user == null ) {
			throw new ValideNullException("用户名或密码为空，请检查");
		}
		if(user.getUserid() == null || user.getPwd()==null || user.getUserid().equals("") || user.getPwd().equals("")) {
			throw new ValideNullException("用户名或密码为空，请检查");
		}
		user.setMoney(0f);
		UserDao dao = new UserDao();
		boolean bRet = dao.isValidUname(user.getUserid());
		if(bRet) {
			dao.beginTransaction();               //开启事务
			try {
				dao.register(user);	
				dao.commit();                //提交事务
			} catch (Exception e) {
				dao.rollback();              //回滚事务
				throw e;
			}finally {
				dao.closeConnection();       //释放资源
			}			
		}else {
			throw new UnameViolateException("用户名已被占用");
		}	
	}
	
	public User updateperson(User user) throws Exception{
		UserDao dao = new UserDao();
		dao.beginTransaction();               //开启事务
		try {
			dao.updateperson(user);	
			dao.commit();                //提交事务
		} catch (Exception e) {
			dao.rollback();              //回滚事务
			throw e;
		}finally {
			dao.closeConnection();       //释放资源
		}
		return user;
	}
	
	public void updatepwd(String npwd, String userid) throws Exception {
		Log.logger.info("UserBiz-->>updatepwd()");
		UserDao dao = new UserDao();
		dao.beginTransaction();               //开启事务
		try {
		dao.updatepwd(npwd, userid);
		dao.commit();                //提交事务
		} catch (Exception e) {
			dao.rollback();              //回滚事务
			throw e;
		}finally {
			dao.closeConnection();       //释放资源
		}
	}

	public void keepaddress(Address addr) throws Exception {
		Log.logger.info("UserBiz-->>keepaddress()");
		UserDao dao = new UserDao();
		dao.beginTransaction();               //开启事务
		try {
		dao.keepaddress(addr);
		dao.commit();                //提交事务
		} catch (Exception e) {
			dao.rollback();              //回滚事务
			throw e;
		}finally {
			dao.closeConnection();       //释放资源
		}
		
	}

	public List<Address> getAddressInfo(String userid) throws Exception {
		List<Address> addrs;
		
		UserDao dao = new UserDao();
		try {
			addrs = dao.getAddressInfo(userid);
		} finally {
			dao.closeConnection();
		}		
		return addrs;
	}

	public void delAddress(int addressid) throws Exception {
		UserDao dao = new UserDao();
		dao.beginTransaction();               //开启事务
		try {
		dao.delAddress(addressid);
		dao.commit();                //提交事务
		} catch (Exception e) {
			dao.rollback();              //回滚事务
			throw e;
		}finally {
			dao.closeConnection();       //释放资源
		}
	}
	
	public void alertAddress(Address address) throws Exception {
		UserDao dao = new UserDao();
		dao.beginTransaction();               //开启事务
		try {
		dao.alertAdress(address);
		dao.commit();                //提交事务
		} catch (Exception e) {
			dao.rollback();              //回滚事务
			throw e;
		}finally {
			dao.closeConnection();       //释放资源
		}
	}
}
