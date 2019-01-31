package com.lut.action.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.OrderBiz;
import com.lut.dto.CarItem;
import com.lut.entity.Address;
import com.lut.entity.Item;
import com.lut.entity.Orders;
import com.lut.entity.Restaurant;
import com.lut.entity.User;
import com.lut.util.DateUtil;
import com.lut.util.Log;

/**
 * Servlet implementation class AddOrderSvl
 */
@WebServlet("/AddOrderSvl")
public class AddOrderSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOrderSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*String cardType = request.getParameter("order.cardType");
		String cardNum = request.getParameter("order.creditCard");
		String firstName = request.getParameter("order.billToFirstName");
		String lastName = request.getParameter("order.billToLastName");
		Order order = new Order();
		order.setCardType(cardType);
		order.setCardNum(cardNum);
		order.setPaytime(new Date());
		order.setFirstName(firstName);
		order.setLastName(lastName);
		User user = (User)request.getSession().getAttribute("user");
		order.setUname(user.getUname());
		order.setPaytime(new Date());
		String orderid = DateUtil.getAutoIncrementKey(new Date());  
        order.setOrderid(orderid);		
		Object obj = request.getSession().getAttribute("shopCar");
		Map<String,ItemProduct> shopCar = (Map<String,ItemProduct> )obj;
		Set<Entry<String,ItemProduct>> entrys = shopCar.entrySet();
		List<OrderItem> items = new ArrayList<>();
		double allmoney = 0;
		for(Entry<String,ItemProduct> entry : entrys) {			
			ItemProduct itpr = entry.getValue();   //购物车中的一项
			OrderItem item = new OrderItem();      //数据库TOrderItem中的一项
			item.setItemid(itpr.getItemid());
			item.setListprice(itpr.getListprice());
			item.setOrderid(order.getOrderid());
			item.setQty(itpr.getBuyCount());
			items.add(item);
			allmoney = allmoney + itpr.getListprice() * itpr.getBuyCount();
		}
		order.setAllmoney(allmoney);
		order.setItems(items);		
		OrderBiz biz = new OrderBiz();
		try {
			biz.payOrder(order);	
			//如果付款成功，清除购物车中的数据
			shopCar = null;
			request.getRequestDispatcher("/jsp/order/ViewOrder.jsp").forward(request, response);
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			request.setAttribute("msg","网络异常，请和管理员联系");
			request.getRequestDispatcher("/error/error.jsp").forward(request, response);
		}	
		
	}*/
		Address addr = (Address) request.getSession().getAttribute("defultadd");
		Map<String,CarItem> shopCar = (Map<String, CarItem>) request.getSession().getAttribute("shopCar");
		User user = (User) request.getSession().getAttribute("user");
		Restaurant res = (Restaurant) request.getSession().getAttribute("res");
		Orders order = new Orders();
		Date date = new Date();
		String orderid = DateUtil.getAutoIncrementKey(date);  
        order.setOrderid(orderid);
		order.setPaytime(date);
		order.setResid(res.getResid());
		order.setUserid(user.getUserid());
		order.setState(0);
		order.setReceivername(addr.getReceivername());
		order.setTel(addr.getTel());
		order.setCompleteaddress(addr.getCompleteaddress());
		List<Item> items = new ArrayList<>();
		double allmoney = 0;
		for(Map.Entry<String, CarItem> entry :shopCar.entrySet()) {
			Item item = new Item();
			item.setItemid(Integer.parseInt(entry.getKey()));
			item.setListprice(entry.getValue().getFood().getFoodprice());
			item.setOrderid(orderid);
			item.setQty(entry.getValue().getQty());
			items.add(item);
			allmoney+= entry.getValue().getQty()*entry.getValue().getFood().getFoodprice();
		}
		order.setAllmoney(allmoney);
		order.setItems(items);
		OrderBiz biz = new OrderBiz();
		try {
			biz.addOrder(order);	
			//如果付款成功，清除购物车中的数据
			shopCar.clear();
			request.getSession().setAttribute("shopCar", shopCar);
			request.getSession().setAttribute("order", order);
			request.getRequestDispatcher("/jsp/pay/payment.jsp").forward(request, response);
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			request.getRequestDispatcher("/error/500.jsp").forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
