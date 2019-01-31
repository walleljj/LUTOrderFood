package com.lut.action.restaurant;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.ResBiz;
import com.lut.entity.Restaurant;
import com.lut.exception.ValideNullException;
import com.lut.util.Log;

/**
 * Servlet implementation class ResLoginSvl
 */
@WebServlet("/ResLoginSvl")
public class ResLoginSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResLoginSvl() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String resid = request.getParameter("resid");
		String pwd = request.getParameter("pwd");
		ResBiz biz = new ResBiz();
		try {
			Restaurant re = biz.login(resid,pwd);
			if(re != null){
				request.getSession().setAttribute("restaurant", re);
				request.getSession().setAttribute("resid", re.getResid());
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else{
				request.setAttribute("msg", "用户名或密码错误");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}catch (ValideNullException e){
			request.setAttribute("msg", e.getMessage());
			request.getRequestDispatcher("login.jsp").forward(request, response);
			Log.logger.error(e.getMessage(),e);
		}catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			request.getRequestDispatcher("/error/500.jsp").forward(request, response);
		}
	}
}
