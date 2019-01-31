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
 * Servlet implementation class MyOrderSvl
 */
@WebServlet("/MyOrderSvl")
public class MyOrderSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	User user = (User) request.getSession().getAttribute("user");
    	String userid = user.getUserid();
    	List<OrderItem> allorders = new ArrayList<>();
    	OrderBiz biz = new OrderBiz();
    	
    	try {
    		allorders = biz.findAllorderByUserId(userid);
    		request.getSession().setAttribute("allorders", allorders);
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
