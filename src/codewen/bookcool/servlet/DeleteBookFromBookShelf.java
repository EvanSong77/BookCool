package codewen.bookcool.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codewen.bookcool.entity.User;
import codewen.bookcool.service.BookShelfService;
import codewen.bookcool.serviceImpl.BookShelfServiceImpl;

/**
 * 从书架删除书籍的Servlet
 * @author codewen
 *
 */

@WebServlet("/DeleteBookFromBookShelf")
public class DeleteBookFromBookShelf extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String _bs_bnum = request.getParameter("bs_bnum");//点击了删除按钮
		String[] checkItem = request.getParameterValues("checkItem");//删除所选中的
		User user = (User)request.getSession().getAttribute("user");
		String bs_account = user.getUaccount();
		BookShelfService bss = new BookShelfServiceImpl();
		if(_bs_bnum!=null && !_bs_bnum.equals("")) {
			int bs_bnum = Integer.parseInt(_bs_bnum);
			if(!bss.deleteBookFromBookShelf(bs_account, bs_bnum)) {
				System.out.println("删除失败");
			}
		}
		if(checkItem!=null) {
			if(checkItem.length>0) {
				for (String string : checkItem) {
					int bs_bnum = Integer.parseInt(string);
					if(bss.deleteBookFromBookShelf(bs_account, bs_bnum)) {
						System.out.println("删除失败");
					}
				}
			}
		}
		response.sendRedirect("QueryBookShelfByPageServlet");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}