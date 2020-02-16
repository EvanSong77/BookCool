package codewen.bookcool.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import codewen.bookcool.entity.Book;
import codewen.bookcool.mapper.BookMapper;
import codewen.bookcool.util.MyBatisUtils;
import codewen.bookcool.util.TimeUtils;

public class BookTest {

	@Test
	public void test1() {
		SqlSession session = MyBatisUtils.getSession();
		BookMapper mapper = session.getMapper(BookMapper.class);
		Book book = new Book("aaa","song","最好看的数","sss.jpg","玄幻",999,222);
		boolean result = mapper.addBook(book);
		session.commit();
		MyBatisUtils.closeSession();
		if(result) {
			System.out.println("增加成功...");
		} else {
			System.out.println("增加失败...");
		}
	}
	
	@Test
	public void test2() {
		SqlSession session = MyBatisUtils.getSession();
		BookMapper mapper = session.getMapper(BookMapper.class);
		boolean result = mapper.deleteBook(999);
		session.commit();
		MyBatisUtils.closeSession();
		if(result) {
			System.out.println("删除成功...");
		} else {
			System.out.println("删除失败...");
		}
	}
	
	@Test
	public void test3() {
		SqlSession session = MyBatisUtils.getSession();
		BookMapper mapper = session.getMapper(BookMapper.class);
		Book book = mapper.queryBookBybnum(56);
		//调用util包中的TimeUtils工具类来处理数据库返回书籍中btime属性
		book.setBtime(TimeUtils.parseTime(book.getBtime()));
		MyBatisUtils.closeSession();
		System.out.println(book);
	}
	
	@Test
	public void test4() {
		SqlSession session = MyBatisUtils.getSession();
		BookMapper mapper = session.getMapper(BookMapper.class);
		Map<String, String[]> parameterMap = new HashMap<>();
		String[] fparam = {"斗"};
		parameterMap.put("fparam", fparam);
		int totalBook = mapper.queryTotalBook(null);
		MyBatisUtils.closeSession();
		System.out.println(totalBook);
	}
	
	@Test
	public void test5() {
		SqlSession session = MyBatisUtils.getSession();
		BookMapper mapper = session.getMapper(BookMapper.class);
		Map<String, String> parameterMap = new HashMap<>();
		String fparam = "天";
		parameterMap.put("fparam", fparam);
		Map<String, String> conditionMap = new HashMap<>();
		List<Book> books = mapper.queryBookByPage(0, 10, parameterMap,conditionMap);
		MyBatisUtils.closeSession();
		for (Book book : books) {
			System.out.println(book);
		}
	}
	
	@Test
	public void test6() {
		SqlSession session = MyBatisUtils.getSession();
		BookMapper mapper = session.getMapper(BookMapper.class);
		Map<String, String> parameterMap = new HashMap<>();
//		parameterMap.put("fparam", fparam);
//		parameterMap.put("byWord", byWord);
//		parameterMap.put("byTime", byTime);
//		parameterMap.put("byRead", byRead);
//		parameterMap.put("byCollect", byCollect);
//		parameterMap.put("bcategory", bcategory);
		Map<String, String> conditionMap = new HashMap<>();
		List<Book> books = mapper.queryBookByPage(0, 10, parameterMap,conditionMap);
		MyBatisUtils.closeSession();
		for (Book book : books) {
			System.out.println(book);
		}
	}
	
}