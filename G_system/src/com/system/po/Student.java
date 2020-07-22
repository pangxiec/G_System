package com.system.po;

public class Student 
{
	private int stuid;//学号
	private String sname;//姓名
	private String sex;//性别
	private String gradeclass;//年级班级
	private String major;//专业
	private String college;//学院
	private Integer start;//起始行
	private Integer rows;//所取行数

	public int getStuid() {
		return stuid;
	}
	public void setStuid(int stuid) {
		this.stuid = stuid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getGradeclass() {
		return gradeclass;
	}
	public void setGradeclass(String gradeclass) {
		this.gradeclass = gradeclass;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	@Override
	public String toString() {
		return "Student [stuid=" + stuid + ", sname=" + sname + ", sex=" + sex + ", gradeclass=" + gradeclass
				+ ", major=" + major + ", college=" + college + "]";
	}
	
	
	
	

}
