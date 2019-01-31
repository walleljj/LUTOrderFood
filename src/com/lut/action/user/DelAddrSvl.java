package com.lut.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.UserBiz;
import com.lut.util.Log;

/**
 * Servlet implementation class DelAddrSvl
 */
@WebServlet("/DelAddrSvl")
public class DelAddrSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelAddrSvl() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int addressid = Integer.parseInt(request.getParameter("addressid"));	
		Log.logger.info(addressid);
		int msg = 0;
		PrintWriter out = response.getWriter();
		UserBiz biz = new UserBiz();
		try {
			biz.delAddress(addressid);
			msg = 1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}

}
