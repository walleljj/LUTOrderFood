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

import com.lut.biz.ResBiz;
import com.lut.entity.Restaurant;
import com.lut.util.Log;

/**
 * Servlet implementation class aaa
 */
@WebServlet("/aaa")
public class aaa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aaa() {
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
			String resname = p.get("resname");
			String tel = p.get("tel");
			String resaddress = p.get("resaddress");
			String resdes = p.get("resdes");
			String restime = p.get("restime");
			String resprice = p.get("resprice");
			String resminprice = p.get("resminprice");
			String resno = p.get("resno");
			String photo1 = "img/resimg/"+p2.get(0);
			String photo2 = "img/resimg/"+p2.get(1);
			System.out.println(resid+"|"+resname+"|"+tel+"|"+resaddress+"|"+resdes+"|"+restime+"|"+resprice+"|"+resminprice+"|"+resno);
			System.out.println(photo1+"******1******");
			System.out.println(photo2+"******2******");
			//request.getRequestDispatcher("jsp/error/500.jsp").forward(request, response);
			Restaurant re = new Restaurant();
			re.setResid(resid);
			re.setResname(resname);
			re.setTel(tel);
			re.setResaddres(resaddress);
			re.setResdes(resdes);
			re.setResarrivetime(restime);
			re.setRespipage(Double.parseDouble(resprice));
			re.setResminmoney(Double.parseDouble(resminprice));
			re.setResnotices(resno);
			re.setResphoto1(photo1);
			re.setResphoto2(photo2);
			
			ResBiz biz  = new ResBiz();
			try {
				biz.updateRes(re);
				request.setAttribute("msg", "信息修改成功！");
				request.getSession().setAttribute("restaurant", re);
				request.getRequestDispatcher("index.jsp").forward(request, response);;
			} catch (Exception e) {
				request.getRequestDispatcher("error/500.jsp").forward(request, response);
				
				Log.logger.error(e.getMessage(),e);
			}
			
	
	}

	@SuppressWarnings("unused")
	private String processUploadField(FileItem fileitem) {
		String filename = null;
		try {
			// 得到文件输入流
			InputStream is = fileitem.getInputStream();

			// 创建一个文件存盘的目录
			String directoryRealPath = this.getServletContext().getRealPath(
					"/img/resimg");
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
