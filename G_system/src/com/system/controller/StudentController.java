package com.system.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.system.po.JGrade;
import com.system.po.Student;
import com.system.service.StudentService;

/**
 * 
 * *学生控制器
 * 
 */

@Controller
public class StudentController 
{
	//依赖注入
	@Autowired
	private StudentService studentService;
	
	//学生列表
	@RequestMapping(value="/listStudent")
	public String list(Student student,Model model)
	{
		List<Student> stulist = studentService.selectStudentList(student);
		model.addAttribute("stulist", stulist);
		return "student";
		
	}
	
	//分页
	@RequestMapping("/findAllStudent")  
    public String findAllStudent(@RequestParam(required = false, defaultValue = "1") Integer page,
                             HttpServletRequest request, Model model){
        PageHelper.startPage(page,2);
        List<Student> stu = studentService.findAllStudent();
        System.out.println(stu);
        PageInfo<Student> p = new PageInfo<Student>(stu);
        model.addAttribute("page",p);
        model.addAttribute("stulist", stu);
        request.setAttribute("stulist", stu);
        return "student";
    }  
	
	

	
}
