package codewen.bookcool.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codewen.bookcool.entity.Book;
import codewen.bookcool.entity.Page;
import codewen.bookcool.service.BookService;
import codewen.bookcool.serviceImpl.BookServiceImpl;

/**
 * 书库Servlet
 * @author codewen
 *
 */

@WebServlet("/QueryBooksByPageServlet")
public class QueryBooksByPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String fparam = request.getParameter("fparam");//搜索框的参数
		String byTime = request.getParameter("byTime");
		String byWord = request.getParameter("byWord");
		String bcategory = request.getParameter("bcategory");
		String _currentpageNum = request.getParameter("currentpageNum");
		
		Map<String, String> parameterMap = new HashMap<String, String>();//放参数的map
		Map<String, String> conditionMap = new HashMap<String, String>();//放排序条件的map
		parameterMap.put("fparam", fparam);
		parameterMap.put("bcategory", bcategory);
		conditionMap.put("byTime", byTime);
		conditionMap.put("byWord", byWord);
		
		if(_currentpageNum==null || _currentpageNum.equals("")) {
			_currentpageNum = "1";
		}
		int currentpageNum = Integer.parseInt(_currentpageNum);
		BookService bs = new BookServiceImpl();
		Page<Book> bookpages = bs.queryBookByPage(currentpageNum, 10, parameterMap, conditionMap);
		request.setAttribute("fparam", fparam);//用于页面回写
		request.setAttribute("bookparameterMap", parameterMap);//用于页面回写
		request.setAttribute("bookpages", bookpages);
		request.setAttribute("byTime", byTime);//用于标识是否使用了时间排序
		request.setAttribute("byWord", byWord);//用于标识是否使用了字数排序
		request.getRequestDispatcher("jsp/books.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
