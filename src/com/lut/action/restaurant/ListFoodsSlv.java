package com.lut.action.restaurant;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lut.biz.ResBiz;
import com.lut.entity.Restaurant;
import com.lut.entity.TypeFood2;
import com.lut.util.Log;

/**
 * Servlet implementation class ListFoodsSlv
 */
@WebServlet("/ListTypeFoodsSlv")
public class ListFoodsSlv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListFoodsSlv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String resid = request.getParameter("resid");
		System.out.println(resid);
		List<TypeFood2> li = new ArrayList<>();
		ResBiz biz = new ResBiz();
		Restaurant res = new Restaurant();
		try {
			li = biz.listTypeFood(resid);
			/*for(int i = 0 ; i<li.size() ; i++){
				System.out.println("type id:"+li.get(i).getTypeid());
				System.out.println("type name:"+li.get(i).getTypename());
				System.out.println("FOODS:");
				for(int j = 0 ; j<li.get(i).getFood().size() ; j++){
					System.out.println(li.get(i).getFood().get(j).toString());
				}
			}*/
			res = biz.findResById(resid);
			request.getSession().setAttribute("res", res);
			request.getSession().setAttribute("type_food", li);
			request.getRequestDispatcher("jsp/index.jsp").forward(request, response);
		} catch (Exception e) {
			Log.logger.error(e.getMessage(),e);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
