package codewen.bookcool.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codewen.bookcool.service.UserService;
import codewen.bookcool.serviceImpl.UserServiceImpl;

/**
 * 删除用户Servlet
 * @author codewen
 *
 */

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String uaccount = request.getParameter("uaccount");//点击了删除按钮
		String[] uaccounts = request.getParameterValues("selectBox");//删除所选中的
		UserService us = new UserServiceImpl();
		if(uaccount!=null && uaccount.equals("")) {
			if(!us.deleteUser(uaccount)) {
				System.out.println("该用户删除失败...");
			}
		}
		if(uaccounts!=null) {
			if(uaccounts.length>0) {
				for (String string : uaccounts) {
					if(!us.deleteUser(string)) {
						System.out.println(string+"用户删除失败...");
					}
				}
			}
		}
		response.sendRedirect("QueryUserByPageServlet");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}