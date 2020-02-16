package codewen.bookcool.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import codewen.bookcool.service.CommentsService;
import codewen.bookcool.serviceImpl.CommentsServiceImpl;

/**
 * 删除评论Servlet
 * @author codewen
 *
 */

@WebServlet("/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String _cid = request.getParameter("cid");
		if(_cid!=null && !_cid.equals("")) {
			int cid = Integer.parseInt(_cid);
			CommentsService cs = new CommentsServiceImpl();
			cs.deleteComments(cid);
		}
		response.sendRedirect("QueryCommentsByPageServlet");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}