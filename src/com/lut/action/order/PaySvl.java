package com.lut.action.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.OrderBiz;
import com.lut.entity.User;
import com.lut.util.Log;


/**
 * Servlet implementation class PaySvl
 */
@WebServlet("/PaySvl")
public class PaySvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaySvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String orderid = request.getParameter("orderid");
		String allmoney = request.getParameter("allmoney");
		Log.logger.info(orderid);
		OrderBiz biz = new OrderBiz();
		
		try {
			biz.pay(orderid);
			User user = (User) request.getSession().getAttribute("user");
			user.setMoney(user.getMoney()-Double.parseDouble(allmoney));
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("jsp/pay/pay_success.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			Log.logger.error(e.getMessage(),e);
			request.getRequestDispatcher("jsp/pay/pay_fail.jsp").forward(request, response);
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
