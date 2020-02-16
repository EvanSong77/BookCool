package codewen.bookcool.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
 * 书籍排行榜Servlet
 * @author codewen
 *
 */

@WebServlet("/BookRankingServlet")
public class BookRankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		BookService bs = new BookServiceImpl();
		Map<String, String> conditionMap1 = new HashMap<String, String>();
		Map<String, String> conditionMap2 = new HashMap<String, String>();
		Map<String, String> conditionMap3 = new HashMap<String, String>();
		conditionMap1.put("byTime", "byTime");
		conditionMap2.put("byRead", "byRead");
		conditionMap3.put("byCollect", "byCollect");
		Page<Book> pages1 = bs.queryBookByPage(0, 10, null, conditionMap1);
		Page<Book> pages2 = bs.queryBookByPage(0, 10, null, conditionMap2);
		Page<Book> pages3 = bs.queryBookByPage(0, 10, null, conditionMap3);
		List<Book> btimeRanking = pages1.getPageLists();
		List<Book> readtimesBookRanking = pages2.getPageLists();
		List<Book> collectiontimesRanking = pages3.getPageLists();
		request.setAttribute("btimeRanking", btimeRanking);
		request.setAttribute("readtimesBookRanking", readtimesBookRanking);
		request.setAttribute("collectiontimesRanking", collectiontimesRanking);
		request.getRequestDispatcher("jsp/bookranking.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
