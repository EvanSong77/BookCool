package codewen.bookcool.test;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import codewen.bookcool.entity.User;
import codewen.bookcool.mapper.UserMapper;
import codewen.bookcool.util.MyBatisUtils;
import codewen.bookcool.util.TimeUtils;

public class UserTest {

	@Test
	public void test1() throws IOException {
		SqlSession session = MyBatisUtils.getSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		User user = new User("sss","111","男",16,"sefe@qq.com","dfdf","江西省","hello");
		boolean result = mapper.addUser(user);
		session.commit();
		MyBatisUtils.closeSession();
		if(result) {
			System.out.println("增加成功...");
		} else {
			System.out.println("增加失败...");
		}
	}
	
//	@Test
//	public void test2() {
//		SqlSession session = MyBatisUtil.getSession();
//		UserMapper mapper = session.getMapper(UserMapper.class);
//		User user = mapper.queryUser("aaa");
//		MyBatisUtil.closeSession();
//		System.out.println(user);
//	}
	
	@Test
	public void test3() {
		SqlSession session = MyBatisUtils.getSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		boolean result = mapper.deleteUser("sss");
		session.commit();
		MyBatisUtils.closeSession();
		System.out.println(result);
	}
	
	@Test
	public void test4() {
		SqlSession session = MyBatisUtils.getSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		User user = new User();
		user.setUpwd("333");
		user.setUtel("32344");
		user.setUaccount("sss");
		boolean result = mapper.updateUser(user);
		session.commit();
		MyBatisUtils.closeSession();
		System.out.println(result);
	}
	
	@Test
	public void test5() {
		SqlSession session = MyBatisUtils.getSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		Map<String, String[]> parameterMap = new HashMap<>();
		int totaldata = mapper.queryTotalUser(null);
		System.out.println(totaldata);
	}
	
	@Test
	public void test6() {
		SqlSession session = MyBatisUtils.getSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		Map<String, String[]> parameterMap = new HashMap<>();
		String[] uaccount = {"a"};
		String[] role = {"户"};
		parameterMap.put("uaccount", uaccount);
		int totaldata = mapper.queryTotalUser(parameterMap);
		System.out.println(totaldata);
	}
	
	@Test
	public void test7() {
		SqlSession session = MyBatisUtils.getSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		Map<String, String[]> parameterMap = new HashMap<>();
		String[] uaccount = {"a"};
		String[] role = {"户"};
		parameterMap.put("uaccount", uaccount);
		parameterMap.put("role", role);
		//List<User> users = mapper.queryUserByPage(0, 3, null);
		List<User> users = mapper.queryUserByPage(0, 3, parameterMap);
		MyBatisUtils.closeSession();
		for (User user : users) {
			user.setUregistTime(TimeUtils.parseTime(user.getUregistTime()));
			System.out.println(user);
		}
	}
}

