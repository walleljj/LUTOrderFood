package com.lut.action.restaurant;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.lut.biz.FoodBiz;
import com.lut.entity.Food;
import com.lut.util.Log;

/**
 * Servlet implementation class AddFoodSvl
 */
@WebServlet("/AddFoodSvl")
public class AddFoodSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddFoodSvl() {
        super();
        // TODO Auto-generated constructor stub
    }
    @SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	Map<String,String> p = new HashMap<>();
    	List<String> p2 = new ArrayList<>();

		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		if (!isMultipartContent) {
			throw new RuntimeException("your form is not multipart/form-data");
		}

		// 创建一个DiskFileItemfactory工厂类
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(new File("h:\\"));// 指定临时文件的存储目录
		ServletFileUpload sfu = new ServletFileUpload(factory);
		
			List<FileItem> fileItems;
			try {
				fileItems = sfu.parseRequest(request);
				for (FileItem fileitem : fileItems) {
					if (!fileitem.isFormField()) {
						String na = processUploadField(fileitem);
						p2.add(na);
						
					}else{
						p.put(fileitem.getFieldName(), fileitem.getString("UTF-8"));
					}
				}
			} catch (FileUploadException e) {
				request.setAttribute("msg", "图片上传出错");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			
			String resid = p.get("resid");
			String foodname = p.get("foodname");
			String price = p.get("price");
			String photo = "img/foodimg/"+p2.get(0);
			System.out.println(photo+"******1******");
			//request.getRequestDispatcher("jsp/error/500.jsp").forward(request, response);
			Food f = new Food();
			f.setFoodname(foodname);
			f.setResid(resid);
			f.setFoodphoto(photo);
			f.setFoodprice(Double.parseDouble(price));
			f.setState(1);
			
			FoodBiz biz = new FoodBiz();
			try {
				biz.addFood(f);
				request.setAttribute("msg", "添加成功！");
				response.sendRedirect(request.getContextPath()+"/admin/listfood.jsp");
			} catch (Exception e) {
				request.getRequestDispatcher("/error/500.jsp").forward(request, response);
				Log.logger.error(e.getMessage(),e);
			}
			
	
	}

	private String processUploadField(FileItem fileitem) {
		String filename = null;
		try {
			// 得到文件输入流
			@SuppressWarnings("unused")
			InputStream is = fileitem.getInputStream();

			// 创建一个文件存盘的目录
			String directoryRealPath = this.getServletContext().getRealPath(
					"/img/foodimg");
			File storeDirectory = new File(directoryRealPath);// 即代表文件又代表目录
			if (!storeDirectory.exists()) {
				storeDirectory.mkdirs();// 创建一个指定的目录
			}
			// 得到上传的名子
			filename = fileitem.getName();// 文件项中的值 F:\图片素材\小清新\43.jpg 或者
													// 43.jpg
			if (filename != null) {
				filename = FilenameUtils.getName(filename);
			}

			// 解决文件同名的问题
			filename = UUID.randomUUID() + "_" + filename;
			// 上传文件，自动删除临时文件
			fileitem.write(new File(storeDirectory,filename));
			fileitem.delete();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return filename;
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
