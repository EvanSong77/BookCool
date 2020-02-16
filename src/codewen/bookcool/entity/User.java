package codewen.bookcool.entity;

import java.io.Serializable;

/**
 * 用户实体类
 * @author codewen
 *
 */
public class User implements Serializable{

	private static final long serialVersionUID = 1L;

	private Integer uid;//用户编号
	private String uaccount;//用户账号
	private String upwd;//用户密码
	private String usex;//性别
	private Integer uage;//年龄
	private String uemail;//邮箱
	private String utel;//电话
	private String uaddress;//住址
	private String uintroduction;//用户介绍
	private String role;//用户级别(默认为普通用户)
	private String uregistTime;//用户注册时间
	
	public User() {
		
	}
	public User(String uaccount, String upwd, String role) {
		this.uaccount = uaccount;
		this.upwd = upwd;
		this.role = role;
	}
	public User(String uaccount, String upwd, String usex, Integer uage,
			String uemail, String utel, String uaddress, String uintroduction) {
		this.uaccount = uaccount;
		this.upwd = upwd;
		this.usex = usex;
		this.uage = uage;
		this.uemail = uemail;
		this.utel = utel;
		this.uaddress = uaddress;
		this.uintroduction = uintroduction;
	}
	public User(String uaccount, String upwd, String usex, Integer uage,
			String uemail, String utel, String uaddress, String uintroduction,
			String role) {
		this.uaccount = uaccount;
		this.upwd = upwd;
		this.usex = usex;
		this.uage = uage;
		this.uemail = uemail;
		this.utel = utel;
		this.uaddress = uaddress;
		this.uintroduction = uintroduction;
		this.role = role;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUaccount() {
		return uaccount;
	}
	public void setUaccount(String uaccount) {
		this.uaccount = uaccount;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public Integer getUage() {
		return uage;
	}
	public void setUage(Integer uage) {
		this.uage = uage;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUtel() {
		return utel;
	}
	public void setUtel(String utel) {
		this.utel = utel;
	}
	public String getUaddress() {
		return uaddress;
	}
	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}
	public String getUintroduction() {
		return uintroduction;
	}
	public void setUintroduction(String uintroduction) {
		this.uintroduction = uintroduction;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getUregistTime() {
		return uregistTime;
	}
	public void setUregistTime(String uregistTime) {
		this.uregistTime = uregistTime;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", uaccount=" + uaccount + ", upwd=" + upwd
				+ ", usex=" + usex + ", uage=" + uage + ", uemail=" + uemail
				+ ", utel=" + utel + ", uaddress=" + uaddress
				+ ", uintroduction=" + uintroduction + ", role=" + role
				+ ", uregistTime=" + uregistTime + "]";
	}
}
