<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/css/font.css"
	type=text/css rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/xadmin.css"
	type=text/css rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"
	charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/layui/layui.js"
	charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/xadmin.js"
	charset="utf-8"></script>
</head>
<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a href="">演示</a>
			<a> <cite>导航元素</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			onclick="location.reload()" title="刷新"> <i
			class="layui-icon layui-icon-refresh" style="line-height: 30px"></i>
		</a>
	</div>
	<div class="layui-fluid">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-body ">
						<form class="layui-form layui-col-space5" action="${pageContext.request.contextPath}/getvalue" method="post">
							<div class="layui-input-inline layui-show-xs-block">
								<input type="text" name="stuid" id="stuid" placeholder="请输入学号"
									autocomplete="off" class="layui-input">
							</div>
							<div class="layui-input-inline layui-show-xs-block">
								<button class="layui-btn" lay-submit="" id="srcsubmit" lay-filter="srcsubmit" >
									<i class="layui-icon">&#xe615;</i>
								</button>
							</div>
						</form>
					</div>
					<div class="layui-card-header">
						<button class="layui-btn layui-btn-danger" onclick="delAll()">
							<i class="layui-icon"></i>批量删除
						</button>
						<button class="layui-btn"
							onclick="xadmin.open('添加成绩','${pageContext.request.contextPath}/toAddgrade',800,600)">
							<i class="layui-icon"></i>添加
						</button>
						<button class="layui-btn" lay-event="upload" id="test1">
							<i class="iconfont">&#xe71d;</i> 上传成绩
						</button>

						<a href="${pageContext.request.contextPath}/exportExcel">
							<button class="layui-btn" lay-event="download">
								<i class="iconfont">&#xe714;</i> 导出数据
							</button>
						</a>

					</div>

					<div class="layui-card-body ">
						<table class="layui-table layui-form">
							<thead>
								<tr>
									<th><input type="checkbox" name="" lay-skin="primary">
									</th>
									<th>学号</th>
									<th>姓名</th>
									<th>平时成绩</th>
									<th>期中成绩</th>
									<th>期末成绩</th>
									<th>总成绩</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="jg" >
									<tr>
										<td><input type="checkbox" name="" lay-skin="primary"></td>
										<td>${jg.stuid }</td>
										<td>${jg.sname }</td>
										<td>${jg.javagrade1 }</td>
										<td>${jg.javagrade2 }</td>
										<td>${jg.javagrade3 }</td>
										<td>${jg.javagrade }</td>
										<td class="td-manage"><a title="编辑"
											onclick="xadmin.open('编辑成绩','${pageContext.request.contextPath}/toupdategrade?stuid=${jg.stuid}',800,600)"
											href="javascript:;"> <i
												class="layui-icon layui-icon-edit"></i></a> <a title="删除"
											onclick="deleteGrade(${jg.stuid})" href="javascript:;"> <i
												class="layui-icon">&#xe640;</i></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<%--                         <div style="margin-top: 40px">
                            <a href="${pageContext.request.contextPath}/toJava?pageNo=${pageInfo.prePage }" >上一页</a>    
                             <c:forEach begin="1" end="${pageInfo.pages }" varStatus="status">
                             <a href="${pageContext.request.contextPath}/toJava?pageNo=${status.count }" 
                             <c:if test="${status.count == pageInfo.pageNum}">class="select"</c:if>>${status.count }</a>
                             </c:forEach>
                             <a href="${pageContext.request.contextPath}/toJava?pageNo=${pageInfo.nextPage }" >下一页</a>           
						</div> --%>
					<!-- 分页信息 -->
					<div class="row">
						<!-- 分页文字信息，其中分页信息都封装在pageInfo中 -->
						<div class="col-md-6">当前第：${pageInfo.pageNum }页，总共：${pageInfo.pages }页，总共：${pageInfo.total }条记录
						</div>

						<!-- 分页条 -->
						<div class="page">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<li><a
										href="${pageContext.request.contextPath}/toJava?pageNo=1">首页</a>
									</li>

									<c:if test="${pageInfo.hasNextPage }">
										<li>
										   <a href="${pageContext.request.contextPath}/toJava?pageNo=${pageInfo.pageNum-1}"class="prev"> 
										    &lt;&lt; 
										   </a> 
									    </li>
									</c:if>

									<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
										<c:if test="${page_Num == pageInfo.pageNum }">
											<li class="active"><a href="#">${page_Num }</a></li>
										</c:if>
										<c:if test="${page_Num != pageInfo.pageNum }">
											<li><a
												href="${pageContext.request.contextPath}/toJava?pageNo=${page_Num }">${page_Num }</a></li>
										</c:if>
									</c:forEach>


									<c:if test="${pageInfo.hasNextPage }">
										<li><a href="${pageContext.request.contextPath}/toJava?pageNo=${pageInfo.pageNum+1}" class="next"> 
											&gt;&gt; 
											</a>
									    </li>
									</c:if>

									<li><a
										href="${pageContext.request.contextPath}/toJava?pageNo=${pageInfo.pages}">末页</a>
									</li>
								</ul>
							</nav>
						</div>
						<!-- 分页条结束 -->
					</div>




				</div>
			</div>
		</div>
	</div>
</body>

<script>
    layui.use(['laydate', 'form'],
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

        // 删除成绩
       	function deleteGrade(stuid) {
       	    if(confirm('确实要删除该条数据吗?')) 
       	    {
       	      $.post("${pageContext.request.contextPath}/deletegrade",{"stuid":stuid},
       	      function(data){
       	            if(data =="OK"){
       	                alert("数据删除成功！");
       	                window.location.reload();
       	            }else{
       	                alert("数据删除失败！");
       	                window.location.reload();
       	            }
       	        });
       	    }
       	}
</script>

<script src="${pageContext.request.contextPath}/js/layui.all.js"
	charset="utf-8"></script>
<script>
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
  
  //指定允许上传的文件类型
  upload.render({
    elem: '#test1'
    ,url: '/upload/'
    ,accept: 'file' //普通文件
    ,done: function(res){
      console.log(res)
    }
  });

});
</script>
</html>