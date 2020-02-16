package codewen.bookcool.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codewen.bookcool.entity.Book;
import codewen.bookcool.service.BookService;
import codewen.bookcool.service.BookShelfService;
import codewen.bookcool.serviceImpl.BookServiceImpl;
import codewen.bookcool.serviceImpl.BookShelfServiceImpl;

/**
 * 增加书籍进书架Servlet
 * @author codewen
 *
 */

@WebServlet("/AddBookToBookShelf")
public class AddBookToBookShelf extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String bs_account = request.getParameter("bs_account");
		String _bs_bnum = request.getParameter("bs_bnum");
		int bs_bnum = Integer.parseInt(_bs_bnum);
		String _collectiontimes = request.getParameter("collectiontimes");
		String _chapter_num = request.getParameter("chapter_num");//章节编号
		//更新收藏数
		if(_collectiontimes!=null && !_collectiontimes.equals("")) {
			BookService bs = new BookServiceImpl();
			Book book = new Book();
			int collectiontimes = Integer.parseInt(_collectiontimes);
			book.setCollectiontimes(collectiontimes);
			book.setBnum(bs_bnum);
			bs.updateBook(book);
		}
		//添加进书架
		BookShelfService bss = new BookShelfServiceImpl();
		if(!bss.addBookToBookShelf(bs_account, bs_bnum)) {
			System.out.println("添加失败");
		}
		if(_chapter_num!=null && !_chapter_num.equals("")) {
			int chapter_num = Integer.parseInt(_chapter_num);
			//跳转到BookContentServlet
			response.sendRedirect("BookContentServlet?bc_bnum="+bs_bnum+"&chapter_num="+chapter_num);
		}else {
			//跳转到QueryBookServlet
			response.sendRedirect("QueryBookServlet?bnum="+bs_bnum);
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}