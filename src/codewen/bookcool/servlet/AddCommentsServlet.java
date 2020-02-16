package codewen.bookcool.servlet;

/**
 * 增加评论的Servlet
 * @author codewen
 *
 */

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import codewen.bookcool.entity.Comments;
import codewen.bookcool.service.CommentsService;
import codewen.bookcool.serviceImpl.CommentsServiceImpl;

/**
 * 增加评论Servlet
 * @author codewen
 *
 */

@WebServlet("/AddCommentsServlet")
public class AddCommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		Map<String, String[]> parameterMap = request.getParameterMap();
		Comments comment = new Comments();
		try {
			BeanUtils.populate(comment, parameterMap);
			String ccontent = request.getParameter("comment");
			String ctime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			//封装评论
			comment.setC_to_account(comment.getC_account());
			comment.setCcontent(ccontent);
			comment.setCtime(ctime);
			comment.setCtype(0);
			
			CommentsService cs = new CommentsServiceImpl();
			if(cs.addComments(comment)) {
				System.out.println("评论成功!");
			}else {
				System.out.println("评论失败!");
			}
			response.sendRedirect("QueryBookServlet?bnum="+comment.getC_bnum());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);

	}

}
