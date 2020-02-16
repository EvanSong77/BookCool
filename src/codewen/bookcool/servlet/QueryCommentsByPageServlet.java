package codewen.bookcool.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codewen.bookcool.entity.Comments;
import codewen.bookcool.entity.Page;
import codewen.bookcool.service.CommentsService;
import codewen.bookcool.serviceImpl.CommentsServiceImpl;

/**
 * 分页查询评论Servlet
 * @author codewen
 *
 */

@WebServlet("/QueryCommentsByPageServlet")
public class QueryCommentsByPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String _currentpageNum = request.getParameter("currentpageNum");
		if (_currentpageNum == null || _currentpageNum.equals("")) {
			_currentpageNum = "1";
		}
		int currentpageNum = Integer.parseInt(_currentpageNum);
		String _bnum = request.getParameter("bnum");
		if(_bnum==null||_bnum.equals("")) {
			_bnum = "0";
		}
		int c_bnum = Integer.parseInt(_bnum);
		CommentsService cs = new CommentsServiceImpl();
		Page<Comments> allCommentsPage = cs.queryComments(c_bnum, currentpageNum, 10);
		request.setAttribute("allCommentsPage", allCommentsPage);
		request.getRequestDispatcher("jsp/admincomment.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
