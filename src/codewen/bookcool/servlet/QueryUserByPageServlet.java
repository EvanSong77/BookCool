package codewen.bookcool.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codewen.bookcool.entity.Page;
import codewen.bookcool.entity.User;
import codewen.bookcool.service.UserService;
import codewen.bookcool.serviceImpl.UserServiceImpl;

/**
 * 分页查询所有用户Servlet
 * @author codewen
 *
 */

@WebServlet("/QueryUserByPageServlet")
public class QueryUserByPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String _currentpageNum = request.getParameter("currentpageNum");
		if(_currentpageNum==null || _currentpageNum.equals("")) {
			_currentpageNum="1";
		}
		int currentpageNum = Integer.parseInt(_currentpageNum);
		Map<String, String[]> parameterMap = request.getParameterMap();
		UserService us = new UserServiceImpl();
		Page<User> userpages = us.queryUserByPage(currentpageNum, 10, parameterMap);
		request.setAttribute("userpages", userpages);//查询出来的一页用户数据
		request.setAttribute("userparameterMap", parameterMap);//用于页面回写
		request.getRequestDispatcher("jsp/admin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
