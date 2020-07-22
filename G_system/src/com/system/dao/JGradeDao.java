package com.system.dao;

import java.util.List;

import com.system.po.JGrade;

public interface JGradeDao 
{
	//显示成绩列表
	public List<JGrade> findAllJgrade(JGrade jgrade);
	//新建
	public int creatGrade(JGrade jgrade);
	//删除
	public int deletegrade(Integer stuid);
	
	//通过id获取成绩信息
	public JGrade getGradeById(Integer stuid);
	
	//更新
	public int updategrade(JGrade jgrade);	
	
	//查询
	public List<JGrade> getvalue(Integer stuid);
	
	//将成绩导出为excel
	public List<JGrade> findAll();
	
	//查询不及格人数
	public List<JGrade> findnotpass(JGrade jgrade);
	
	
	
	
	

}
