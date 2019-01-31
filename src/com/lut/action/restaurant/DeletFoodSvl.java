package com.lut.action.restaurant;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.FoodBiz;
import com.lut.util.Log;


/**
 * Servlet implementation class DeletFoodSvl
 */
@WebServlet("/DeletFoodSvl")
public class DeletFoodSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletFoodSvl() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String foodid = request.getParameter("foodid");
		FoodBiz biz = new FoodBiz();
		int msg=0;
		try {
			biz.deletFood(foodid);
			msg=1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
			
		}
		out.print(msg);
	}

}
