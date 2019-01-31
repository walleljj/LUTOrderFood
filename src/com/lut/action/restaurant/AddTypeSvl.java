package com.lut.action.restaurant;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.FoodBiz;
import com.lut.entity.Type;
import com.lut.util.Log;


/**
 * Servlet implementation class AddTypeSvl
 */
@WebServlet("/AddTypeSvl")
public class AddTypeSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddTypeSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int msg = 0;
		String foodid = request.getParameter("foodid");
		String typename = request.getParameter("typename");
		FoodBiz biz = new FoodBiz();
		Type t = null;
		try {
			t = biz.findTypeByName(typename);
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
		}
		if(t!=null){
			int typeid = t.getTypeid();
			try {
				biz.addType(foodid,typeid);
				msg=1;
			} catch (Exception e) {
				Log.logger.error(e.getMessage(),e);
			}
		}
		PrintWriter out = response.getWriter();
		out.print(msg);
	}


}
