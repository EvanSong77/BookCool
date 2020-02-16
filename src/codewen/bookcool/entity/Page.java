package codewen.bookcool.entity;

import java.util.List;

/**
 * 用于分页的实体类
 * @author codewen
 *
 */
public class Page<T> {
	
	private int totaldata;//总数据数
	private int pagesize;//页面大小
	private int totalpage;//总页数
	private int currentpage;//当前页面
	private int currentpageNum;//当前页码
	private List<T> pageLists;//接收分页查询的一页结果集
	
	public Page() {
		
	}
	
	public Page(int totaldata, int pagesize, int totalpage, int currentpage,
			int currentpageNum, List<T> pageLists) {
		this.totaldata = totaldata;
		this.pagesize = pagesize;
		this.totalpage = totalpage;
		this.currentpage = currentpage;
		this.currentpageNum = currentpageNum;
		this.pageLists = pageLists;
	}

	public List<T> getPageLists() {
		return pageLists;
	}

	public void setPageLists(List<T> pageLists) {
		this.pageLists = pageLists;
	}

	public int getTotaldata() {
		return totaldata;
	}
	public void setTotaldata(int totaldata) {
		this.totaldata = totaldata;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getCurrentpageNum() {
		return currentpageNum;
	}
	public void setCurrentpageNum(int currentpageNum) {
		this.currentpageNum = currentpageNum;
	}

	@Override
	public String toString() {
		return "Page [totaldata=" + totaldata + ", pagesize=" + pagesize
				+ ", totalpage=" + totalpage + ", currentpage=" + currentpage
				+ ", currentpageNum=" + currentpageNum + ", pageLists="
				+ pageLists + "]";
	}
}
