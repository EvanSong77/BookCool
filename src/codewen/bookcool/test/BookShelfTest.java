package codewen.bookcool.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import codewen.bookcool.entity.BookShelf;
import codewen.bookcool.mapper.BookShelfMapper;
import codewen.bookcool.util.MyBatisUtils;

public class BookShelfTest {
	
//	@Test
//	public void test1() {
//		SqlSession session = MyBatisUtils.getSession();
//		BookShelfMapper mapper = session.getMapper(BookShelfMapper.class);
//		BookShelf bs = new BookShelf(4,"sss");
//		boolean result = mapper.addBookToBookShelf(bs);
//		session.commit();
//		MyBatisUtils.closeSession();
//		if(result) {
//			System.out.println("成功...");
//		}else {
//			System.out.println("失败...");
//		}
//	}
	
	@Test
	public void test2() {
		SqlSession session = MyBatisUtils.getSession();
		BookShelfMapper mapper = session.getMapper(BookShelfMapper.class);
//		int result = mapper.queryBookShelfTotalBook("zhangsan");
//		List<BookShelf> books = mapper.queryBookShelfBybsaccount("zhangsan", 0, 10);
		
		MyBatisUtils.closeSession();
		
	}
	
//	@Test
//	public void test3() {
//		SqlSession session = MyBatisUtils.getSession();
//		BookShelfMapper mapper = session.getMapper(BookShelfMapper.class);
//		boolean result = mapper.deleteBookFromBookShelf(178);
//		session.commit();
//		MyBatisUtils.closeSession();
//		if(result) {
//			System.out.println("成功...");
//		}else {
//			System.out.println("失败...");
//		}
//	}
	
	@Test
	public void test4() {
		SqlSession session = MyBatisUtils.getSession();
		BookShelfMapper mapper = session.getMapper(BookShelfMapper.class);
		Map<String, String[]> map = new HashMap<String, String[]>();
		String[] bname = {"元"};
		String[] bauthor = {"天"};
		map.put("bname", bname);
		map.put("bauthor", bauthor);
//		int result = mapper.queryBookShelfTotalBook("zhangsan", map);
		List<BookShelf> list = mapper.queryBookShelfBybsaccount("zhangsan", 0, 10, map);
		for (BookShelf bookShelf : list) {
			System.out.println(bookShelf.getBs_account());
			System.out.println(bookShelf.getBs_bnum());
		}
//		boolean result = mapper.queryBookShelfIsExist("zhangsan", 100);
//		System.out.println(result);
		MyBatisUtils.closeSession();
	}
	
	@Test
	public void test5() {
		SqlSession session = MyBatisUtils.getSession();
		BookShelfMapper mapper = session.getMapper(BookShelfMapper.class);
		List<BookShelf> lists = mapper.queryBookShelfBybsaccount("zhangsan", 0, 10, null);
//		for (BookShelf bookShelf : lists) {
//			System.out.println(bookShelf.getBook().getBname());
//			System.out.println(bookShelf.getBook().getBcategory());
//			MyBatisUtils.closeSession();
//		}
		System.out.println("++++++"+lists);
	}
	
}