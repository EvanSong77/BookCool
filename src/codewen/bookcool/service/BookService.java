package codewen.bookcool.service;

import java.util.Map;

import codewen.bookcool.entity.Book;
import codewen.bookcool.entity.Page;

/**
 * 书籍业务逻辑层接口类
 * @author codewen
 *
 */

public interface BookService {
	
	// 修改书本信息的方法 通过book来修改书籍信息
	public boolean updateBook(Book book);
	
	// 通过bnum查询该书籍
	public Book queryBookBybnum(int bnum);

	//查询一页书籍(可排行)
	public Page<Book> queryBookByPage(int currentpageNum
			,int pagesize
			,Map<String, String> parameterMap
			,Map<String, String> conditionMap);
}
