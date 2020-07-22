package com.system.dao;

import org.apache.ibatis.annotations.Param;

import com.system.po.User;

/**
 * 用户Dao接口
 *
 */
public interface UserDao 
{
	//通过账号和密码查询用户
	//加入@Param防止读取不到数据
	public User findAdminUser(@Param("usercode")String usercode,@Param("password")String password);
	
	public User findOrdinaryUser(@Param("usercode")String usercode,@Param("password")String password);
}
