package codewen.bookcool.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codewen.bookcool.entity.Book;
import codewen.bookcool.entity.Comments;
import codewen.bookcool.entity.Page;
import codewen.bookcool.entity.User;
import codewen.bookcool.service.BookService;
import codewen.bookcool.service.BookShelfService;
import codewen.bookcool.service.CommentsService;
import codewen.bookcool.serviceImpl.BookServiceImpl;
import codewen.bookcool.serviceImpl.BookShelfServiceImpl;
import codewen.bookcool.serviceImpl.CommentsServiceImpl;

/**
 * 查询书籍Servlet
 * @author codewen
 *
 */

@WebServlet("/QueryBookServlet")
public class QueryBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		//接收bnum参数
		String _bnum = request.getParameter("bnum");
		int bnum = Integer.parseInt(_bnum);
		BookService bs = new BookServiceImpl();
		Book book = bs.queryBookBybnum(bnum);
		request.setAttribute("book", book);
	
		//接收评论所需参数
		String _currentpageNum = request.getParameter("currentpageNum");
		if(_currentpageNum==null || _currentpageNum.equals("")) {
			_currentpageNum = "1";
		}
		int currentpageNum = Integer.parseInt(_currentpageNum);
		CommentsService cs = new CommentsServiceImpl();
		Page<Comments> commentsparameterMap = cs.queryComments(bnum, currentpageNum, 10);
		request.setAttribute("commentsparameterMap", commentsparameterMap);
		
		//判断书架中是否有该书
		BookShelfService bss = new BookShelfServiceImpl();
		User user = (User)request.getSession().getAttribute("user");
		if(bss.queryBookShelfIsExist(user.getUaccount(), bnum)) {
			request.setAttribute("IsInBookshelf", "IsInBookshelf");
		}
		request.getRequestDispatcher("jsp/book.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}