package com.lut.action.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.OrderBiz;
import com.lut.dto.CarItem;
import com.lut.util.Log;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ListItemSvl
 */
@WebServlet("/ListItemSvl")
public class ListItemSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListItemSvl() {
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
		String orderid = request.getParameter("orderid");
		Log.logger.info(orderid);
		OrderBiz biz = new OrderBiz();
		try {
			List<CarItem> ci = null;
			ci = biz.findItemsByOrderId(orderid);
			out.print("{\"code\":0,\"msg\":\"\",\"count\":"+ci.size()+",\"data\":");
			JSONArray jsonarray = new JSONArray();  
			JSONObject jsonobj = new JSONObject(); 
			 for(int i = 0 ; i<ci.size() ; i++){
				 CarItem ite = ci.get(i);
				 jsonobj.put("name",ite.getFood().getFoodname() );  
				 jsonobj.put("price",ite.getFood().getFoodprice());  
				 jsonobj.put("qty", ite.getQty());
				 jsonobj.put("allmoney", ite.getFood().getFoodprice()*ite.getQty());  
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
