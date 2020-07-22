package com.system.service;

import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.github.pagehelper.PageInfo;
import com.system.dao.JGradeDao;
import com.system.po.JGrade;
import com.system.utils.Page;

public interface JGradeService 
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
	
	public List<JGrade> getvalue(Integer stuid);
	
	//查询不及格人数
	public List<JGrade> findnotpass(JGrade jgrade);
	
	//将成绩导出为excel
	public List<JGrade> findAll();
	
	//分页获取列表
	public PageInfo<JGrade> findAllJgradeByPage(JGrade jgrade, Integer pageNo, Integer pageSize);
	
	public PageInfo<JGrade> findAllByIdAndPage(Integer stuid, Integer pageNo, Integer pageSize);

	
}
