package com.lut.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/jsp/*")
public class CheckLoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession(true);
		Object object=session.getAttribute("user");
		String path=req.getServletPath();
		if(object==null&&path.indexOf("login")<0){
			resp.sendRedirect("../LoginSvl");
		}else{
			chain.doFilter(request, response);
		}
	}
	@Override
	public void destroy() {
	}
}