package codewen.bookcool.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codewen.bookcool.entity.BookShelf;
import codewen.bookcool.entity.Page;
import codewen.bookcool.entity.User;
import codewen.bookcool.service.BookShelfService;
import codewen.bookcool.serviceImpl.BookShelfServiceImpl;

/**
 * 分页查询书架Servlet
 * @author codewen
 *
 */

@WebServlet("/QueryBookShelfByPageServlet")
public class QueryBookShelfByPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String _currentpageNum = request.getParameter("currentpageNum");
		Map<String, String[]> parameterMap = request.getParameterMap();//查询参数
		User user = (User)request.getSession().getAttribute("user");
		String bs_account = user.getUaccount();//用户账号
		if (_currentpageNum == null || _currentpageNum.equals("")) {
			_currentpageNum = "1";
		}
		int currentpageNum = Integer.parseInt(_currentpageNum);//当前页码
		BookShelfService bss = new BookShelfServiceImpl();
		Page<BookShelf> bookshelfpages = bss.queryBookShelfBybsaccount(bs_account, currentpageNum, 10, parameterMap);
		request.setAttribute("bookshelfpages", bookshelfpages);
		request.setAttribute("bookshelfparameterMap", parameterMap);//用于页面回写
		request.getRequestDispatcher("jsp/bookshelf.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
