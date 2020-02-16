package codewen.bookcool.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import codewen.bookcool.entity.Page;
import codewen.bookcool.entity.User;
import codewen.bookcool.mapper.UserMapper;
import codewen.bookcool.service.UserService;
import codewen.bookcool.util.MyBatisUtils;
import codewen.bookcool.util.PageUtils;
import codewen.bookcool.util.TimeUtils;

/**
 * 用户业务逻辑层实现类
 * @author codewen
 *
 */
public class UserServiceImpl implements UserService{
	
	@Override
	public boolean addUser(User user) {
		SqlSession session = MyBatisUtils.getSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		//先判断该用户是否存在
		if(mapper.queryUserByuaccount(user.getUaccount())==null) {
			boolean result = mapper.addUser(user);
			session.commit();
			MyBatisUtils.closeSession();
			return result;
		}else {
			MyBatisUtils.closeSession();
			return false;
		}
	}

	@Override
	public boolean deleteUser(String uaccount) {
		SqlSession session = MyBatisUtils.getSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		//先判断用户是否存在
		if(mapper.queryUserByuaccount(uaccount)!=null) {
			boolean result = mapper.deleteUser(uaccount);
			session.commit();
			MyBatisUtils.closeSession();
			return result; 
		}else {
			MyBatisUtils.closeSession();
			return false;
		}
	}

	@Override
	public boolean updateUser(User user) {
		SqlSession session = MyBatisUtils.getSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		if(mapper.queryUserByuaccount(user.getUaccount())!=null) {
			boolean result = mapper.updateUser(user);
			session.commit();
			MyBatisUtils.closeSession();
			return result; 
		}else {
			MyBatisUtils.closeSession();
			return false;
		}
	}

	@Override
	public User queryUserByuaccount(String uaccount) {
		SqlSession session = MyBatisUtils.getSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		User user = mapper.queryUserByuaccount(uaccount);
		//时间转化
		if(user!=null) {
			user.setUregistTime(TimeUtils.parseTime(user.getUregistTime()));
		}
		MyBatisUtils.closeSession();
		return user; 
	}

	@Override
	public Page<User> queryUserByPage(int currentpageNum, int pagesize,
			Map<String, String[]> parameterMap) {
		SqlSession session = MyBatisUtils.getSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		//查询总数据数
		int totaldata = mapper.queryTotalUser(parameterMap);//总数据
		Page<User> pages = PageUtils.getPages(currentpageNum, pagesize, totaldata);
		//如果总数据数为空，直接返回pages，不用查询一页数据
		if(totaldata==0) {
			MyBatisUtils.closeSession();
			return pages;
		}
		List<User> pageLists = mapper.queryUserByPage(pages.getCurrentpage(), pagesize, parameterMap);
		//处理时间
		for (User user : pageLists) {
			if(user!=null) {
				user.setUregistTime(TimeUtils.parseTime(user.getUregistTime()));
			}
		}
		pages.setPageLists(pageLists);//封装一页结果集
		MyBatisUtils.closeSession();
		return pages;
	}
}