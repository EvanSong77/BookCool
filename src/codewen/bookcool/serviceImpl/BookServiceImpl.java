package codewen.bookcool.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import codewen.bookcool.entity.Book;
import codewen.bookcool.entity.Page;
import codewen.bookcool.mapper.BookMapper;
import codewen.bookcool.service.BookService;
import codewen.bookcool.util.MyBatisUtils;
import codewen.bookcool.util.PageUtils;
import codewen.bookcool.util.TimeUtils;

/**
 * 书籍业务逻辑层实现类
 * @author codewen
 *
 */

public class BookServiceImpl implements BookService{

	@Override
	public boolean updateBook(Book book) {
		SqlSession session = MyBatisUtils.getSession();
		BookMapper mapper = session.getMapper(BookMapper.class);
		boolean result = mapper.updateBook(book);
		session.commit();
		MyBatisUtils.closeSession();
		return result;
	}
	
	@Override
	public Book queryBookBybnum(int bnum) {
		SqlSession session = MyBatisUtils.getSession();
		BookMapper mapper = session.getMapper(BookMapper.class);
		Book book = mapper.queryBookBybnum(bnum);
		if(book!=null) {
			book.setBtime(TimeUtils.parseTime(book.getBtime()));
		}
		MyBatisUtils.closeSession();
		return book;
	}
	
	@Override
	public Page<Book> queryBookByPage(int currentpageNum, int pagesize,
			Map<String, String> parameterMap, Map<String, String> conditionMap) {
		SqlSession session = MyBatisUtils.getSession();
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		int totaldata = mapper.queryTotalBook(parameterMap);
		Page<Book> pages = PageUtils.getPages(currentpageNum, pagesize, totaldata);
		if(totaldata==0) {
			MyBatisUtils.closeSession();
			return pages;
		}
		List<Book> pageLists = mapper.queryBookByPage(pages.getCurrentpage(), pagesize, parameterMap, conditionMap);
		for (Book book : pageLists) {
			if(book!=null) {
				book.setBtime(TimeUtils.parseTime(book.getBtime()));
			}
		}
		pages.setPageLists(pageLists);
		MyBatisUtils.closeSession();
		return pages;
	}

}
