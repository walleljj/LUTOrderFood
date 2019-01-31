package com.lut.action.order;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.FoodBiz;
import com.lut.dto.CarItem;
import com.lut.entity.Food;
import com.lut.util.Log;

/**
 * Servlet implementation class ShopCarAddSvl
 */
@WebServlet("/ShopCarAddSvl")
public class ShopCarAddSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopCarAddSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String foodid = request.getParameter("foodid");
		String foodprice = request.getParameter("foodprice");
		String qty = request.getParameter("qty");
		Log.logger.info(foodid+"  "+foodprice+"  "+qty);
		FoodBiz biz = new FoodBiz();
		Object obj = request.getSession().getAttribute("shopCar");
		Map<String,CarItem> shopCar;  //session中的购物车数据格式
		if(obj == null) {
			shopCar = new HashMap<>();  
			request.getSession().setAttribute("shopCar", shopCar); //把空购物车加到session中
		}else {
			shopCar = (Map<String,CarItem> )obj;
		}
		if(!shopCar.containsKey(foodid)) {
			CarItem caritem = new CarItem();
			Food f = new Food();
			try {
				f = biz.findFoodById(foodid);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			caritem.setFood(f);
			caritem.setQty(Integer.parseInt(qty));
				shopCar.put(foodid, caritem);     //把选定的item加入购物车					
		}else{
			CarItem caritem = new CarItem();
			caritem = shopCar.get(foodid);
			caritem.setQty(caritem.getQty()+Integer.parseInt(qty));
			shopCar.put(foodid, caritem);
		}
		
	}


}
