package com.system.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.system.po.Student;
import com.system.po.User;
import com.system.service.StudentService;
import com.system.service.UserService;

/**
 * 用户控制类
 *
 */
/**
 * @author 大头
 *
 */
@Controller
public class UserController 
{
	// 依赖注入
    @Autowired
	private UserService userService;
	/**
	 * 用户登录
	*/
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String usercode,String password, Model model, HttpSession session) 
	{
		// 通过账号和密码查询用户
		User adminUser = userService.findAdminUser(usercode, password);		
		User ordinaryUser = userService.findOrdinaryUser(usercode, password);
		
		if(adminUser != null)
		{		
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", adminUser);
			// 跳转到主页面
			return "main";
		}
		else if(ordinaryUser != null)
		{
			session.setAttribute("USER_SESSION", ordinaryUser);
			return "test";
		}
		
		model.addAttribute("msg", "账号或密码错误，请重新输入！");
	    // 返回到登录页面
		return "login";
	}
	
	/**
	 * 退出登录
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) 
	{
	    // 清除Session
	    session.invalidate();
	    // 重定向到登录页面的跳转方法
	    return "redirect:login";
	}
	
	/**
	 * 向用户登陆页面跳转
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String toLogin() 
	{
	    return "login";
	}
	
	/**
	 * 跳转到欢迎页面
	 */
	@RequestMapping(value="/toWelcome")
	public String toWeclome()
	{
		return "welcome";
		
	}
	
	/**
	 * 向学生列表页面跳转
	 */
	@RequestMapping(value="/toStudent")
	public String toStudent()
	{
		return "student";	
	}
	
	/**
	 * 向教师列表页面跳转
	 */
	@RequestMapping(value="/toTeacher")
	public String toTeacher()
	{
		return "teacher";		
	}
	
//	/**
//	 * 向成绩分析页面跳转
//	 */
//	@RequestMapping(value="/toChart1")
//	public String toChart1()
//	{
//		return "chart1";
//	}
	
	/**
	 * 向管理员页面跳转
	 */
	@RequestMapping(value="/toadminuser")
	public String toAdminUser()
	{
		return "user";
		
	}
	
	
	/**
	 * 向权限列表跳转
	 */
	@RequestMapping(value="/toadmin")
	public String toadmin()
	{
		return "admin-role";
		
	}
	
	
	
}
