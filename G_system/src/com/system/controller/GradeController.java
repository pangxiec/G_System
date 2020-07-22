package com.system.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.system.po.JGrade;
import com.system.service.JGradeService;
import com.system.utils.Page;

import jdk.nashorn.internal.runtime.JSONFunctions;

@Controller
public class GradeController 
{
	@Autowired
	private JGradeService jgradeService;
	
	//向成绩列表跳转
	@RequestMapping(value="/toJava")
	public String toJava(JGrade jgrade,Integer pageNo,Integer pageSize,Model model)
	{
		pageNo = pageNo == null ? 1:pageNo;
		pageSize = pageSize == null ? 7:pageSize; 
		PageInfo<JGrade> pageBean = jgradeService.findAllJgradeByPage(jgrade,pageNo,pageSize);
//		List<JGrade> jglist = jgradeService.findAllJgrade(jgrade);
		model.addAttribute("pageInfo", pageBean);
		return "Jgrade";
	}
	
	//接受用户查询(按学号查询)
	@RequestMapping(value="/getvalue")
	public String getValue(Integer stuid,Model model,Integer pageNo,Integer pageSize)
	{
		pageNo = pageNo == null ? 1:pageNo;
		pageSize = pageSize == null ? 1:pageSize; 		
		PageInfo<JGrade> pageBean = jgradeService.findAllByIdAndPage(stuid, pageNo, pageSize);
		model.addAttribute("pageInfo", pageBean);
		return "Jgrade";
		
	}
	
	//向成绩添加跳转
	@RequestMapping(value="/toAddgrade")
	public String toAddgrade()
	{
		return "addgrade";
		
	}
	
	//新建成绩
	@RequestMapping(value="/creategrade")
	@ResponseBody
	public String Creategrade(JGrade jgrade,String stuid,String sname,HttpSession session,
			String javagrade1,String javagrade2,String javagrade3,String javagrade)
	{
		jgrade.setId(stuid);
		jgrade.setJavagrade1(javagrade1);
		jgrade.setJavagrade2(javagrade2);
		jgrade.setJavagrade3(javagrade3);
		jgrade.setJavagrade(javagrade);
		System.out.println("新建成功！！！");
		System.out.println(jgrade);
		int rows = jgradeService.creatGrade(jgrade);
		
		if(rows > 0)
		{
//			return "redirect:Jgrade";
			return "OK";
		}
		else
		{
			return "FALL";
		}	
	}
	
	//删除
	@RequestMapping(value="/deletegrade")
	@ResponseBody
	public String deletegrade(Integer stuid,HttpSession session)
	{
		int rows = jgradeService.deletegrade(stuid);
		if(rows > 0)
		{
			return "OK";
		}
		else
		{
			return "FALL";
		}			
	}
	
	//通过stuid得到信息
	@RequestMapping(value="/getGradeById",method=RequestMethod.GET)
	public JGrade getGradeById(Integer stuid)
	{
		JGrade jgrade = jgradeService.getGradeById(stuid);
		System.out.println(jgrade);
		return jgrade;
		
	}
	
	//向成绩编辑页面跳转	
	@RequestMapping(value="/toupdategrade")
	public String toupdategrade(Integer stuid,Model model,HttpSession session)
	{
		JGrade jg = jgradeService.getGradeById(stuid);
//		System.out.println(jg);
		model.addAttribute("jg", jg);
		return "updategrade";
		
	}
	
	//接受成绩编辑信息
	@RequestMapping(value="/Editupdategrade")
	@ResponseBody
	public String updategrade(JGrade jgrade,String stuid,HttpSession session,
			String edit_javagrade1,String edit_javagrade2,String edit_javagrade3,String edit_javagrade)
	{
		JGrade jg = new JGrade();
		jg.setStuid(stuid);
		jg.setJavagrade1(edit_javagrade2);
		jg.setJavagrade2(edit_javagrade2);
		jg.setJavagrade3(edit_javagrade3);
		jg.setJavagrade(edit_javagrade);
		
		int rows = jgradeService.updategrade(jg);
		if(rows > 0)
		{
			System.out.println("更新成功！！！");
			System.out.println(jg);
			return "OK";
		}
		else
		{
			return "FALL";
		}		
	}
	
	//不及格人数
	@RequestMapping(value="/toChart1")
	public String toChart1(JGrade jgrade,Model model)
	{
		List<JGrade> jglist = jgradeService.findnotpass(jgrade);
		model.addAttribute("jglist", jglist);
		return "chart1";
	}
	
	//将成绩导出为excel
	@RequestMapping(value="/exportExcel")
	public void exportExcel(HttpServletResponse response) throws IOException	
	{
		response.setCharacterEncoding("UTF-8");
		//获取数据
		List<JGrade> list = jgradeService.findAll();
		System.out.println(list);
		
		//创建excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		//创建sheet页
        HSSFSheet sheet = wb.createSheet("成绩信息表");
        //创建标题行
        HSSFRow titleRow = sheet.createRow(0);
        titleRow.createCell(0).setCellValue("学号");
        titleRow.createCell(1).setCellValue("姓名");
        titleRow.createCell(2).setCellValue("平时成绩");
        titleRow.createCell(3).setCellValue("期中成绩");
        titleRow.createCell(4).setCellValue("期末成绩");
        titleRow.createCell(5).setCellValue("总成绩");
        
        //遍历将数据放到excel列中
        for(JGrade jg : list)
        {
        	HSSFRow dataRow = sheet.createRow(sheet.getLastRowNum()+1);
        	dataRow.createCell(0).setCellValue(jg.getStuid());
        	dataRow.createCell(1).setCellValue(jg.getSname());
        	dataRow.createCell(2).setCellValue(jg.getJavagrade1());
        	dataRow.createCell(3).setCellValue(jg.getJavagrade2());
        	dataRow.createCell(4).setCellValue(jg.getJavagrade3());
        	dataRow.createCell(5).setCellValue(jg.getJavagrade());
        }
        
        // 设置下载时客户端Excel的名称
        response.setContentType("application/octet-stream;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="
                + new String("java成绩表".getBytes(),"iso-8859-1") + ".xls");
        
        OutputStream ouputStream = response.getOutputStream();  
        wb.write(ouputStream);  
        ouputStream.flush();  
        ouputStream.close();		
		
	}
	
	//上传文件
	@RequestMapping("/fileUpload")
	public String handleFormUpload(@RequestParam("name") String name,
			@RequestParam("uploadfile") List<MultipartFile> uploadfile,
			HttpServletRequest request) 
	{
		if (!uploadfile.isEmpty() && uploadfile.size() > 0) 
		{
			for (MultipartFile file : uploadfile) 
			{
				String originalFilename = file.getOriginalFilename();
				String dirPath = 
                       request.getServletContext().getRealPath("/upload/");
				File filePath = new File(dirPath);
				if (!filePath.exists()) {
					filePath.mkdirs();
				}
				String newFilename = name+ "_"+UUID.randomUUID() + 
                                                   "_"+originalFilename;
				try {
					file.transferTo(new File(dirPath + newFilename));
				} catch (Exception e) {
					e.printStackTrace();
					return "FALL";
				}
			}
			return "OK";
		}else{
			return "FALL";
		}
	}

}
