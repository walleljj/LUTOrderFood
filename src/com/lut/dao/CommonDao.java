package com.lut.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lut.entity.Restaurant;

public class CommonDao extends BaseDao {

	public List<Restaurant> getAllRes() throws Exception {
		List<Restaurant> reslist;

		String sql = "select * from tb_restaurant where state='1'";
		this.openConnection();
		PreparedStatement ps = this.conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		reslist = new ArrayList<>();
		while (rs.next()) {
			Restaurant res = new Restaurant();
			res.setResid(rs.getString("resid"));
			res.setResaddres(rs.getString("resaddres"));
			res.setResarrivetime(rs.getString("resarrivetime"));
			res.setResdes(rs.getString("resdes"));
			res.setResminmoney(rs.getInt("resminmoney"));
			res.setResname(rs.getString("resname"));
			res.setResnotices(rs.getString("resnotices"));
			res.setResphoto1(rs.getString("resphoto1"));
			res.setResphoto2(rs.getString("resphoto2"));
			res.setRespipage(rs.getInt("respipage"));
			reslist.add(res);
		}
		rs.close();
		ps.close();
		return reslist;
	}
}
