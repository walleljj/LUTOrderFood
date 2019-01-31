package com.lut.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.UserBiz;
import com.lut.entity.User;
import com.lut.exception.ValideNullException;
import com.lut.util.Log;

@WebServlet("/LoginSvl")
public class LoginSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginSvl() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/jsp/user/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		Log.logger.info(userid + "--" + pwd);
		UserBiz biz = new UserBiz();
		try {
			User user = biz.login(userid, pwd);
			if (user != null) {
				// ��ʾ�û���¼�ɹ�
				request.getSession().setAttribute("user", user);
				request.getRequestDispatcher("item_food.jsp").forward(request, response);
			} else {
				// ��ʾ�û���¼ʧ��
				request.setAttribute("msg", "�û������������");
				request.getRequestDispatcher("/main/login.jsp").forward(request, response);
			}
		} catch (ValideNullException e) {
			Log.logger.error(e.getMessage(), e);
			request.setAttribute("msg", "�û���������Ϊ��");
			request.getRequestDispatcher("/main/login.jsp").forward(request, response);
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
			request.getRequestDispatcher("/error/500.jsp").forward(request, response);
		}

	}

}
