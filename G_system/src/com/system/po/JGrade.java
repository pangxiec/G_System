package com.system.po;


/**
 * @成绩
 *
 */
public class JGrade 
{
	private String id;
	private String stuid;
	private String sname;
	private String javagrade1;//平时成绩
	private String javagrade2;//期中成绩
	private String javagrade3;//期末成绩
	private String javagrade;//总成绩
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStuid() {
		return stuid;
	}
	public void setStuid(String stuid) {
		this.stuid = stuid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getJavagrade1() {
		return javagrade1;
	}
	public void setJavagrade1(String javagrade1) {
		this.javagrade1 = javagrade1;
	}
	public String getJavagrade2() {
		return javagrade2;
	}
	public void setJavagrade2(String javagrade2) {
		this.javagrade2 = javagrade2;
	}
	public String getJavagrade3() {
		return javagrade3;
	}
	public void setJavagrade3(String javagrade3) {
		this.javagrade3 = javagrade3;
	}
	public String getJavagrade() {
		return javagrade;
	}
	public void setJavagrade(String javagrade) {
		this.javagrade = javagrade;
	}
	@Override
	public String toString() {
		return "Grade [id=" + id + ", stuid=" + stuid + ", sname=" + sname + ", javagrade1=" + javagrade1
				+ ", javagrade2=" + javagrade2 + ", javagrade3=" + javagrade3 + ", javagrade=" + javagrade + "]";
	}
	
	
}
