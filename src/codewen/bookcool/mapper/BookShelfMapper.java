package codewen.bookcool.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import codewen.bookcool.entity.BookShelf;

/**
 * 书架持久层接口类
 * @author codewen
 *
 */
public interface BookShelfMapper {
	
	//将书籍加入到书架
	public boolean addBookToBookShelf(@Param("bs_account")String bs_account,  
			@Param("bs_bnum")int bs_bnum);
	
	//删除书架中的书籍方法  通过bs_account和bs_bnum来删除
	public boolean deleteBookFromBookShelf(@Param("bs_account")String bs_account,  
			@Param("bs_bnum")int bs_bnum);
	
	//通过bs_account和bs_bnum判断书架中是否有该书
	public boolean queryBookShelfIsExist(@Param("bs_account") String bs_account,
			@Param("bs_bnum") int bs_bnum);
	
	//通过bs_account(和条件)查询该用户书架中有多少本书
	public int queryBookShelfTotalBook(@Param("bs_account")String bs_account,
			@Param("parameterMap")Map<String, String[]> parameterMap);
	
	// 通过bs_account查询该用户书架中的书(关联查询，关联Book类)(可能有搜索参数要用到多表查询)
	public List<BookShelf> queryBookShelfBybsaccount(@Param("bs_account")String bs_account, 
			@Param("currentpage")int currentpage,@Param("pagesize")int pagesize,
			@Param("parameterMap")Map<String, String[]> parameterMap);
	
}
