package com.lut.action.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.OrderBiz;
import com.lut.dto.OrderItem;
import com.lut.entity.User;
import com.lut.util.Log;

/**
 * Servlet implementation class ListDaiShouOrders
 */
@WebServlet("/ListDaiShouOrders")
public class ListDaiShouOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListDaiShouOrders() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
    	String userid = user.getUserid();
    	List<OrderItem> allorders = new ArrayList<>();
    	OrderBiz biz = new OrderBiz();
    	
    	try {
    		allorders = biz.findAllorderByUserId(userid);
    		List<OrderItem> allorders2 = new ArrayList<>();
    		for(int i = 0 ; i<allorders.size() ; i++){
    			if(allorders.get(i).getState()==3){
    				allorders2.add(allorders.get(i));
    			}
    		}
    		System.out.println(allorders.size());
    		request.getSession().removeAttribute("allorders");
    		request.getSession().setAttribute("allorders", allorders2);
    		if(allorders2.size()==0){
    			request.getRequestDispatcher("/jsp/order/myOrder_2.jsp").forward(request, response);
    		}else
    			request.getRequestDispatcher("/jsp/order/myOrder.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
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
