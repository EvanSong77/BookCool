package codewen.bookcool.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import codewen.bookcool.entity.User;

/**
 * 用户持久层接口类
 * @author codewen
 *
 */
public interface UserMapper {
	
	//增加用户方法
	public boolean addUser(User user);
	
	// 删除用户的方法 通过uaccount来删除
	public boolean deleteUser(String uaccount);
	
	// 修改用户信息的方法 通过user来修改用户信息
	public boolean updateUser(User user);
	
	// 通过uaccount查询该用户
	public User queryUserByuaccount(String uaccount);
	
	//查询用户个数
	public int queryTotalUser(@Param("parameterMap")Map<String, String[]> parameterMap);
	
	//查询一页用户
	public List<User> queryUserByPage(@Param("currentpage")int currentpage
			,@Param("pagesize")int pagesize
			,@Param("parameterMap")Map<String, String[]> parameterMap);
	
}
