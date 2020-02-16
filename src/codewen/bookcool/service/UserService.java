package codewen.bookcool.service;

import java.util.Map;

import codewen.bookcool.entity.Page;
import codewen.bookcool.entity.User;

/**
 * 用户业务逻辑层接口类
 * @author codewen
 *
 */
public interface UserService {

	//增加用户方法
	public boolean addUser(User user);
	
	// 删除用户的方法 通过uaccount来删除
	public boolean deleteUser(String uaccount);
	
	// 修改用户信息的方法 通过user来修改用户信息
	public boolean updateUser(User user);

	// 通过uaccount查询该用户
	public User queryUserByuaccount(String uaccount);
	
	//查询一页用户
	public Page<User> queryUserByPage(int currentpageNum
			,int pagesize
			,Map<String, String[]> parameterMap);
	
}
