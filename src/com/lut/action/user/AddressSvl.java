package com.lut.action.user;

import java.io.IOException;

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
 * Servlet implementation class AddressSvl
 */
@WebServlet("/AddressSvl")
public class AddressSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/jsp/user/addressAdmin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user =  (User) request.getSession().getAttribute("user");
		String receiverState = request.getParameter("receiverState");
		String receiverCity = request.getParameter("receiverCity");
		String receiverDistrict = request.getParameter("receiverDistrict");
		String receivername = request.getParameter("receivername");
		String completeaddress = request.getParameter("completeaddress");
		String concreteaddress = receiverState + receiverCity + receiverDistrict + completeaddress;
		String tel = request.getParameter("tel");
		String userid = user.getUserid();
		Address addr = new Address();
		addr.setReceivername(receivername);
		addr.setUserid(userid);
		addr.setTel(tel);
		addr.setCompleteaddress(concreteaddress);
		Log.logger.info(receivername + "--" + tel + "--" + userid + "--" + concreteaddress);
		UserBiz biz = new UserBiz();	
		try {
			biz.keepaddress(addr);
			request.setAttribute("msg", "�ջ�����Ϣ����ɹ�");
			request.getRequestDispatcher("/jsp/user/addressAdmin.jsp").forward(request, response);
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			request.setAttribute("msg", "���������쳣����͹���Ա��ϵ");
			request.getRequestDispatcher("/error/500.jsp").forward(request, response);
		}
	}

}
