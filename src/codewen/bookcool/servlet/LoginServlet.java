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
 * 登录Servlet
 * @author codewen
 *
 */

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		//获取登录时填写的验证码
		String vcode = request.getParameter("vcode");
		//从session中获取生成的验证码
		String Vcode = (String)request.getSession().getAttribute("Vcode");
		//移除session中的Vcode,以便下次使用
		request.getSession().removeAttribute("Vcode");
		
		//登录需要先判断验证码是否正确
		//忽略大小写比较验证码
		if (vcode == null) {// 如果验证码为空(防止出问题的时候直接访问出现空指针问题)
			request.setAttribute("loginMsg", "您还未登录，请登录");
			request.getRequestDispatcher("jsp/login.jsp").forward(request,
					response);
		}else {
			if(!vcode.equalsIgnoreCase(Vcode)) {//如果填写的验证码不正确
				request.setAttribute("loginMsg", "验证码错误!");
				request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
			}else {//如果验证码正确，则判断该用户是否存在，若存在，密码是否正确
				//获取form表单数据
				Map<String, String[]> parameterMap = request.getParameterMap();
				User user = new User();
				try {
					//将获取的数据进行封装
					BeanUtils.populate(user, parameterMap);
					UserService us = new UserServiceImpl();
					User user2 = us.queryUserByuaccount(user.getUaccount());//数据库查询回来的User
					if(user2!=null) {//为空表示该用户不存在，不为空接下来进行密码判断
						//用户账号存在，判断密码是否正确
						if(user.getUpwd().equals(user2.getUpwd())) {//密码正确，判断是管理员还是普通用户
							//将user2设置到session域中
							request.getSession().setAttribute("user", user2);
							if("管理员".equals(user2.getRole())) {
								//跳转到管理员界面
								response.sendRedirect("QueryUserByPageServlet");
							}else {//普通用户
								//跳转到首页
								response.sendRedirect("jsp/index2.jsp");
							}
						}else {
							request.setAttribute("loginMsg", "用户密码错误");
							request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
						}
					}else {
						request.setAttribute("loginMsg", "该用户不存在");
						request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
					}
				} catch (IllegalAccessException | InvocationTargetException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
