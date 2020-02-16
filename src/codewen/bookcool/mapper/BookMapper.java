package codewen.bookcool.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import codewen.bookcool.entity.Book;

/**
 * 书籍持久层接口类
 * @author codewen
 *
 */
public interface BookMapper {

	//增加书籍方法
	public boolean addBook(Book book);
	
	//删除书籍的方法 通过bnum来删除
	public boolean deleteBook(int bnum);
	
	// 修改书本信息的方法 通过book来修改书籍信息
	public boolean updateBook(Book book);
	
	// 通过bnum查询该书籍
	public Book queryBookBybnum(int bnum);
	
	//查询书籍数(放参数的parameterMap)
	public int queryTotalBook(@Param("parameterMap")Map<String, String> parameterMap);
	
	//查询一页书籍(可排行) 放参数的parameterMap和放排序的conditionMap
	public List<Book> queryBookByPage(@Param("currentpage")int currentpage
			,@Param("pagesize")int pagesize
			,@Param("parameterMap")Map<String, String> parameterMap
			,@Param("conditionMap")Map<String, String> conditionMap);
}
