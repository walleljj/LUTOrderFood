package com.lut.action.restaurant;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.ResBiz;
import com.lut.util.Log;

/**
 * Servlet implementation class ResIdIsOk
 */
@WebServlet("/ResIdIsOk")
public class ResIdIsOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResIdIsOk() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        String resid = request.getParameter("username");
        System.out.println(resid);
        boolean isok = false;
        ResBiz biz = new ResBiz();
        try {
			isok = biz.isValidResID(resid);
			if(isok){
				out.print("1");
			}else{
				out.print("0");
			}
		} catch (Exception e) {
			request.getRequestDispatcher("/error/500.jsp").forward(request, response);
			Log.logger.error(e.getMessage(),e);
		}
		
	}

	

}
