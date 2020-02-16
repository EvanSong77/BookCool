package codewen.bookcool.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import codewen.bookcool.entity.BookContent;

/**
 * 书籍内容持久层接口
 * @author codewen
 *
 */
public interface BookContentMapper {

	//增加章节
	public boolean addBookContent(BookContent bc);
	
	//通过bc_bnum查询书籍是否有内容
	public boolean queryBookContentIsExist(int bc_bnum);
	
	//根据bc_bnum和chapter_num查询章节
	public BookContent queryBookContent(@Param("bc_bnum")int bc_bnum, 
			@Param("chapter_num")int chapter_num);
	
	//根据bc_bnum查询总章节数
	public int queryBookContentTotal(int bc_bnum);
	
	//根据bc_bnum返回章节目录
	public List<BookContent> queryBookCatalog(int bc_bnum);
	
}
