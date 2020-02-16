package codewen.bookcool.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import codewen.bookcool.entity.BookContent;
import codewen.bookcool.mapper.BookContentMapper;
import codewen.bookcool.util.BookContentUtils;
import codewen.bookcool.util.MyBatisUtils;

public class BookContentTest {

	//测试章节内容是否切割成功
	@Test
	public void test0() {
		//如果编码格式不对，会无法分割章节，必须跟txt小说的编码一致
		//数据库默认使用的是utf-8，最好保证是utf-8
		List<BookContent> cuts = BookContentUtils.cut("D:\\bookcool小说\\大主宰.txt", "大主宰", "utf-8");
		int booknum = 14;
		List<BookContent> contentFormat = BookContentUtils.bookContentFormat(cuts, booknum);
		for (BookContent bookContent : contentFormat) {
			System.out.println(bookContent.getBcchapter());
			System.out.println(bookContent.getBccontent());
			System.out.println("+++++++++++++++++分隔线++++++++++++++++++++");
		}
	}
	
	@Test
	public void test1() {
		SqlSession session = MyBatisUtils.getSession();
		BookContentMapper mapper = session.getMapper(BookContentMapper.class);
		BookContent bc = new BookContent("a", "1", "1", 10, 100);
		boolean result = mapper.addBookContent(bc);
		session.commit();
		System.out.println(result);
		MyBatisUtils.closeSession();
	}
	
	@Test
	public void test2() {
		SqlSession session = MyBatisUtils.getSession();
		BookContentMapper mapper = session.getMapper(BookContentMapper.class);
		List<BookContent> catalog = mapper.queryBookCatalog(10);
		for (BookContent bookContent : catalog) {
			System.out.println(bookContent.getBcchapter()+bookContent.getChapter_num());
		}
		MyBatisUtils.closeSession();
	}
	
	@Test
	public void test3() {
		SqlSession session = MyBatisUtils.getSession();
		BookContentMapper mapper = session.getMapper(BookContentMapper.class);
		BookContent content = mapper.queryBookContent(10, 1);
		System.out.println(content.getBc_bnum());
		System.out.println(content.getChapter_num());
		System.out.println(content);
		MyBatisUtils.closeSession();
	}
}
