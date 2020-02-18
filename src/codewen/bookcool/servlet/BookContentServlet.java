package codewen.bookcool.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codewen.bookcool.entity.Book;
import codewen.bookcool.entity.BookContent;
import codewen.bookcool.entity.User;
import codewen.bookcool.service.BookContentService;
import codewen.bookcool.service.BookService;
import codewen.bookcool.service.BookShelfService;
import codewen.bookcool.serviceImpl.BookContentServiceImpl;
import codewen.bookcool.serviceImpl.BookServiceImpl;
import codewen.bookcool.serviceImpl.BookShelfServiceImpl;

/**
 * 小说阅读Servlet
 * @author codewen
 *
 */

@WebServlet("/BookContentServlet")
public class BookContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String _bc_bnum = request.getParameter("bc_bnum");
		String _readtimes = request.getParameter("readtimes");
		String _collectiontimes = request.getParameter("collectiontimes");
		String _chapter_num = request.getParameter("chapter_num");
		if(_chapter_num==null || _chapter_num.equals("")) {
			_chapter_num = "1";
		}
		if(_collectiontimes==null || _collectiontimes.equals("")) {
			_collectiontimes = "1";
		}
		int chapter_num = Integer.parseInt(_chapter_num);
		int bc_bnum = Integer.parseInt(_bc_bnum);
		int collectiontimes = Integer.parseInt(_collectiontimes);
		//更新书籍总阅读数
		BookContentService bcs = new BookContentServiceImpl();
		if(_readtimes!=null && !_readtimes.equals("")) {
			int readtimes = Integer.parseInt(_readtimes);
			BookService bs = new BookServiceImpl();
			Book book = new Book();
			if(bcs.queryBookContentIsExist(bc_bnum)) {
				readtimes--;
			}
			book.setBnum(bc_bnum);
			book.setReadtimes(readtimes);
 			bs.updateBook(book);
		}
		//查询书架是否有该书
		BookShelfService bss = new BookShelfServiceImpl();
		User user = (User)request.getSession().getAttribute("user");
		if(bss.queryBookShelfIsExist(user.getUaccount(), bc_bnum)) {
			request.setAttribute("IsInBookshelf", "IsInBookshelf");
		}
		//如果章节对象不为空，回写章节对象，总章数，目录，收藏数
		BookContent bookContent = bcs.queryBookContent(bc_bnum, chapter_num);
		int bookcontentTotal = bcs.queryBookContentTotal(bc_bnum);
		List<BookContent> bookCatalogList = bcs.queryBookCatalog(bc_bnum);
		request.setAttribute("bookContent", bookContent);
		if(bookCatalogList!=null && bookCatalogList.size() > 0) {
			request.setAttribute("bookcontentTotal", bookcontentTotal);
			request.setAttribute("bookCatalogList", bookCatalogList);
		}else {
			request.setAttribute("chapter_num", chapter_num);
		}
		request.setAttribute("bc_bnum", bc_bnum);
		request.setAttribute("collectiontimes", collectiontimes);
		request.getRequestDispatcher("jsp/bookcontent.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
