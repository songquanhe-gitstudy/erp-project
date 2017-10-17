<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>部门信息</title>
<% 
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<script src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"</link>
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
	<!-- 顶栏 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 中间主体 -->
	<div class="container" id="content">
		<div class="row">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="col-md-10">
				<div class="panel panel-default">
				    <div class="panel-heading">
						<div class="row">
					    	<h1 class="col-md-5">部门信息</h1>
						</div>
				    </div>
				</div>
				<div class="col-sm-offset-2" style="padding-top: 50px">
					    <div class="col-md-2" style="background: #F3C9C6">
					    	<h4>部门</h4>
					    	<div id="div_dept">
					    	</div>
					    </div>
					    <div class="col-md-3" style="background: #A1F8B2">
					    	<h4>职位</h4>
					    	<div id="div_post">
					    	</div>
					    </div>
					     <div class="col-md-3" style="background: #BDF7F4" >
					     	<h4>名字</h4>
					     	<div id="div_emp">
					    	</div>
					    </div>
					</div>
			</div>
		</div>
	</div>
	<div class="container" id="footer">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		$(function() {
			//先拿到dept中的数据
			geDept_data();
		});
		
		//先拿到dept中的数据
		function geDept_data() {
			$.ajax({
				url : "${APP_PATH}/deptPost/getDepts",
				type : "GET",
				success : function(data) {
					//遍历数据添加option
					var list = data.map.deptList;
					$.each(list, function(index, item) {
						var buttonBtn = $("<button></button>")
						.append(item.deptName)
						.attr("value", item.deptId)
						.addClass("btn btn-info")
						.attr("onclick", "btn_dept_click(this)");
						buttonBtn.appendTo("#div_dept");
					});
				}
			});
		}
		
		//部门点击事件
		function btn_dept_click(ele) {
			var value = ele.value;
			$("#div_emp").empty();
			$("#div_post").empty();
			//通过部门id去拿职位
			 $.ajax({
				 url : "${APP_PATH}/deptPost/getPosts/"+value,
				 type : "GET",
				 success : function(data) {
					 var list = data.map.jobPostList;
						$.each(list, function(index, item) {
							var postBtn = $("<button></button>")
							.append(item.postName)
							.addClass("btn btn-info")
							.attr("value", item.postId)
							.attr("onclick", "btn_post_click(this)");
							postBtn.appendTo("#div_post");
						});
				 }
			 });
		}
		
		//职位点击事件
		function btn_post_click(ele) {
			var value = ele.value;
			$("#div_emp").empty();
			//通过职位去拿员工
			 $.ajax({
				 url : "${APP_PATH}/deptPost/getEmps/"+value,
				 type : "GET",
				 success : function(data) {
					 var list = data.map.empList;
						$.each(list, function(index, item) {
							var postBtn = $("<button></button>")
							.append(item.userName)
							.addClass("btn btn-info")
							.attr("value", item.userId);
							postBtn.appendTo("#div_emp");
						});
				 }
			 });
		}
		
		
		
		
		
		
		
		
		
		
		
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</html>
