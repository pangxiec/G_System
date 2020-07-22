<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="${pageContext.request.contextPath}/css/font.css" type=text/css rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/xadmin.css" type=text/css rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/xadmin.js" charset="utf-8"></script>
</head>
 <body>
        <div class="layui-fluid">
            <div class="layui-row">
                <form action="#" class="layui-form" id="edit_grade_form" method="post">
                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">学号:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="stuid" name="stuid" required="" value="${jg.stuid}" lay-verify="idname" autocomplete="off" class="layui-input" readonly="readonly"></div>
                        <div class="layui-form-mid layui-word-aux">
                    </div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">姓名:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="sname" name="sname" required="" value="${jg.sname}" lay-verify="nikename" autocomplete="off" class="layui-input" readonly="readonly"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">平时成绩:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="edit_javagrade1" name="edit_javagrade1" required="" value="${jg.javagrade1}" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">期中成绩:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="edit_javagrade2" name="edit_javagrade2" required="" value="${jg.javagrade2}" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">期末成绩:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="edit_javagrade3" name="edit_javagrade3" required="" value="${jg.javagrade3}" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">总成绩:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="edit_javagrade" name="edit_javagrade" required="" value="${jg.javagrade}" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn" onclick="updategrade()" >保存修改</button>
                    </div>
                </form>
            </div>
        </div>
        
        <script type="text/javascript">      
         // 执行修改客户操作
    	 function updategrade() {
    		$.post("${pageContext.request.contextPath}/Editupdategrade",
    				$("#edit_grade_form").serialize(),
    		    function(data)
    		    {
    			    if(data =="OK")
    			    {
    			    	alert("客户信息更新成功！");
    			    	window.location.reload();
    			    }
    			    else
    			    {
    				  alert("客户信息更新失败！");
    				  window.location.reload();
    				}
    		});
    		
    	}     	
        </script>                                    
</body>
</html>