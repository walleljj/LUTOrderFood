package com.lut.action.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.UserBiz;
import com.lut.entity.User;
import com.lut.util.Log;

/**
 * Servlet implementation class PersonageSvl
 */
@WebServlet("/PersonageSvl")
public class PersonageSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonageSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/jsp/user/personage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user =  (User) request.getSession().getAttribute("user");
		String username = request.getParameter("username");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String userid = user.getUserid();
		System.out.println(user.toString());
		user.setUsername(username);
		user.setEmail(email);
		user.setTel(tel);	
		user.setUserid(userid);
		Log.logger.info(username + "--" + tel + "--" + email);
		UserBiz biz = new UserBiz();	
		try {
			biz.updateperson(user);
			request.setAttribute("msg", "�û���Ϣ�޸ĳɹ�");
			request.getRequestDispatcher("/jsp/user/personage.jsp").forward(request, response);
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			request.setAttribute("msg", "���������쳣����͹���Ա��ϵ");
			request.getRequestDispatcher("/error/500.jsp").forward(request, response);
		}
		
	
	}
}
