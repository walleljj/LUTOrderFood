package com.lut.action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.UserBiz;
import com.lut.entity.Address;
import com.lut.util.Log;

/**
 * Servlet implementation class AlterAddrSvl
 */
@WebServlet("/AlterAddrSvl")
public class AlterAddrSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterAddrSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int addressid = Integer.parseInt(request.getParameter("addressid"));	
		String completeaddress = request.getParameter("completeaddress");
		String receivername = request.getParameter("receivername");
		String tel = request.getParameter("tel");
		Log.logger.info(addressid + completeaddress + receivername + tel);
		int msg = 0;
		PrintWriter out = response.getWriter();
		UserBiz biz = new UserBiz();
		Address address = new Address();
		address.setAddressid(addressid);
		address.setCompleteaddress(completeaddress);
		address.setReceivername(receivername);
		address.setTel(tel);
		try {
			biz.alertAddress(address);;
			msg = 1;
		} catch (Exception e) {
			Log.logger.error(e.getMessage(), e);
		}
		out.print(msg);
	}

}
