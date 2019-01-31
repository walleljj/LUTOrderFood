package com.lut.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.lut.dto.CarItem;
import com.lut.dto.OrderItem;
import com.lut.entity.Address;
import com.lut.entity.Food;
import com.lut.entity.Item;
import com.lut.entity.OrderUpdate;
import com.lut.entity.Orders;
import com.lut.util.Log;

public class OrderDao extends BaseDao {

	public List<Orders> findAllOrderByResId(String resid)throws Exception {
		List<Orders> ou = new ArrayList<>();
		
		String sql = "select * from tb_orders where resid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, resid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Orders or = new Orders();
			or.setOrderid(rs.getString(1));
			or.setUserid(rs.getString(2));
			or.setResid(resid);
			or.setCompleteaddress(rs.getString(4));
			or.setReceivername(rs.getString(5));
			or.setTel(rs.getString(6));
			or.setPaytime(rs.getTimestamp(7));
			or.setState(rs.getInt(8));
			or.setAllmoney(rs.getDouble(9));
			ou.add(or);
		}
		rs.close();
		ps.close();
		
		return ou;
	}

	public Address findAddressById(String addressid) throws Exception{
		Address addr = new Address();
		
		String sql = "select * from tb_address where addressid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, addressid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			addr.setAddressid(rs.getInt("addressid"));
			addr.setCompleteaddress(rs.getString("completeaddress"));
			addr.setReceivername(rs.getString("receivername"));
			addr.setTel(rs.getString("tel"));
			addr.setUserid(rs.getString("userid"));
		}
		return addr;
	}

	public void addOrder(Orders order) throws Exception{
		String sql = "insert into tb_orders(orderid,userid,resid,completeaddress,receivername,tel,"
				+ "paytime,state,allmoney) values(?,?,?,?,?,?,?,?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, order.getOrderid());
		ps.setString(2, order.getUserid());
		ps.setString(3, order.getResid());
		ps.setString(4, order.getCompleteaddress());
		ps.setString(5,order.getReceivername());
		ps.setString(6, order.getTel());
		ps.setTimestamp(7, new java.sql.Timestamp(order.getPaytime().getTime()));
		ps.setInt(8, order.getState());
		ps.setDouble(9, order.getAllmoney());
		ps.executeUpdate();
		ps.close();
		//分别添加订单明细
	    List<Item> items = order.getItems();
	    for(Item item : items) {
	    	addOrderItem(item);
	    }
		
		// TODO Auto-generated method stub
		
	}
	private void addOrderItem(Item item)  throws Exception{		
		//添加明细		
		String sql = "insert into tb_item values((select * from (select ifnull(max(aid),0)+1 from tb_item)tt),?,?,?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setInt(1, item.getItemid());
		ps.setString(2, item.getOrderid());
		ps.setDouble(3, item.getListprice());
		ps.setInt(4, item.getQty());
		ps.executeUpdate();
		ps.close();
	}

	public Orders findOrderByOrderId(String orderid) throws Exception{
		Orders order = new Orders();
		Log.logger.info("orderid:"+orderid);
		String sql = "select * from tb_orders where orderid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			order.setOrderid(rs.getString(1));
			order.setUserid(rs.getString(2));
			order.setResid(rs.getString(3));
			order.setCompleteaddress(rs.getString(4));
			order.setReceivername(rs.getString(5));
			order.setTel(rs.getString(6));
			order.setPaytime(rs.getTimestamp(7));
			order.setState(rs.getInt(8));
			order.setAllmoney(rs.getDouble(9));
			break;
		}
		rs.close();
		ps.close();
		
		return order;
	}

	public void pay(String orderid) throws Exception{
		String sql = "update tb_orders set state='2' where orderid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ps.execute();
		ps.close();
		updateStatePay(orderid);
		updateStatePei(orderid);
		
	}
	
	public void updateStatePay(String orderid)throws Exception{
		String sql = "insert into tb_orderupdate values((select * from (select ifnull(max(ouid),0)+1 from tb_orderupdate)tt),?,?,?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ps.setString(2,"支付成功");
		ps.setString(3, "用户支付");
		ps.setTimestamp(4, new Timestamp(new Date().getTime()));
		ps.execute();
		ps.close();
	}
	public void updateStatePei(String orderid)throws Exception{
		String sql = "insert into tb_orderupdate values((select * from (select ifnull(max(ouid),0)+1 from tb_orderupdate)tt),?,?,?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ps.setString(2,"待处理");
		ps.setString(3, "等待商家处理订单");
		ps.setTimestamp(4, new Timestamp(new Date().getTime()));
		ps.execute();
		ps.close();
	}

	public List<CarItem> findItemsByOrderId(String orderid) throws Exception{
		List<CarItem> li = new ArrayList<>();
		
		String sql = "select a.foodname,b.listprice,b.qty from tb_food as a,tb_item as b where a.foodid=b.itemid and b.orderid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			CarItem ci = new CarItem();
			Food f = new Food();
			f.setFoodname(rs.getString(1));
			f.setFoodprice(rs.getDouble(2));
			ci.setFood(f);
			ci.setQty(rs.getInt(3));
			li.add(ci);
		}
		rs.close();
		ps.close();
		
		return li;
	}

	public List<OrderUpdate> findOrderUpdateByOrderId(String orderid) throws Exception{
		List<OrderUpdate> oul = new ArrayList<>();
		
		String sql = "select * from tb_orderupdate where orderid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			OrderUpdate ou = new OrderUpdate();
			ou.setOrderid(orderid);
			ou.setName(rs.getString("name"));
			ou.setDesc(rs.getString("desc"));
			ou.setUptime(rs.getTimestamp("uptime"));
			oul.add(ou);
		}
		rs.close();
		ps.close();
		
		return oul;
	}

	public void peiSong(String orderid, String psname, String pstel) throws Exception{
		String sql = "insert into tb_orderupdate values((select * from (select ifnull(max(ouid),0)+1 from tb_orderupdate)tt),?,?,?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ps.setString(2,"配送中");
		ps.setString(3, "配送员："+psname+"|联系电话："+pstel);
		ps.setTimestamp(4, new Timestamp(new Date().getTime()));
		ps.execute();
		ps.close();
		upOrderPei(orderid);
	}
	public void upOrderPei(String orderid)throws Exception{
		String sql = "update tb_orders set state='3' where orderid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ps.execute();
		ps.close();
	}

	public void tuiKuan(String orderid) throws Exception{
		String sql = "insert into tb_orderupdate values((select * from (select ifnull(max(ouid),0)+1 from tb_orderupdate)tt),?,?,?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ps.setString(2,"已退款");
		ps.setString(3, "已退款成功");
		ps.setTimestamp(4, new Timestamp(new Date().getTime()));
		ps.execute();
		ps.close();
		upOrderTui(orderid);
		
	}

	public void upOrderTui(String orderid) throws Exception{
		String sql = "update tb_orders set state='5' where orderid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ps.execute();
		ps.close();
	}

	public List<OrderItem> findAllorderByUserId(String userid) throws Exception{
		List<OrderItem> allorders = new ArrayList<>();
		
		String sql = "select a.orderid,a.paytime,b.resphoto1,b.resname,a.allmoney,a.state"
				+ " from tb_orders as a,tb_restaurant as b where a.resid=b.resid and a.userid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, userid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			OrderItem it = new OrderItem();
			it.setOrderid(rs.getString(1));
			it.setPaytime(rs.getTimestamp(2));
			it.setResphoto(rs.getString(3));
			it.setResname(rs.getString(4));
			it.setAllnumber(2);
			it.setAllmoney(rs.getDouble(5));
			it.setState(rs.getInt(6));
			allorders.add(it);
		}
		rs.close();
		ps.close();
		
		return allorders;
	}

	public void okReceive(String orderid) throws Exception{
		String sql = "update tb_orders set state='4' where orderid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ps.execute();
		ps.close();
		upOrderOk(orderid);
	}
	public void upOrderOk(String orderid)throws Exception{
		String sql = "insert into tb_orderupdate values((select * from (select ifnull(max(ouid),0)+1 from tb_orderupdate)tt),?,?,?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, orderid);
		ps.setString(2,"已收货");
		ps.setString(3, "用户已收货");
		ps.setTimestamp(4, new Timestamp(new Date().getTime()));
		ps.execute();
		ps.close();
	}

}
