package com.lut.action.restaurant;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.OrderBiz;
import com.lut.entity.Orders;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ListAllOrderSvl
 */
@WebServlet("/ListAllOrderSvl")
public class ListAllOrderSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ListAllOrderSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("deprecation")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		String resid = request.getParameter("resid");
		//System.out.println(resid);
		OrderBiz biz = new OrderBiz();
		try {
			List<Orders> ou = null;
			ou = biz.findAllOrderByResId(resid);
			out.print("{\"code\":0,\"msg\":\"\",\"count\":"+ou.size()+",\"data\":");
			JSONArray jsonarray = new JSONArray();  
			JSONObject jsonobj = new JSONObject(); 
			 for(int i = 0 ; i<ou.size() ; i++){
				 Orders or = ou.get(i);
				 jsonobj.put("id",or.getOrderid());  
				 jsonobj.put("userid", or.getUserid());  
				 jsonobj.put("address", or.getCompleteaddress());
				 jsonobj.put("receivername", or.getReceivername());  
				 jsonobj.put("tel", or.getTel());  
				 jsonobj.put("time", or.getPaytime().toLocaleString());  
				 jsonobj.put("state", or.getState());  
				 jsonobj.put("allmoney", or.getAllmoney());  
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
