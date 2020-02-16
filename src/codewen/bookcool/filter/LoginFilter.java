package codewen.bookcool.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import codewen.bookcool.entity.User;

@WebFilter("/*")
public class LoginFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		String uri = req.getRequestURI();
		if(uri.contains("LoginServlet") || uri.contains("login.jsp") || uri.contains("regist.jsp")
				|| uri.contains("all") || uri.contains("VerificationCodeServlet")
				|| uri.contains("AddUserServlet") || uri.contains("index2.jsp")
				|| uri.equals("/BookStore/")) {
			chain.doFilter(request, response);
		}else {
			if((User)req.getSession().getAttribute("user")!=null) {
				chain.doFilter(request, response);
			}else {
				request.setAttribute("loginMsg", "您还未登录，请登录");
				request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
			}
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void destroy() {

	}
}