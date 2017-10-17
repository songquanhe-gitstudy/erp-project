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

	<!-- 部门添加模态框 -->
	<div class="modal fade" id="deptAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">部门添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">部门名称</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="deptName"  placeholder="请填写部门名称">
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="modal_btn_add">增加</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 部门编辑模态框 -->
	<div class="modal fade" id="deptEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">部门编辑</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" id="form_edit">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">部门名称</label>
			    <div class="col-sm-10">
			     <input type="hidden" class="form-control" name="deptId"  id="dept_deptId_id">
			      <input type="text" class="form-control" name="deptName"  id="dept_name_id">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">创建时间</label>
			    <div class="col-sm-4">
			      <input type="date" class="form-control" name="createDate"  id="dept_createDate_id">
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="modal_btn_edit">修改</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 职位添加模态框 -->
	<div class="modal fade" id="postAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">职位添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">职位名称</label>
			    <div class="col-sm-10">
			      <input type="hidden" class="form-control" name="parentId" id="post_parent_id">
			      <input type="text" class="form-control" name="postName"  placeholder="请填写部门名称">
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="modal_btn_post_add">增加</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 职位编辑模态框 -->
	<div class="modal fade" id="postEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">职位编辑</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" id="post_form_edit">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">职位名称</label>
			    <div class="col-sm-10">
			     <input type="hidden" class="form-control" name="postId"  id="post_deptId_id">
			      <input type="text" class="form-control" name="postName"  id="post_name_id">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">创建时间</label>
			    <div class="col-sm-4">
			      <input type="date" class="form-control" name="createDate"  id="post_createDate_id">
			    </div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="post_modal_btn_edit">修改</button>
	      </div>
	    </div>
	  </div>
	</div>

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
					    	<h1 class="col-md-5">部门管理</h1>
						</div>
				    </div>
				</div>
				<div class="col-sm-offset-2" style="padding-top: 50px">
					    <div class="col-md-3" style="background: #F3C9C6">
					    	<h4>部门</h4>
					    	<div id="div_dept">
					    	</div>
					    	<button id="dept_add_btn" class="btn btn_success">
					    	<span class="glyphicon glyphicon-plus">
					    	</span>
					    	</button>
					    </div>
					    <div class="col-md-4" style="background: #A1F8B2">
					    	<h4>职位</h4>
					    	<div id="div_post">
					    	</div>
					    	<div id="div_post_add">
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
						.addClass("btn btn-info btn_lg")
						.attr("onclick", "btn_dept_click(this)");
						buttonBtn.appendTo("#div_dept");
						var buttonEdit = $("<button></button>")
						.attr("value", item.deptId)
						.addClass("btn btn_success  dept_deit_btn btn_xs")
						.append($("<span></span>")
						.addClass("glyphicon glyphicon-pencil pull-right"));
						buttonEdit.appendTo("#div_dept");
						var buttonDel = $("<button></button>")
						.addClass("btn btn_success dept_del_btn btn_xs")
						.attr("name", item.deptName)
						.attr("value", item.deptId)
						.append($("<span></span>")
						.addClass("glyphicon glyphicon-trash"));
						buttonDel.appendTo("#div_dept");
					});
				}
			});
		}
		
		//部门点击事件
		function btn_dept_click(ele) {
			var value = ele.value;
			$("#div_post").empty();
			$("#div_emp").empty();
			//通过部门id去拿职位
			 $.ajax({
				 url : "${APP_PATH}/deptPost/getPosts/"+value,
				 type : "GET",
				 success : function(data) {
					 var list = data.map.jobPostList;
						$.each(list, function(index, item) {
							var postBtn = $("<button></button>")
							.append(item.postName)
							.addClass("btn btn-info post_btn_class")
							.attr("value", item.postId)
							.attr("onclick", "btn_post_click(this)");
							postBtn.appendTo("#div_post");
							var buttonEdit = $("<button></button>")
							.attr("value", item.postId)
							.addClass("btn btn_success post_deit_btn")
							.append($("<span></span>")
							.addClass("glyphicon glyphicon-pencil pull-right"));
							buttonEdit.appendTo("#div_post");
							var buttonDel = $("<button></button>")
							.addClass("btn btn_success post_del_btn")
							.attr("name", item.postName)
							.attr("value", item.postId)
							.append($("<span></span>")
							.addClass("glyphicon glyphicon-trash"));
							buttonDel.appendTo("#div_post");
						});
						$("#div_post_add").empty();
						var addBtn = $("<button></button>")
								.addClass("btn btn_success post_add_btn")
								.append($("<span></span>")
								.addClass("glyphicon glyphicon-plus"));
						addBtn.appendTo("#div_post_add");
				 }
			 });
			 var spanH = $("<span><span>")
				.attr("parentId", value)
				.addClass("post_btn_class");
				spanH.appendTo("#div_post");
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
		
		//点击部门添加按钮
		$("#dept_add_btn").click(function() {
			//弹出添加部门模态框
			$("#deptAddModal").modal({
				backdrop:"static"
			});
		});
		
		//点击模态框中的添加按钮
		$("#modal_btn_add").click(function() {
			//提交表单给后台
			$.ajax({
				url : "${APP_PATH}/deptPost/deptAdd",
				type : "POST",
				data : $("#deptAddModal form").serialize(),
				success : function(data) {
					if(data) {
						alert("添加成功！");
						//关闭模态框
						$("#deptAddModal").modal('hide');
						history.go(0);
					}
				}
			});
		});
		
		//点击编辑
		$(document).on("click", ".dept_deit_btn", function() {
			//填充表中的信息
			$.ajax({
				url : "${APP_PATH}/deptPost/getDeptBydID/"+$(this).attr("value"),
				type : "GET",
				success : function(data) {
					if(data) {
						var entity = data.map.list;
						$("#dept_name_id").val(entity.deptName);
						$("#dept_createDate_id").val(entity.createDate)
					}
				}
			});
			//给更新按钮加上部门id
			$("#modal_btn_edit").attr("value", $(this).attr("value"));
			//弹出编辑信息模态框
			$("#deptEditModal").modal({
				backdrop:"static"
			});
		});
		
		//更新部门信息
		$("#modal_btn_edit").click(function() {
			//设置表单中隐藏的id值
			$("#dept_deptId_id").val($(this).attr("value"));
			$.ajax({
				url : "${APP_PATH}/deptPost/updateDept",
				type : "POST",
				data : $("#deptEditModal form").serialize(),
				success : function(data) {
					if(data) {
						alert("更新成功！");
						//关闭模态框
						$("#deptEditModal").modal('hide');
						history.go(0);
					}
				}
			});
		});
		
		//点击部门删除按钮
		$(document).on("click", ".dept_del_btn", function() {
			if(confirm("确认删除【"+$(this).attr("name")+"】吗？")) {
				$.ajax({
					url : "${APP_PATH}/deptPost/deptDel/"+$(this).attr("value"),
					success : function(e) {
						var count = e.map.list;
						console.log(count);
						if(count == 1) {
							alert("删除成功！");	
							history.go(0);
						}else {
							alert("该部门还有职位不能被删除！");
						}
						
					}
				});
			}
		});
		
		//===================================职位==============================================
		//点击职位增加按钮
		$(document).on("click", ".post_add_btn", function() {
			//给职位添加按钮加上parentid
			$("#modal_btn_post_add").attr("parentId", $(".post_btn_class").attr("parentId"))
			//弹出添加职位模态框
			$("#postAddModal").modal({
				backdrop:"static"
			});
		});
		
		//点击职位添加按钮
		$("#modal_btn_post_add").click(function() {
			//给隐藏标签加上parentid
			$("#post_parent_id").val($(this).attr("parentId"))
			$.ajax({
				url : "${APP_PATH}/deptPost/PostAdd",
				type : "POST",
				data : $("#postAddModal form").serialize(),
				success : function(data) {
					if(data) {
						alert("添加成功！");
						//关闭模态框
						$("#postAddModal").modal('hide');
						history.go(0);
					}
				}
			});
		});
		
		//点击编辑
		$(document).on("click", ".post_deit_btn", function() {
			//填充表中的信息
			$.ajax({
				url : "${APP_PATH}/deptPost/getPostById",
				type : "GET",
				data : "id="+$(this).attr("value"),
				success : function(data) {
					if(data) {
						var entity = data.map.list;
						$("#post_name_id").val(entity.postName);
						$("#post_createDate_id").val(entity.createDate)
					}
				}
			});
			//给更新按钮加上职位id
			$("#post_modal_btn_edit").attr("value", $(this).attr("value"));
			//弹出编辑信息模态框
			$("#postEditModal").modal({
				backdrop:"static"
			});
		});
		
		//更新职位信息
		$("#post_modal_btn_edit").click(function() {
			//设置表单中隐藏的id值
			$("#post_deptId_id").val($(this).attr("value"));
			$.ajax({
				url : "${APP_PATH}/deptPost/updatePost",
				type : "POST",
				data : $("#postEditModal form").serialize(),
				success : function(data) {
					if(data) {
						alert("更新成功！");
						//关闭模态框
						$("#postEditModal").modal('hide');
						history.go(0);
					}
				}
			});
		});
		
		//点击职位删除按钮
		$(document).on("click", ".post_del_btn", function() {
			if(confirm("确认删除【"+$(this).attr("name")+"】吗？")) {
				$.ajax({
					url : "${APP_PATH}/deptPost/PostDel/"+$(this).attr("value"),
					success : function(e) {
						var count = e.map.list;
						console.log(count);
						if(count == 1) {
							alert("删除成功！");	
							history.go(0);
						}else {
							alert("该职位还有员工不能被删除！");
						}
						
					}
				});
			}
		});
		
	</script>
</html>
