package com.system.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.system.po.Student;

public interface StudentService 
{
	//查询学生列表
	public List<Student> selectStudentList(Student student);
	
	public List<Student> findAllStudent();
	
	
}
