package com.system.service;

import org.apache.ibatis.annotations.Param;

import com.system.po.User;

/**
    *  用户Service接口
 *
 */
public interface UserService 
{
	//通过账号和密码查询用户
	public User findAdminUser(@Param("usercode")String usercode,@Param("password")String password);
	public User findOrdinaryUser(@Param("usercode")String usercode,@Param("password")String password);
}
