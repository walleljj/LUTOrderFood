package com.lut.action.restaurant;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.OrderBiz;
import com.lut.biz.UserBiz;
import com.lut.entity.User;
import com.lut.util.Log;

/**
 * Servlet implementation class DelOrderSvl
 */
@WebServlet("/DelOrderSvl")
public class DelOrderSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelOrderSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int msg = 0;
		String orderid = request.getParameter("orderid");
		String state = request.getParameter("state");
		double allmoney = Double.parseDouble(request.getParameter("allmoney"));
		String userid = request.getParameter("userid");
		
		if(state.equals("2")){
			OrderBiz biz = new OrderBiz();		
			try {
				biz.tuiKuan(orderid,allmoney,userid);
				msg = 1;
				User user = (User) request.getSession().getAttribute("user");
				user.setMoney(user.getMoney()+allmoney);
				request.getSession().setAttribute("user", user);
			} catch (Exception e) {
				Log.logger.error(e.getMessage(),e);
			}
		}else{
			msg = 2;
		}
		PrintWriter out = response.getWriter();
		out.print(msg);
	}


}
