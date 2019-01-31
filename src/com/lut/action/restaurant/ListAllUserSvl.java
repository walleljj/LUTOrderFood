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
import com.lut.entity.Food;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ListAllUserSvl
 */
@WebServlet("/ListAllUserSvl")
public class ListAllUserSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListAllUserSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		String resid = request.getParameter("resid");
		System.out.println(resid);
		FoodBiz biz = new FoodBiz();
		try {
			List<Food> fu = null;
			fu = biz.findAllFoodByResId(resid);
			out.print("{\"code\":0,\"msg\":\"\",\"count\":"+fu.size()+",\"data\":");
			JSONArray jsonarray = new JSONArray();  
			JSONObject jsonobj = new JSONObject(); 
			 for(int i = 0 ; i<fu.size() ; i++){
				 Food f = fu.get(i);
				 jsonobj.put("id",f.getFoodid() );  
				 jsonobj.put("name", f.getFoodname());  
				 jsonobj.put("photo", f.getFoodphoto());
				 jsonobj.put("price", f.getFoodprice());  
				 jsonobj.put("state", f.getState());  
				 jsonarray.add(jsonobj); 
			 }
			 out = response.getWriter();                    
			 out.println(jsonarray);
			 out.print("}");
			 out.flush();
			 out.close();
			 }catch (Exception e) { 
				 out.print("get data error!"); 
				 e.printStackTrace();
			}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
