package codewen.bookcool.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import codewen.bookcool.entity.Comments;
import codewen.bookcool.mapper.CommentsMapper;
import codewen.bookcool.util.MyBatisUtils;

public class CommentsTest {
	
	@Test
	public void test1() {
		SqlSession session = MyBatisUtils.getSession();
		CommentsMapper mapper = session.getMapper(CommentsMapper.class);
		Date date = new Date();
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		Comments comments = new Comments(2,"fqm123","fqm123","???",time,0);
		boolean result = mapper.addComments(comments);
		session.commit();
		System.out.println(result);
		MyBatisUtils.closeSession();
	}
	
	@Test
	public void test2() {
		SqlSession session = MyBatisUtils.getSession();
		CommentsMapper mapper = session.getMapper(CommentsMapper.class);
		Date date = new Date();
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		boolean result = mapper.updateComments(13, time);
		session.commit();
		System.out.println(result);
		MyBatisUtils.closeSession();
	}
	
	@Test
	public void test3() {
		SqlSession session = MyBatisUtils.getSession();
		CommentsMapper mapper = session.getMapper(CommentsMapper.class);
		boolean result = mapper.deleteComments(13);
		session.commit();
		System.out.println(result);
		MyBatisUtils.closeSession();
	}
	
	@Test
	public void test4() {
		SqlSession session = MyBatisUtils.getSession();
		CommentsMapper mapper = session.getMapper(CommentsMapper.class);
		int result = mapper.queryCommentsTotal(2);
//		List<Comments> result = mapper.queryComments(2, 0, 10);
		System.out.println(result);
		MyBatisUtils.closeSession();
	}

}
