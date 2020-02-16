package codewen.bookcool.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import codewen.bookcool.entity.BookContent;
import codewen.bookcool.mapper.BookContentMapper;
import codewen.bookcool.service.BookContentService;
import codewen.bookcool.util.BookContentUtils;
import codewen.bookcool.util.MyBatisUtils;

/**
 * 书籍内容业务逻辑层实现类
 * @author codewen
 *
 */

public class BookContentServiceImpl implements BookContentService{

	/**
	 * 该方法用于将章节存入数据库中
	 * @param srcFilePath 该txt小说放在磁盘中的位置
	 * @param bookname 该txt小说的书名
	 * @param encoding 编码类型
	 * @param booknum 该小说在数据库中的书籍编号
	 * @return 章节内容是否添加成功
	 */
	@Override
	public boolean addBookContent(String srcFilePath, String bookname, String encoding,
			int booknum) {
		boolean flag = false;//存入数据库是否成功
		//得到该小说的章节集合(切割后的)
		List<BookContent> cuts = BookContentUtils.cut(srcFilePath, bookname, encoding);
		//进行格式处理后的章节集合
		List<BookContent> contentFormat = BookContentUtils.bookContentFormat(cuts, booknum);
		
		//遍历进行了格式处理后的章节集合，将所有章节存放到数据库中
		for (BookContent bookContent : contentFormat) {
			SqlSession session = MyBatisUtils.getSession();
			BookContentMapper mapper = session.getMapper(BookContentMapper.class);
			if(mapper.addBookContent(bookContent)) {
				flag = true;
				System.out.println(bookContent.getBcname()+" "+bookContent.getBcchapter()+" 添加成功...");
			}else {
				flag = false;
				System.out.println(bookContent.getBcname()+" "+bookContent.getBcchapter()+" 添加失败...");
			}
		}
		return flag;
	}

	@Override
	public boolean queryBookContentIsExist(int bc_bnum) {
		SqlSession session = MyBatisUtils.getSession();
		BookContentMapper mapper = session.getMapper(BookContentMapper.class);
		boolean result = mapper.queryBookContentIsExist(bc_bnum);
		MyBatisUtils.closeSession();
		return result;
	}

	@Override
	public BookContent queryBookContent(int bc_bnum, int chapter_num) {
		SqlSession session = MyBatisUtils.getSession();
		BookContentMapper mapper = session.getMapper(BookContentMapper.class);
		BookContent bookContent = mapper.queryBookContent(bc_bnum, chapter_num);
		MyBatisUtils.closeSession();
		return bookContent;
	}
	
	@Override
	public int queryBookContentTotal(int bc_bnum) {
		SqlSession session = MyBatisUtils.getSession();
		BookContentMapper mapper = session.getMapper(BookContentMapper.class);
		int total = mapper.queryBookContentTotal(bc_bnum);
		MyBatisUtils.closeSession();
		return total;
	}

	@Override
	public List<BookContent> queryBookCatalog(int bc_bnum) {
		SqlSession session = MyBatisUtils.getSession();
		BookContentMapper mapper = session.getMapper(BookContentMapper.class);
		List<BookContent> bookCatalog = mapper.queryBookCatalog(bc_bnum);
		MyBatisUtils.closeSession();
		return bookCatalog;
	}

}
