<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link href="${pageContext.request.contextPath}/css/font.css" type=text/css rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/xadmin.css" type=text/css rel="stylesheet">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/xadmin.js" charset="utf-8"></script>
</head>
<body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a>
                    <cite>导航元素</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
            </a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5">                                
                                <div class="layui-input-inline layui-show-xs-block">
                                    <input type="text" name="username" placeholder="请输入姓名" autocomplete="off" class="layui-input"></div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach">
                                        <i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()">
                                <i class="layui-icon"></i>批量删除</button>
                            <button class="layui-btn" onclick="xadmin.open('添加用户','./order-add.html',800,600)">
                                <i class="layui-icon"></i>添加</button></div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                                <thead>
                                    <tr>
                                        <th>
                                        <input type="checkbox" name="" lay-skin="primary">
                                        </th>
                                        <th>学号</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>年级班级</th>
                                        <th>专业</th>
                                        <th>学院</th>                                        
                                        <th>操作</th>
                                    </tr>
                                </thead>                              
                                <tbody>    
                                <c:forEach items="${stulist}" var="stu">                                                                                     
                                    <tr>
                                        <td>
                                        <input type="checkbox" name="" lay-skin="primary"></td>
                                        <td>${stu.stuid }</td>
                                        <td>${stu.sname }</td>
                                        <td>${stu.sex }</td>
                                        <td>${stu.gradeclass }</td>
                                        <td>${stu.major }</td>
                                        <td>${stu.college }</td>                                      
                                        <td class="td-manage">
                                            <a title="查看" onclick="xadmin.open('编辑','order-view.html')" href="javascript:;">
                                                <i class="layui-icon">&#xe63c;</i></a>
                                            <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                                                <i class="layui-icon">&#xe640;</i></a>
                                        </td>
                                    </tr>  
                                 </c:forEach>                                     
                                </tbody>
                            </table>
                        </div>
                        
                        
                        <!-- 分页信息 -->
                           <p>
    每页${page.pageSize}条 当前页${page.size}条 ${page.pageNum}/${page.pages}页 总条数${page.total}
   </p>
    <c:if test="${page.isFirstPage==true}"><a>首页</a></c:if>
    <c:if test="${page.isFirstPage==false}">
        <a href="<%=basePath%>user/getAllUser.do?page=${page.firstPage}">首页</a>
    </c:if>
 
    <c:if test="${page.hasPreviousPage==true}">
        <a href="<%=basePath%>user/getAllUser.do?page=${page.prePage}">上一页</a>
    </c:if>
    <c:if test="${page.hasPreviousPage==false}"><a>上一页</a></c:if>
 
    <c:if test="${page.hasNextPage==true}">
        <a href="<%=basePath%>user/getAllUser.do?page=${page.nextPage}">下一页</a>
    </c:if>
    <c:if test="${page.hasNextPage==false}"><a>下一页</a></c:if>
 
    <c:if test="${page.isLastPage==true}"><a>末页</a></c:if>
    <c:if test="${page.isLastPage==false}">
        <a href="<%=basePath%>user/getAllUser.do?page=${page.lastPage}">末页</a>
    </c:if>
                        <!-- 分页条结束 -->

                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>layui.use(['laydate', 'form'],
        function() {
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#end' //指定元素
            });
        });

        /*用户-停用*/
        function member_stop(obj, id) {
            layer.confirm('确认要停用吗？',
            function(index) {

                if ($(obj).attr('title') == '启用') {

                    //发异步把用户状态进行更改
                    $(obj).attr('title', '停用');
                    $(obj).find('i').html('&#xe62f;');

                    $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                    layer.msg('已停用!', {
                        icon: 5,
                        time: 1000
                    });

                } else {
                    $(obj).attr('title', '启用');
                    $(obj).find('i').html('&#xe601;');

                    $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                    layer.msg('已启用!', {
                        icon: 5,
                        time: 1000
                    });
                }

            });
        }

        /*用户-删除*/
        function member_del(obj, id) {
            layer.confirm('确认要删除吗？',
            function(index) {
                //发异步删除数据
                $(obj).parents("tr").remove();
                layer.msg('已删除!', {
                    icon: 1,
                    time: 1000
                });
            });
        }

        function delAll(argument) {

            var data = tableCheck.getData();

            layer.confirm('确认要删除吗？' + data,
            function(index) {
                //捉到所有被选中的，发异步进行删除
                layer.msg('删除成功', {
                    icon: 1
                });
                $(".layui-form-checked").not('.header').parents('tr').remove();
            });
        }</script>

</html>