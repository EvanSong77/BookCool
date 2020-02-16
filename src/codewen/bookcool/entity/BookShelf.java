package codewen.bookcool.entity;

import java.io.Serializable;

public class BookShelf implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer bsid;//书籍在书架中的编号
	private Integer bs_bnum;//书籍号
	private String bs_account;//放入书籍的账户
	private String bstime;//加入书架的时间
	
	private Book book;//bookshelf的一个外键关联book表
	
	public BookShelf() {
	}
	public BookShelf(Integer bs_bnum, String bs_account) {
		this.bs_bnum = bs_bnum;
		this.bs_account = bs_account;
	}
	public Integer getBs_bnum() {
		return bs_bnum;
	}
	public void setBs_bnum(Integer bs_bnum) {
		this.bs_bnum = bs_bnum;
	}
	public String getBs_account() {
		return bs_account;
	}
	public void setBs_account(String bs_account) {
		this.bs_account = bs_account;
	}
	public Integer getBsid() {
		return bsid;
	}
	public void setBsid(Integer bsid) {
		this.bsid = bsid;
	}
	public String getBstime() {
		return bstime;
	}
	public void setBstime(String bstime) {
		this.bstime = bstime;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	@Override
	public String toString() {
		return "BookShelf [bsid=" + bsid + ", bs_bnum=" + bs_bnum
				+ ", bs_account=" + bs_account + ", bstime=" + bstime + "]";
	}
}
