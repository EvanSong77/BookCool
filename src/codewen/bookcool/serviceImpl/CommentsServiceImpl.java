package codewen.bookcool.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import codewen.bookcool.entity.Comments;
import codewen.bookcool.entity.Page;
import codewen.bookcool.mapper.CommentsMapper;
import codewen.bookcool.service.CommentsService;
import codewen.bookcool.util.MyBatisUtils;
import codewen.bookcool.util.PageUtils;
import codewen.bookcool.util.TimeUtils;

/**
 * 评论业务逻辑层实现类
 * @author codewen
 *
 */

public class CommentsServiceImpl implements CommentsService{

	@Override
	public boolean addComments(Comments comments) {
		SqlSession session = MyBatisUtils.getSession();
		CommentsMapper mapper = session.getMapper(CommentsMapper.class);
		boolean result = mapper.addComments(comments);
		session.commit();
		MyBatisUtils.closeSession();
		return result;
	}

	@Override
	public boolean deleteComments(int cid) {
		SqlSession session = MyBatisUtils.getSession();
		CommentsMapper mapper = session.getMapper(CommentsMapper.class);
		boolean result = mapper.deleteComments(cid);
		session.commit();
		MyBatisUtils.closeSession();
		return result;
	}
	
	@Override
	public boolean updateComments(int cid, String updatetime) {
		SqlSession session = MyBatisUtils.getSession();
		CommentsMapper mapper = session.getMapper(CommentsMapper.class);
		boolean result = mapper.updateComments(cid, updatetime);
		session.commit();
		MyBatisUtils.closeSession();
		return result;
	}
	
	@Override
	public Page<Comments> queryComments(int c_bnum, int currentpageNum,
			int pagesize) {
		SqlSession session = MyBatisUtils.getSession();
		CommentsMapper mapper = session.getMapper(CommentsMapper.class);
		int totaldata = mapper.queryCommentsTotal(c_bnum);
		Page<Comments> pages = PageUtils.getPages(currentpageNum, pagesize, totaldata);
		if(totaldata==0) {
			MyBatisUtils.closeSession();
			return pages;
		}
		List<Comments> pageLists = mapper.queryComments(c_bnum, pages.getCurrentpage(), pagesize);
		//处理时间
		for (Comments comments : pageLists) {
			if(comments!=null) {
				comments.setCtime(TimeUtils.parseTime(comments.getCtime()));
			}
		}
		pages.setPageLists(pageLists);
		MyBatisUtils.closeSession();
		return pages;
	}

}
