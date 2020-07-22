package com.system.service.impl;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.system.dao.UserDao;
import com.system.po.User;
import com.system.service.UserService;

/**
 * Service接口实现类
 *
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	//注入UserDao
	@Autowired
	private UserDao userDao;
	@Override
	public User findAdminUser(@Param("usercode")String usercode,@Param("password")String password) {
		User user = this.userDao.findAdminUser(usercode, password);
		return user;
	}
	@Override
	public User findOrdinaryUser(@Param("usercode")String usercode,@Param("password")String password) {
		User user = this.userDao.findOrdinaryUser(usercode, password);
		return user;
	}

}
