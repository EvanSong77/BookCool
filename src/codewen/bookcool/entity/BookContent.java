package codewen.bookcool.entity;

import java.io.Serializable;

/**
 * 书籍章节内容实体类
 * @author codewen
 *
 */
public class BookContent implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Integer bcid;//章节表中章节编号
	private String bcname;// 书籍名
	private String bcchapter;// 书籍章节标题
	private String bccontent;// 书籍章节内容
	private Integer bc_bnum;// 书籍编号
	private Integer chapter_num;//书籍章节编号

	public BookContent() {
	}

	public BookContent(String bcname, String bcchapter, String bccontent,
			Integer bc_bnum, Integer chapter_num) {
		this.bcname = bcname;
		this.bcchapter = bcchapter;
		this.bccontent = bccontent;
		this.bc_bnum = bc_bnum;
		this.chapter_num = chapter_num;
	}

	public Integer getBcid() {
		return bcid;
	}

	public void setBcid(Integer bcid) {
		this.bcid = bcid;
	}

	public String getBcname() {
		return bcname;
	}

	public void setBcname(String bcname) {
		this.bcname = bcname;
	}

	public String getBcchapter() {
		return bcchapter;
	}

	public void setBcchapter(String bcchapter) {
		this.bcchapter = bcchapter;
	}

	public String getBccontent() {
		return bccontent;
	}

	public void setBccontent(String bccontent) {
		this.bccontent = bccontent;
	}

	public Integer getBc_bnum() {
		return bc_bnum;
	}

	public void setBc_bnum(Integer bc_bnum) {
		this.bc_bnum = bc_bnum;
	}

	public Integer getChapter_num() {
		return chapter_num;
	}

	public void setChapter_num(Integer chapter_num) {
		this.chapter_num = chapter_num;
	}

	@Override
	public String toString() {
		return "BookContent [bcid=" + bcid + ", bcname=" + bcname
				+ ", bcchapter=" + bcchapter + ", bccontent=" + bccontent
				+ ", bc_bnum=" + bc_bnum + ", chapter_num=" + chapter_num + "]";
	}
	
}
