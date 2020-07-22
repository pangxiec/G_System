package com.system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.system.po.Student;

/**
 * @Student接口
 *
 */
public interface StudentDao 
{
	//查询学生列表
	public List<Student> selectStudentList(Student student);
	
	public List<Student> findAllStudent();
			   
}
