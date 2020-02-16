package codewen.bookcool.service;

import java.util.List;

import codewen.bookcool.entity.BookContent;

/**
 * 书籍内容业务逻辑层接口类
 * @author codewen
 *
 */

public interface BookContentService {

	//增加小说章节
	public boolean addBookContent(String srcFilePath, String bookname, String encoding,
			int booknum);
	
	//通过bc_bnum查询书籍是否有内容
	public boolean queryBookContentIsExist(int bc_bnum);
	
	//根据bc_bnum和chapter_num查询章节
	public BookContent queryBookContent(int bc_bnum, 
			int chapter_num);
	
	//根据bc_bnum查询总章节数
	public int queryBookContentTotal(int bc_bnum);
	
	//根据bc_bnum返回章节目录
	public List<BookContent> queryBookCatalog(int bc_bnum);
}
