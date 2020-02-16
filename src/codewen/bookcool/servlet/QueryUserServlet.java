package codewen.bookcool.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codewen.bookcool.entity.User;
import codewen.bookcool.service.UserService;
import codewen.bookcool.serviceImpl.UserServiceImpl;

/**
 * 查询该用户的信息Servlet
 * @author codewen
 *
 */

@WebServlet("/QueryUserServlet")
public class QueryUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		User user = (User)request.getSession().getAttribute("user");
		UserService us = new UserServiceImpl();
		User u = us.queryUserByuaccount(user.getUaccount());
		request.setAttribute("u", u);
		request.getRequestDispatcher("jsp/user.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
