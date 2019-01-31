package com.lut.action.restaurant;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.ResBiz;


/**
 * Servlet implementation class CheckOldPassSvl
 */
@WebServlet("/CheckOldPassSvl")
public class CheckOldPassSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOldPassSvl() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String resid = request.getParameter("resid");
		String oldpass = request.getParameter("oldpass");
		ResBiz biz = new ResBiz();
		String pass = null;
		try {
			pass = biz.findResPwdById(resid);
			System.out.println(pass+"  "+resid+"");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(!oldpass.equals(pass)){
			out.print(0);
		}
	}

}
