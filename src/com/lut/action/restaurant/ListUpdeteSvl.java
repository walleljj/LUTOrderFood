package com.lut.action.restaurant;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.OrderBiz;
import com.lut.entity.OrderUpdate;
import com.lut.util.Log;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ListUpdeteSvl
 */
@WebServlet("/ListUpdateSvl")
public class ListUpdeteSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListUpdeteSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		String orderid = request.getParameter("orderid");
		Log.logger.info(orderid);
		OrderBiz biz = new OrderBiz();
		try {
			List<OrderUpdate> ou = new ArrayList<>();
			ou = biz.findOrderUpdateByOrderId(orderid);
			out.print("{\"code\":0,\"msg\":\"\",\"count\":"+ou.size()+",\"data\":");
			JSONArray jsonarray = new JSONArray();  
			JSONObject jsonobj = new JSONObject(); 
			 for(int i = 0 ; i<ou.size() ; i++){
				 OrderUpdate u = ou.get(i);
				 jsonobj.put("id",u.getOrderid());  
				 jsonobj.put("name",u.getName());  
				 jsonobj.put("desc", u.getDesc());
				 jsonobj.put("time",u.getUptime().toLocaleString());  
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
