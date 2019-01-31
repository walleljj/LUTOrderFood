package com.lut.biz;

import java.util.List;

import com.lut.dao.CommonDao;
import com.lut.entity.Restaurant;

public class CommonBiz {

	public List<Restaurant> getAllRes() throws Exception {
		List<Restaurant> reslist;		
		CommonDao dao = new CommonDao();
		try {
			reslist = dao.getAllRes();
		} finally {
			dao.closeConnection();
		}		
		return reslist;
	}
}
