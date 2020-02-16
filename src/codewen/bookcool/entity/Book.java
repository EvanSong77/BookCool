package codewen.bookcool.entity;

import java.io.Serializable;

/**
 * 书籍实体类
 * @author codewen
 *
 */
public class Book implements Serializable{

	private static final long serialVersionUID = 1L;
	private Integer bid;//书籍编号
	private String bname;//书籍的名字
	private String bauthor;//书籍的作者
	private String bintroduction;//书籍的简介
	private String bimg;//书籍的图片src
	private String bcategory;//书籍类别
	private Integer bnum;//书籍编号
	private String btime;//上架时间
	private Integer readtimes;//书籍阅读次数

	private Integer totalwords;//书籍总字数
	private Integer collectiontimes;//书籍收藏数
	
	public Book() {
	}
	
	public Book(String bname, String bauthor, String bintroduction, String bimg,
			String bcategory, Integer bnum, Integer totalwords) {
		this.bname = bname;
		this.bauthor = bauthor;
		this.bintroduction = bintroduction;
		this.bimg = bimg;
		this.bcategory = bcategory;
		this.bnum = bnum;
		this.totalwords = totalwords;
	}
	
	public Book(String bname, String bauthor, String bintroduction, String bimg,
			String bcategory, Integer bnum, String btime, Integer readtimes,
			Integer totalwords, Integer collectiontimes) {
		this.bname = bname;
		this.bauthor = bauthor;
		this.bintroduction = bintroduction;
		this.bimg = bimg;
		this.bcategory = bcategory;
		this.bnum = bnum;
		this.btime = btime;
		this.readtimes = readtimes;
		this.totalwords = totalwords;
		this.collectiontimes = collectiontimes;
	}

	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBauthor() {
		return bauthor;
	}
	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
	}
	public String getBintroduction() {
		return bintroduction;
	}
	public void setBintroduction(String bintroduction) {
		this.bintroduction = bintroduction;
	}
	public String getBtime() {
		return btime;
	}
	public void setBtime(String btime) {
		this.btime = btime;
	}
	public String getBimg() {
		return bimg;
	}
	public void setBimg(String bimg) {
		this.bimg = bimg;
	}
	public String getBcategory() {
		return bcategory;
	}
	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}
	public Integer getBnum() {
		return bnum;
	}
	public void setBnum(Integer bnum) {
		this.bnum = bnum;
	}

	public Integer getReadtimes() {
		return readtimes;
	}

	public void setReadtimes(Integer readtimes) {
		this.readtimes = readtimes;
	}

	public Integer getTotalwords() {
		return totalwords;
	}

	public void setTotalwords(Integer totalwords) {
		this.totalwords = totalwords;
	}

	public Integer getCollectiontimes() {
		return collectiontimes;
	}

	public void setCollectiontimes(Integer collectiontimes) {
		this.collectiontimes = collectiontimes;
	}

	@Override
	public String toString() {
		return "Book [bid=" + bid + ", bname=" + bname + ", bauthor=" + bauthor
				+ ", bintroduction=" + bintroduction + ", bimg=" + bimg
				+ ", bcategory=" + bcategory + ", bnum=" + bnum + ", btime="
				+ btime + ", readtimes=" + readtimes + ", totalwords="
				+ totalwords + ", collectiontimes=" + collectiontimes + "]";
	}
}
