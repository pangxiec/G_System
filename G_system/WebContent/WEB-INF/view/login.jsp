<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link href="${pageContext.request.contextPath}/css/font.css" type=text/css rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/login.css" type=text/css rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/xadmin.css" type=text/css rel="stylesheet">
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script>
// 判断是登录账号和密码是否为空
function check(){
    var usercode = $("#usercode").val();
    var password = $("#password").val();
    if(usercode=="" || password==""){
    	$("#message").text("账号或密码不能为空！");
        return false;
    }  
    return true;
}
</script>
</head>
<body class="login-bg">
    <div class="login layui-anim layui-anim-up">
        <div class="message">成绩-管理登录</div>
        <div id="darkbannerwrap"></div>   
        <font color="red">
			 <%-- 提示信息--%>
			 <span id="message">${msg}</span>
		</font>    
        <form action="${pageContext.request.contextPath }/login" 
        method="post" name="form1"  class="layui-form"  onsubmit="return check()">
            <input name="usercode" id="usercode" placeholder="用户账号"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" id="password" placeholder="密码"  type="password" lay-verify="required" class="layui-input">
            <hr class="hr15">         
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit" name="testlogin">
            <hr class="hr20" >
        </form>
    </div>
</body>
</html>