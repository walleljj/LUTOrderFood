package com.lut.action.restaurant;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.FoodBiz;
import com.lut.entity.Type;
import com.lut.util.Log;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ListUR
 */
@WebServlet("/ListUR")
public class ListUR extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ListUR() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String foodid = request.getParameter("foodid");
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		FoodBiz biz = new FoodBiz();
		List<Type> li = null;
		try {
			li = biz.findAllType(foodid);
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
		}
		out.print("{\"code\":0,\"msg\":\"\",\"count\":"+li.size()+",\"data\":");
		JSONArray jsonarray = new JSONArray();  
		JSONObject jsonobj = new JSONObject(); 
		 for(int i = 0 ; i<li.size() ; i++){
			 Type ty = li.get(i);
			 jsonobj.put("id", ty.getTypeid());  
			 jsonobj.put("name", ty.getTypename());  
			 jsonarray.add(jsonobj); 
		 }
		 out = response.getWriter();                    
		 out.println(jsonarray);
		 out.print("}");
		 out.flush();
		 out.close();
	}


}
