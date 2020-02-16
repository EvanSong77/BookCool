package codewen.bookcool.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import codewen.bookcool.entity.BookShelf;
import codewen.bookcool.entity.Page;
import codewen.bookcool.mapper.BookShelfMapper;
import codewen.bookcool.service.BookShelfService;
import codewen.bookcool.util.MyBatisUtils;
import codewen.bookcool.util.PageUtils;
import codewen.bookcool.util.TimeUtils;

/**
 * 书架业务逻辑层实现类
 * @author codewen
 *
 */

public class BookShelfServiceImpl implements BookShelfService{

	@Override
	public boolean addBookToBookShelf(String bs_account, int bs_bnum) {
		SqlSession session = MyBatisUtils.getSession();
		BookShelfMapper mapper = session.getMapper(BookShelfMapper.class);
		//先判断书架中是否有这本书
		if(!mapper.queryBookShelfIsExist(bs_account, bs_bnum)) {
			boolean result = mapper.addBookToBookShelf(bs_account, bs_bnum);
			session.commit();
			MyBatisUtils.closeSession();
			return result;
		}
		MyBatisUtils.closeSession();
		return false;
	}

	@Override
	public boolean deleteBookFromBookShelf(String bs_account,  int bs_bnum) {
		SqlSession session = MyBatisUtils.getSession();
		BookShelfMapper mapper = session.getMapper(BookShelfMapper.class);
		//先判断书架中是否有这本书
		if(mapper.queryBookShelfIsExist(bs_account,bs_bnum)) {
			boolean result = mapper.deleteBookFromBookShelf(bs_account,bs_bnum);
			session.commit();
			MyBatisUtils.closeSession();
			return result;
		}
		MyBatisUtils.closeSession();
		return false;
	}
	
	@Override
	public boolean queryBookShelfIsExist(String bs_account, int bs_bnum) {
		SqlSession session = MyBatisUtils.getSession();
		BookShelfMapper mapper = session.getMapper(BookShelfMapper.class);
		boolean result = mapper.queryBookShelfIsExist(bs_account, bs_bnum);
		MyBatisUtils.closeSession();
		return result;
	}

	@Override
	public Page<BookShelf> queryBookShelfBybsaccount(String bs_account,
			int currentpageNum, int pagesize, Map<String, String[]> parameterMap) {
		SqlSession session = MyBatisUtils.getSession();
		BookShelfMapper mapper = session.getMapper(BookShelfMapper.class);
		int totaldata = mapper.queryBookShelfTotalBook(bs_account, parameterMap);
		Page<BookShelf> pages = PageUtils.getPages(currentpageNum, pagesize, totaldata);
		if(totaldata==0) {
			MyBatisUtils.closeSession();
			return pages;
		}
		List<BookShelf> pageLists = mapper.queryBookShelfBybsaccount(bs_account, pages.getCurrentpage(), pagesize, parameterMap);
		//处理时间
		for (BookShelf bookShelf : pageLists) {
			if(bookShelf!=null) {
				bookShelf.setBstime(TimeUtils.parseTime(bookShelf.getBstime()));
			}
		}
		pages.setPageLists(pageLists);
		MyBatisUtils.closeSession();
		return pages;
	}

}
