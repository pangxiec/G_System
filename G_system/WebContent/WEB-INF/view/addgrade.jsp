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
                <form class="layui-form" id="new_grade_from">
                    <div class="layui-form-item">
                        <label for="L_email" class="layui-form-label">
                            <span class="x-red">*</span>学号:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="stuid" name="stuid" required="" lay-verify="idname" autocomplete="off" class="layui-input"></div>
                        </div>
                   
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>姓名:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="sname" name="sname" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>平时成绩:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="javagrade1" name="javagrade1" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>期中成绩:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="javagrade2" name="javagrade2" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>期末成绩:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="javagrade3" name="javagrade3" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_username" class="layui-form-label">
                            <span class="x-red">*</span>总成绩:</label>
                        <div class="layui-input-inline">
                            <input type="text" id="javagrade" name="javagrade" required="" lay-verify="nikename" autocomplete="off" class="layui-input"></div>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label"></label>
                        <button class="layui-btn"  name="addgrade" onclick="createGrade()">增加</button>
                    </div>
                </form>
            </div>
        </div>
        <script>layui.use(['form', 'layer','jquery'],
            function(){
                $ = layui.jquery;
                var form = layui.form,
                layer = layui.layer;

                //自定义验证规则
                form.verify({
                    idname: function(value) {
                        if (value.length < 5) {
                            return '学号没填写';
                        }
                    }
                });   
            });
           
           //新建成绩
           function createGrade()
           {
        	  $.post("${pageContext.request.contextPath}/creategrade",
        		  $("#new_grade_from").serialize(),
        		  function(data)
        		  {
        				        if(data =="OK")
        				        {
        				            alert("新建成功！");
        				            window.location.reload();
        				        }
        				        else
        				        {
        				            alert("新建失败！");
        				            window.location.reload();
        				        }
        		   });
           }               
        </script>
        
</body>
</html>