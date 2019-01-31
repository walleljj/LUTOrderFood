package com.lut.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lut.entity.Address;
import com.lut.entity.User;
import com.lut.util.Log;

public class UserDao extends BaseDao {

	public boolean isValidUname(String userid) throws Exception {
		boolean bRet = true;
		String sql = "select userid from tb_user where userid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, userid);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bRet = false; // �ҵ����е��û����ˣ��������������Ч
			break;
		}
		rs.close();
		ps.close();

		return bRet;
	}

	public User login(String userid, String pwd) throws Exception {

		Log.logger.info("UserDao-->>login()");
		User user = null;
		String sql = "select * from tb_user where userid=? and pwd=?";
		this.openConnection(); // ����Ҫ��dao���connection
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, userid);
		ps.setString(2, pwd);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			user = new User();
			user.setUserid(rs.getString("userid"));
			user.setUsername(rs.getString("username"));
			user.setPwd(rs.getString("pwd"));
			user.setTel(rs.getString("tel"));
			user.setEmail(rs.getString("email"));
			user.setMoney(rs.getDouble("money"));
			break;
		}
		rs.close();
		ps.close();
		return user;
	}

	/**
	 * �û�ע�� (û���쳣���ͱ�ʾ�ɹ�)
	 * 
	 * @param user
	 * @throws Exception
	 */
	public void register(User user) throws Exception {
		String sql = "insert into tb_user(userid,username,pwd,tel,email,money) values(?,?,?,?,?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, user.getUserid());
		ps.setString(2, user.getUsername());
		ps.setString(3, user.getPwd());
		ps.setString(4, user.getTel());
		ps.setString(5, user.getEmail());
		ps.setDouble(6, user.getMoney());
		ps.executeUpdate();
		ps.close();
	}

	public void updateperson(User user) throws Exception {
		String sql = "update tb_user set username=?,tel=?,email=? where userid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, user.getUsername());
		ps.setString(2, user.getTel());
		ps.setString(3, user.getEmail());
		ps.setString(4, user.getUserid());
		ps.executeUpdate();
		ps.close();
	}

	public void updatepwd(String npwd, String userid) throws Exception {
		Log.logger.info("UserDao-->>updatepwd()");
		String sql = "update tb_user set pwd=? where userid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, npwd);
		ps.setString(2, userid);
		ps.executeUpdate();
		ps.close();

	}

	public void keepaddress(Address addr) throws Exception {
		Log.logger.info("UserDao-->>keepaddress()");
		String sql = "insert into tb_address(addressid,userid,receivername,completeaddress,tel) values(?,?,?,?,?)";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setInt(1, addr.getAddressid());
		ps.setString(2, addr.getUserid());
		ps.setString(3, addr.getReceivername());
		ps.setString(4, addr.getCompleteaddress());
		ps.setString(5, addr.getTel());
		ps.executeUpdate();
		ps.close();
	}

	public List<Address> getAddressInfo(String userid) throws Exception {
		List<Address> addrs;

		String sql = "select addressid,receivername,completeaddress,tel from tb_address where userid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, userid);
		ResultSet rs = ps.executeQuery();
		addrs = new ArrayList<>();
		while (rs.next()) {
			Address addr = new Address();
			addr.setAddressid(rs.getInt("addressid"));
			addr.setUserid(userid);
			addr.setReceivername(rs.getString("receivername"));
			addr.setCompleteaddress(rs.getString("completeaddress"));
			addr.setTel(rs.getString("tel"));
			addrs.add(addr);
			Log.logger.info(addr.toString());
		}
		
		rs.close();
		ps.close();
		return addrs;
	}


	public void delAddress(int addressid) throws Exception {
		Log.logger.info("UserDao-->>delAddress()");
		String sql = "delete from tb_address where addressid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setInt(1, addressid);
		ps.executeUpdate();
		ps.close();
		
	}

	public void alertAdress(Address address) throws Exception {
		String sql = "update tb_address set receivername=?,completeaddress=?,tel=? where addressid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setString(1, address.getReceivername());
		ps.setString(2, address.getCompleteaddress());
		ps.setString(3, address.getTel());
		ps.setInt(4, address.getAddressid());
		ps.executeUpdate();
		ps.close();
	}

	public void payMoney(String userid, double allmoney) throws Exception{
		String sql = "update tb_user set money=money-? where userid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setDouble(1, allmoney);
		ps.setString(2, userid);
		ps.execute();
		ps.close();
	}

	public void tuiKuan(String userid, double allmoney) throws Exception{
		String sql = "update tb_user set money=money+? where userid=?";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ps.setDouble(1, allmoney);
		ps.setString(2, userid);
		ps.execute();
		ps.close();
		
	}
}
