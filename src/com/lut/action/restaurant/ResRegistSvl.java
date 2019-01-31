package com.lut.action.restaurant;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.ResBiz;
import com.lut.entity.Restaurant;
import com.lut.util.Log;

/**
 * Servlet implementation class ResRegistSvl
 */
@WebServlet("/ResRegistSvl")
public class ResRegistSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResRegistSvl() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String resid = request.getParameter("username2");
		String resname = request.getParameter("realname2");
		String pwd = request.getParameter("password2");
		System.out.println(resid+"  "+pwd+"  "+resname);
		Restaurant re = new Restaurant();
		re.setPwd(pwd);
		re.setResid(resid);
		re.setResname(resname);
		ResBiz biz = new ResBiz();
		try {
			biz.regist(re);
			//request.setAttribute("msg", "注册成功，请登录并完善你的详细信息");
			//request.getRequestDispatcher("login.jsp").forward(request, response);
		} catch (Exception e) {
			request.getRequestDispatcher("/error/500.jap").forward(request, response);
			Log.logger.error(e.getMessage(),e);
		}
		
	}

}
