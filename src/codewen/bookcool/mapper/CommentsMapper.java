package codewen.bookcool.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import codewen.bookcool.entity.Comments;

public interface CommentsMapper {
	
	//增加评论
	public boolean addComments(Comments comments);
	
	//根据cid删除评论
	public boolean deleteComments(int cid);
	
	//修改评论的状态(评论审核通过) 通过时间updatetime和cid
	public boolean updateComments(@Param("cid")int cid, @Param("updatetime")String updatetime);
	
	//根据c_bnum(书籍编号)查询该书籍的总评论数
	public int queryCommentsTotal(int c_bnum);
	
	//根据c_bnum查询该书一页评论(c_bnum>0查询该书一页评论，=0查询所有一页评论)
	public List<Comments> queryComments(@Param("c_bnum")int c_bnum,
			@Param("currentpage")int currentpage, @Param("pagesize")int pagesize);

}
