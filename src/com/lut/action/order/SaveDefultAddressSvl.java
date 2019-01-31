package com.lut.action.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.OrderBiz;
import com.lut.entity.Address;
import com.lut.util.Log;

/**
 * Servlet implementation class SaveDefultAddressSvl
 */
@WebServlet("/SaveDefultAddressSvl")
public class SaveDefultAddressSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveDefultAddressSvl() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String addressid = request.getParameter("addressid");
		OrderBiz biz = new OrderBiz();
		Address addr = new Address();
		
		try {
			addr = biz.findAddressByid(addressid);
			Log.logger.info(addr.toString());
			request.getSession().setAttribute("defultadd", addr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
