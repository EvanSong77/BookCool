package codewen.bookcool.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import codewen.bookcool.entity.User;
import codewen.bookcool.service.UserService;
import codewen.bookcool.serviceImpl.UserServiceImpl;

/**
 * 增加用户(注册)Servlet
 * @author codewen
 *
 */

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		Map<String, String[]> parameterMap = request.getParameterMap();
		User user = new User();
		try {
			BeanUtils.populate(user, parameterMap);
			UserService us = new UserServiceImpl();
			if(us.addUser(user)) {//判断是否增加成功
				request.getSession().setAttribute("loginMsg", "恭喜您，注册成功，请登录!");
				request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
			}else {
				response.sendRedirect("jsp/regist.jsp");
			}
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
