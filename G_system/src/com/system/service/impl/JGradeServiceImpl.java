package com.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.system.dao.JGradeDao;
import com.system.po.JGrade;
import com.system.service.JGradeService;
import com.system.utils.Page;

@Service("jgradeService")
@Transactional
public class JGradeServiceImpl implements JGradeService {

	@Autowired
	private JGradeDao jgradeDao;
	
	@Override
	public List<JGrade> findAllJgrade(JGrade jgrade) 
	{
		List<JGrade> jg = this.jgradeDao.findAllJgrade(jgrade);
		return jg;
	}
	
	@Override
	public PageInfo<JGrade> findAllJgradeByPage(JGrade jgrade,Integer pageNo, Integer pageSize) 
	{
		PageHelper.startPage(pageNo,pageSize);
		PageInfo<JGrade> pageBean = new PageInfo(this.jgradeDao.findAllJgrade(jgrade));
		return pageBean;
	}
	
	@Override
	public PageInfo<JGrade> findAllByIdAndPage(Integer stuid, Integer pageNo, Integer pageSize) {
		PageHelper.startPage(pageNo,pageSize);
		PageInfo<JGrade> pageBean = new PageInfo(this.jgradeDao.getvalue(stuid));
		return pageBean;
	}
	
	@Override
	public int creatGrade(JGrade jgrade) {		 
		return this.jgradeDao.creatGrade(jgrade);
	}

	@Override
	public int deletegrade(Integer stuid) {
		// TODO Auto-generated method stub
		return this.jgradeDao.deletegrade(stuid);
	}

	@Override
	public JGrade getGradeById(Integer stuid) {
		// TODO Auto-generated method stub
		return this.jgradeDao.getGradeById(stuid);
	}

	@Override
	public int updategrade(JGrade jgrade) {
		// TODO Auto-generated method stub
		return this.jgradeDao.updategrade(jgrade);
	}

	@Override
	public List<JGrade> getvalue(Integer stuid) {
		// TODO Auto-generated method stub
		List<JGrade> jg = this.jgradeDao.getvalue(stuid);
		return jg;
	}

	@Override
	public List<JGrade> findnotpass(JGrade jgrade) {
		List<JGrade> jg = this.jgradeDao.findnotpass(jgrade);
		return jg;
	}

	@Override
	public List<JGrade> findAll() {
		
		return this.jgradeDao.findAll();
	}



	

	

}
