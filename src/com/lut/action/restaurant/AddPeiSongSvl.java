package com.lut.action.restaurant;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.OrderBiz;
import com.lut.util.Log;

/**
 * Servlet implementation class AddPeiSongSvl
 */
@WebServlet("/AddPeiSongSvl")
public class AddPeiSongSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPeiSongSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int msg = 0;
		String orderid = request.getParameter("orderid");
		String psname = request.getParameter("psname");
		String pstel = request.getParameter("pstel");
		String state = request.getParameter("state");
		if(state.equals("2")){
			OrderBiz biz = new OrderBiz();		
			try {
				biz.peiSong(orderid,psname,pstel);
				msg = 1;
			} catch (Exception e) {
				Log.logger.error(e.getMessage(),e);
			}
		}else{
			msg = 2;
		}
		PrintWriter out = response.getWriter();
		out.print(msg);
	}


}
