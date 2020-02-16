package codewen.bookcool.service;

import java.util.Map;

import codewen.bookcool.entity.BookShelf;
import codewen.bookcool.entity.Page;

/**
 * 书架业务逻辑层接口类
 * @author codewen
 *
 */

public interface BookShelfService {

	//将书籍加入到书架
	public boolean addBookToBookShelf(String bs_account, int bs_bnum); 
	
	//删除书架中的书籍方法  通过bsid来删除
	public boolean deleteBookFromBookShelf(String bs_account, int bs_bnum);
	
	//通过bs_account和bs_bnum判断书架中是否有该书
	public boolean queryBookShelfIsExist(String bs_account,
			int bs_bnum);
	
	// 通过bs_account查询该用户书架中的书(关联查询，关联Book类)(可能有搜索参数要用到多表查询)
	public Page<BookShelf> queryBookShelfBybsaccount(String bs_account, 
			int currentpageNum,int pagesize,
			Map<String, String[]> parameterMap);
}
