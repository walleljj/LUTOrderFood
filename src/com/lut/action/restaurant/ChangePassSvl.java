package com.lut.action.restaurant;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.ResBiz;
import com.lut.util.Log;


/**
 * Servlet implementation class ChangePassSvl
 */
@WebServlet("/ChangePassSvl")
public class ChangePassSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String resid = request.getParameter("resid");
		String pwd= request.getParameter("pwd");
		Log.logger.info(resid+"  "+pwd);
		ResBiz biz = new ResBiz();
		try {
			biz.changePwd(resid,pwd);
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			request.getRequestDispatcher("/error/500.jsp").forward(request, response);
		}
	}

}
