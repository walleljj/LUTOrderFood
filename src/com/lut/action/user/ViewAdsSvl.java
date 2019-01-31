package com.lut.action.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.UserBiz;
import com.lut.entity.Address;
import com.lut.entity.User;
import com.lut.util.Log;

/**
 * Servlet implementation class ViewAdsSvl
 */
@WebServlet("/ViewAdsSvl")
public class ViewAdsSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAdsSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user =  (User) request.getSession().getAttribute("user");
		String userid = user.getUserid();
		UserBiz biz = new UserBiz();
		try {
			List<Address> addrs = biz.getAddressInfo(userid);
			request.getSession().setAttribute("addrs", addrs);
			request.getRequestDispatcher("/jsp/user/viewAddress.jsp").forward(request, response);
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			request.getRequestDispatcher("/error/500.jsp").forward(request, response);
		}
	}
}
