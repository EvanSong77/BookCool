package codewen.bookcool.util;

import codewen.bookcool.entity.Page;

/**
 * 处理和封装page的工具类
 * @author codewen
 *
 */
public class PageUtils {

	/**
	 * 处理和封装Page对象的方法
	 * @param currentpageNum 当前页码
	 * @param pagesize 页面大小
	 * @param totaldata	总数据数
	 * @return
	 */
	public static <T> Page<T> getPages(int currentpageNum, int pagesize,int totaldata) {
		//创建Page对象
		Page<T> pages = new Page<T>();
		if(totaldata == 0) {//如果结果为0 直接返回
			pages.setTotaldata(totaldata);
			pages.setTotalpage(0);
			return pages;
		}
		int totalpage = totaldata % pagesize == 0
				? totaldata / pagesize
				: totaldata / pagesize + 1;
		// 这里是用于控制翻页的第一页
		if (currentpageNum <= 0) {
			currentpageNum = 1;
		}
		// 这里是于控制翻页的最后一页
		if (currentpageNum >= totalpage) {
			currentpageNum = totalpage;
		}
		int currentpage = (currentpageNum - 1) * pagesize;
		
		// 将数据进行封装
		pages.setCurrentpage(currentpage);// 当前页面
		pages.setPagesize(pagesize);// 页面大小
		pages.setCurrentpageNum(currentpageNum);// 当前页码
		pages.setTotaldata(totaldata);// 总数据数
		pages.setTotalpage(totalpage);// 总页面数
		
		return pages;
	}
}
