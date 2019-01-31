package com.lut.action.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.UserBiz;
import com.lut.entity.User;
import com.lut.exception.UnameViolateException;
import com.lut.exception.ValideNullException;
import com.lut.util.Log;


/**
 * Servlet implementation class RegistSvl
 */
@WebServlet("/RegisterSvl")
public class RegisterSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/jsp/user/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String userid = request.getParameter("userid");
		 String username = request.getParameter("username");
		 String pwd = request.getParameter("pwd");
		 String tel = request.getParameter("tel");
		 String email = request.getParameter("email");
		 UserBiz biz = new UserBiz();
		 User user = new User();
		 user.setUserid(userid);
		 user.setUsername(username);
		 user.setPwd(pwd);
		 user.setTel(tel);
		 user.setEmail(email);
		 System.out.println(user.toString());
		 try {
			 biz.register(user);
			 request.setAttribute("msg", "�û�ע��ɹ��������µ�¼");
			 request.getRequestDispatcher("/main/login.jsp").forward(request, response);
		 } catch (ValideNullException e) {
			 request.setAttribute("msg",e.getMessage());
			 request.getRequestDispatcher("/main/register.jsp").forward(request, response);
		 } catch (UnameViolateException e) {
			 request.setAttribute("msg",e.getMessage());
			 request.getRequestDispatcher("/main/register.jsp").forward(request, response);
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			request.setAttribute("msg", "���������쳣����͹���Ա��ϵ");
			request.getRequestDispatcher("/error/500.jsp").forward(request, response);
		}
		
	}

}
