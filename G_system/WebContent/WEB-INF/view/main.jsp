<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link href="${pageContext.request.contextPath}/css/font.css" type=text/css rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/xadmin.css" type=text/css rel="stylesheet">
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/xadmin.js" charset="utf-8"></script>
</head>

<body class="index">
        <!-- 顶部开始 -->
        <div class="container">
            <div class="logo">
                <a href="main.jsp">成绩管理系统v1.0</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
            <ul class="layui-nav left fast-add" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">快捷操作</a>
                    <dl class="layui-nav-child">
                      <!-- 二级菜单 -->                      
                      <dd>
                        <a onclick="xadmin.open('系统帮助','http://www.baidu.com')">
                            <i class="layui-icon layui-icon-username"></i>系统帮助</a>
                      </dd>
                    </dl>
                </li>
            </ul>
            
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item" lay-unselect>
                  <a lay-href="app/message/index.html" layadmin-event="message" lay-text="消息中心">
                   <i class="layui-icon layui-icon-notice"></i>  
                     <!-- 如果有新消息，则显示小圆点 -->
                     <span class="layui-badge-dot"></span>
                  </a>
                </li>
            </ul> 
            
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">当前用户：${USER_SESSION.username}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('个人信息','http://www.baidu.com')">个人信息</a></dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/logout">切换账号</a></dd>
                        <dd>
                            <a href="${pageContext.request.contextPath}/logout">退出</a></dd>
                    </dl>
                </li>
            </ul>           
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <li>
                        <a href="javascript:;">
                           <i class="iconfont">&#xe6da;</i>
                            <cite>成绩信息</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('成绩分析','${pageContext.request.contextPath}/toChart1')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>成绩分析</cite></a>
                            </li>
                        </ul>
                     </li>
                     
                     <li>
                        <a href="javascript:;">
                           <i class="iconfont">&#xe699;</i>
                            <cite>师生信息</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                             <li date-refresh="1">
                                 <a onclick="xadmin.add_tab('学生列表','${pageContext.request.contextPath}/findAllStudent')">
                                 <i class="iconfont">&#xe6a7;</i>
                                 <cite>学生列表</cite>
                                </a>                             
                            </li >
                            <li>
                                <a onclick="xadmin.add_tab('教师列表','${pageContext.request.contextPath}/toTeacher')">
                                    <i class="iconfont">&#xe6a7;</i>
                                   <cite>教师列表</cite>
                                 </a>
                            </li>                       
                        </ul>
                     </li>
                     
                     <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe6c9;</i>
                            <cite>成绩录入</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                             <li date-refresh="1">
                                <a onclick="xadmin.add_tab('JAVA成绩','${pageContext.request.contextPath}/toJava')">
                                 <i class="iconfont">&#xe6a7;</i>
                                 <cite>JAVA成绩</cite>
                                </a>
                            </li >                                          
                        </ul>
                     </li>
                     
                     <li>
                        <a href="javascript:;">
                            <i class="iconfont">&#xe6fb;</i>
                            <cite>课程管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>                      
                     </li>
                     
                     <li>
                        <a href="javascript:;">
                           <i class="iconfont">&#xe6b8;</i>
                            <cite>管理员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                             <li date-refresh="1">
                                <a onclick="xadmin.add_tab('管理员列表','${pageContext.request.contextPath}/toadminuser')">
                                 <i class="iconfont">&#xe6a7;</i>
                                 <cite>后台管理员</cite>
                                </a>
                            </li >
                            <li>
                                <a onclick="xadmin.add_tab('权限列表','${pageContext.request.contextPath}/toadmin')">
                                    <i class="iconfont">&#xe6a7;</i>
                                   <cite>权限列表</cite>
                                 </a>
                            </li>                       
                        </ul>
                     </li>
                     
                  </ul>
               </div>
           </div>      
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src="${pageContext.request.contextPath}/toWelcome" frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
</body>
</html>