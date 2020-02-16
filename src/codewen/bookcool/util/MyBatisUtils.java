package codewen.bookcool.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * mybatis工具类
 * @author codewen
 *
 */
public class MyBatisUtils {

	private static SqlSessionFactory sessionFactory = null; 
	
	//使用本地线程管理sqlsession，保证了线程安全
	private static ThreadLocal<SqlSession> sessionThread = new ThreadLocal<SqlSession>();
	
	//静态代码块初始化sessionFactory
	static {
		try {
			InputStream is = Resources.getResourceAsStream("conf.xml");
			sessionFactory = new SqlSessionFactoryBuilder().build(is);
			is.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//获取sessionFactory
	public static SqlSessionFactory getSessionFactory() {
		return sessionFactory;
	}
	
	//新建session，将session放入本地线程中
	private static void newSession() {
		SqlSession session = sessionFactory.openSession();
		sessionThread.set(session);
	}
	
	//获取session
	public static SqlSession getSession() {
		SqlSession session = sessionThread.get();
		if(session == null) {
			//调用newSession(),新建session，将session放入本地线程中
			newSession();
			//从本地线程中获取session
			session = sessionThread.get();
		}
		return session;
	}
	
	//关闭session
	public static void closeSession() {
		SqlSession session = sessionThread.get();
		if(session != null) {
			//关闭session
			session.close();
			//将本地线程的SqlSession设为null
			sessionThread.set(null);
		}
	}
}
