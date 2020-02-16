package codewen.bookcool.entity;

/**
 * 评论实体类
 * @author codewen
 *
 */
public class Comments {
	
	private Integer cid;//评论编号
	private Integer c_bnum;//评论书籍编号
	private String c_account;//评论账号
	private String c_to_account;//被评论的账号
	private String ccontent;//评论内容
	private String ctime;//评论时间
	private Integer ctype;//评论类型
	private Integer state;//״评论类型
	private String updatetime;//更新评论时间
	
	public Comments() {
	
	}
	
	public Comments(Integer c_bnum, String c_account, String c_to_account,
			String ccontent, String ctime, Integer ctype) {
		this.c_bnum = c_bnum;
		this.c_account = c_account;
		this.c_to_account = c_to_account;
		this.ccontent = ccontent;
		this.ctime = ctime;
		this.ctype = ctype;
	}

	public Comments(Integer c_bnum, String c_account, String c_to_account,
			String ccontent, String ctime, Integer ctype, Integer state,
			String updatetime) {
		this.c_bnum = c_bnum;
		this.c_account = c_account;
		this.c_to_account = c_to_account;
		this.ccontent = ccontent;
		this.ctime = ctime;
		this.ctype = ctype;
		this.state = state;
		this.updatetime = updatetime;
	}
	
	public Comments(Integer cid, Integer c_bnum, String c_account, String c_to_account,
			String ccontent, String ctime, Integer ctype, Integer state,
			String updatetime) {
		super();
		this.cid = cid;
		this.c_bnum = c_bnum;
		this.c_account = c_account;
		this.c_to_account = c_to_account;
		this.ccontent = ccontent;
		this.ctime = ctime;
		this.ctype = ctype;
		this.state = state;
		this.updatetime = updatetime;
	}

	public Integer getC_bnum() {
		return c_bnum;
	}
	public void setC_bnum(Integer c_bnum) {
		this.c_bnum = c_bnum;
	}
	public String getC_account() {
		return c_account;
	}
	public void setC_account(String c_account) {
		this.c_account = c_account;
	}
	public String getC_to_account() {
		return c_to_account;
	}
	public void setC_to_account(String c_to_account) {
		this.c_to_account = c_to_account;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public Integer getCtype() {
		return ctype;
	}
	public void setCtype(Integer ctype) {
		this.ctype = ctype;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	@Override
	public String toString() {
		return "Comments [cid=" + cid + ", c_bnum=" + c_bnum + ", c_account="
				+ c_account + ", c_to_account=" + c_to_account + ", ccontent="
				+ ccontent + ", ctime=" + ctime + ", ctype=" + ctype
				+ ", state=" + state + ", updatetime=" + updatetime + "]";
	}
}
