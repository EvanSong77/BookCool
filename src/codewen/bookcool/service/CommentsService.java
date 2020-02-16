package codewen.bookcool.service;

import codewen.bookcool.entity.Comments;
import codewen.bookcool.entity.Page;

/**
 * 评论业务逻辑层接口
 * @author codewen
 *
 */

public interface CommentsService {
	
	//增加评论
	public boolean addComments(Comments comments);
	
	//根据cid删除评论
	public boolean deleteComments(int cid);
	
	//修改评论的状态(评论审核通过) 通过时间updatetime和cid
	public boolean updateComments(int cid, String updatetime);
	
	//根据c_bnum查询该书一页评论(c_bnum>0查询该书一页评论，=0查询所有一页评论)
	public Page<Comments> queryComments(int c_bnum,
			int currentpageNum, int pagesize);
}
