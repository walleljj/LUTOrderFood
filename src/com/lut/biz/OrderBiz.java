package com.lut.biz;

import java.util.ArrayList;
import java.util.List;

import com.lut.dao.OrderDao;
import com.lut.dao.UserDao;
import com.lut.dto.CarItem;
import com.lut.dto.OrderItem;
import com.lut.entity.Address;
import com.lut.entity.OrderUpdate;
import com.lut.entity.Orders;
import com.lut.util.Log;

public class OrderBiz {

	public List<Orders> findAllOrderByResId(String resid) throws Exception{
		List<Orders> ou = new ArrayList<>();
		
		OrderDao dao = new OrderDao();
		try {
			ou = dao.findAllOrderByResId(resid);
		} finally {
			dao.closeConnection();
		}
		return ou;
	}

	public Address findAddressByid(String addressid) throws Exception{
		// TODO Auto-generated method stub
		Address addr = new Address();
		
		OrderDao dao = new OrderDao();
		try {
			addr = dao.findAddressById(addressid);
		} finally {
			dao.closeConnection();
		}
		return addr;
	}

	public void addOrder(Orders order) throws Exception{
		
		OrderDao orderDao = new OrderDao();
		orderDao.beginTransaction();
		try {
			orderDao.addOrder(order);
			orderDao.commit();
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			orderDao.rollback();
			throw e;
		}finally {
			orderDao.closeConnection();
		}
	}

	public void pay(String orderid) throws Exception{
		OrderDao orderDao = new OrderDao();
		Orders order = null;
		orderDao.beginTransaction();
		
		try {
			order = orderDao.findOrderByOrderId(orderid);
			UserDao userDao = new UserDao();
			userDao.setConn(orderDao.getConn());
			userDao.payMoney(order.getUserid(),order.getAllmoney());
			orderDao.pay(orderid);
			orderDao.commit();
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			orderDao.rollback();
			throw e;
		}finally {
			orderDao.closeConnection();
		}
	}

	public List<CarItem> findItemsByOrderId(String orderid) throws Exception{
		List<CarItem> li = new ArrayList<>();
		OrderDao dao = new OrderDao();
		try {
			li = dao.findItemsByOrderId(orderid);
		} finally {
			dao.closeConnection();
		}
		
		return li;
	}

	public List<OrderUpdate> findOrderUpdateByOrderId(String orderid) throws Exception{
		List<OrderUpdate> oul = new ArrayList<>();
		OrderDao dao = new OrderDao();
		try {
			oul = dao.findOrderUpdateByOrderId(orderid);
		} finally {
			dao.closeConnection();
		}
		return oul;
	}

	public void peiSong(String orderid, String psname, String pstel)throws Exception {
		OrderDao dao = new OrderDao();
		try {
			dao.peiSong(orderid,psname,pstel);
		} finally {
			dao.closeConnection();
		}
	}

	public void tuiKuan(String orderid,double allmoney,String userid) throws Exception{
		OrderDao orderDao = new OrderDao();
		orderDao.beginTransaction();
		try {
			UserDao userDao = new UserDao();
			userDao.setConn(orderDao.getConn());
			userDao.tuiKuan(userid,allmoney);
			orderDao.tuiKuan(orderid);
			orderDao.commit();
			
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			orderDao.rollback();
			throw e;
		}finally {
			orderDao.closeConnection();
		}
		
	}

	public List<OrderItem> findAllorderByUserId(String userid) throws Exception{
		List<OrderItem> allorders = new ArrayList<>();
		
		OrderDao dao = new OrderDao();
		try {
			allorders = dao.findAllorderByUserId(userid);
		} finally {
			dao.closeConnection();
		}
		
		return allorders;
	}

	public void okReceive(String orderid) throws Exception{
		OrderDao dao = new OrderDao();
		try {
			dao.okReceive(orderid);
		} finally {
			dao.closeConnection();
		}
		// TODO Auto-generated method stub
		
	}

}
