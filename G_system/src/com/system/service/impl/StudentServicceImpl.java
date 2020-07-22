package com.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.system.dao.StudentDao;
import com.system.po.Student;
import com.system.service.StudentService;

/**
 * Service接口实现类
 *
 */
@Service("studentService")
@Transactional
public class StudentServicceImpl implements StudentService {

	//注入Dao
	@Autowired
	private StudentDao studentDao;
	
	@Override
	public List<Student> selectStudentList(Student student) {
		List<Student> stu = studentDao.selectStudentList(student);
		return stu;
	}

	@Override
	public List<Student> findAllStudent() {
		// TODO Auto-generated method stub
		return studentDao.findAllStudent();
	}
	

	


}
