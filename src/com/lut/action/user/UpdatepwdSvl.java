package com.lut.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.portable.ApplicationException;

import com.lut.biz.UserBiz;
import com.lut.entity.User;
import com.lut.util.Log;

/**
 * Servlet implementation class UpdatepwdSvl
 */
@WebServlet("/UpdatepwdSvl")
public class UpdatepwdSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatepwdSvl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/jsp/user/personal_password.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user =  (User) request.getSession().getAttribute("user");
		String opwd = request.getParameter("opwd");
		String npwd = request.getParameter("npwd");
		String npwd2 = request.getParameter("npwd2");
		String userid = user.getUserid();
		String pwd = user.getPwd();
		Log.logger.info(opwd + "--" + npwd + "--" + npwd2);
		UserBiz biz = new UserBiz();
		try{
			if(opwd.equals(pwd)){ 
				if(npwd.equals(npwd2)){
					if(!npwd.equals(pwd)){
						biz.updatepwd(npwd, userid);
						request.setAttribute("msg", "�����޸ĳɹ�");
						request.getRequestDispatcher("/jsp/user/personal_password.jsp").forward(request, response);
					}else if(npwd.equals(pwd)){
						request.setAttribute("msg", "����û�иĶ�");
						request.getRequestDispatcher("/jsp/user/personal_password.jsp").forward(request, response);
					}else{
						
					}
					
				}else{
					request.setAttribute("msg", "��Ǹ���������벻һ��");
					request.getRequestDispatcher("/jsp/user/personal_password.jsp").forward(request, response);
				}
			}else{
				request.setAttribute("msg", "�������������");
				request.getRequestDispatcher("/jsp/user/personal_password.jsp").forward(request, response);
			}
		}catch(Exception e){
			Log.logger.error(e.getMessage(), e);
			request.setAttribute("msg", "���������쳣����͹���Ա��ϵ");
			request.getRequestDispatcher("/error/500.jsp").forward(request, response);
		}
	}
}