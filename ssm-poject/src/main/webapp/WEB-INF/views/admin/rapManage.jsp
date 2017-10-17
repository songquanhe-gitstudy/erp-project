<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>奖惩显示</title>
<% 
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<script src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"</link>
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

	<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>

</head>
<body>
	<!-- 添加奖惩模态框 -->
	<div class="modal fade" id="add_rap_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">奖惩添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" id="add_rap_form">
	          <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">奖惩人</label>
			   <div class="col-sm-3">
			   	   <label  >部门</label>
				   <select class="form-control" id="select_advice_dept" name="jobDept">
				   	<option value=0></option>
					</select>
				</div>
				<div class="col-sm-4">
					<label>职位</label>
					<select class="form-control" id="select_advice_post" name="jobPositon">
					</select>
				</div>
				<div class="col-sm-3">
					<label>员工</label>
					<select class="form-control" id="select_advice_emp" name="userId">
					</select>
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">奖惩类型</label>
			   	 <div class="col-sm-3">
				   <select class="form-control" id="select_type" name="type">
				   		<option value="奖励">奖励</option>
				   		<option value="惩罚">惩罚</option>
				   </select>
				 </div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">奖惩金额</label>
			   <div class="col-sm-3">
				   <input type="text" class="form-control" name="money"  id="money_id">
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">奖惩原因</label>
			   <div class="col-sm-10">
				   <textarea type="text" class="form-control" name="reason"  id="reason_id"></textarea>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default " data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="modal_add_sure">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 修改奖惩模态框 -->
	<div class="modal fade" id="update_rap_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">奖惩修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" id="update_rap_form">
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">奖惩类型</label>
			   	 <div class="col-sm-4">
				   <select class="form-control" id="select_type_update" name="type">
				   		<option value="奖励">奖励</option>
				   		<option value="惩罚">惩罚</option>
				   </select>
				 </div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">奖惩金额</label>
			   <div class="col-sm-6">
				   <input type="text" class="form-control" name="money"  id="money_update_id">
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">奖惩原因</label>
			   <div class="col-sm-6">
				   <textarea type="text" class="form-control" name="reason"  id="reason_update_id"></textarea>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default " data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="update_modal_btn_sure">确定</button>
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
					    	<h1 class="col-md-5">奖惩管理</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0; id="form_attendance_sheet" method="post">
								<div class="form-group">
									   <label for="inputEmail3" class="col-sm-2 control-label">搜索</label>
									   <div class="col-sm-4">
									   	   <label  >年份</label>
										   <select class="form-control" id="select_year" name="years">
										   	<option value=0></option>
											</select>
										</div>
										<div class="col-sm-4">
											<label>月份</label>
											<select class="form-control" id="select_month" name="months">
											<option value=0></option>
											</select>
										</div>
								</div>
							</form>

						</div>
						<button type="button" class="btn btn-success" id="btn_add_rap">增加</button>
				    </div>
				    <table class="table table-bordered" id="table_id">
					        <thead>
					            <tr>
					            	<th>序号</th>
					            	<th>年份</th>
					            	<th>月份</th>
									<th>姓名</th>
									<th>岗位</th>
									<th>类型</th>
									<th>金额</th>
									<th>原因</th>
									<th>创建时间</th>
									<th>修改操作</th>
									<th>删除操作</th>
					            </tr>
					        </thead>
					        <tbody>
					        </tbody>
				    </table>
				    <div class="panel-footer">
							<nav style="text-align: center" id="nav_id">
							</nav>
							
							<div id="page_id">
							
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
	//当前页面
	var currentPage;
	 $(function() {
		 /* var pageInfo = ${pageInfo}
		 console.log(pageInfo);
			 //传值给menu页面显示消息数量
			  $.ajax({
		            type: 'POST',
		            url: "/visitor/menu",
		            type: "POST",
		            async: false,
		            data : {
		            	inviterNum : "3"
		            },
		            success: function() {
		                $.unblockUI(); 
		            }
		        }); */
	     //给查询按钮添加年份月份
		 fill_check_year();
		 to_page(1);
		 
	 });
	 
	//给查询按钮添加年份月份
	 function fill_check_year() {
		var baseYear = 2015;
		var date=new Date;
		 var year=date.getFullYear(); 
		 var month=date.getMonth()+1;
		for(baseYear; baseYear < 2050; baseYear++) {
			if(year == baseYear) {
				var yearOption = $("<option></option>").attr("value", baseYear).attr("selected", "selected")
				.append(baseYear).appendTo($("#select_year"));
			}else {
				var yearOption = $("<option></option>").attr("value", baseYear)
				.append(baseYear).appendTo($("#select_year"));
		  }
		}
		var baseMonth = 1;
		for(baseMonth; baseMonth <= 12; baseMonth++) {
			if(month == baseMonth) {
				var yearOption = $("<option></option>").attr("value", baseMonth).attr("selected", "selected")
				.append(baseMonth).appendTo($("#select_month"));
			}else {
				var yearOption = $("<option></option>").attr("value", baseMonth)
				.append(baseMonth).appendTo($("#select_month"));
		  }
		}
	}
	 
	 	//分页跳到第几页
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/rap/getRapRecords",
				data : "pn="+pn,
				type : "GET",
				success : function(e) {
					console.log(e);
					var e = e.map.pageInfo;
					if(e) {
						console.log(e);
						//填充表格
						table_data(e);
						//填充分页信息
						pager_data(e);
						//填充分页导航信息
						nav_data(e);
					}
				}
			});
		}
	
		/* 填充表格数据 */
		function table_data(e) {
			//每次进入清空表格信息
			$("#table_id tbody").empty();
			var data = e.list;
			$.each(data, function(index, item) {
				var rapIdTd = $("<td></td>").append(item.rapId);
				var yearsTd = $("<td></td>").append(item.years);
				var monthsTd = $("<td></td>").append(item.months);
				var nameTd = $("<td></td>").append(item.user.userName);
				var jobPositionTd = $("<td></td>").append(find_deptAndPost(item.user.parentId));
				var typeTd = $("<td></td>").append(item.type);
				var moneyTd = $("<td></td>").append(item.money);
				var reasonTd = $("<td></td>").append(item.reason);
				var createTimeTd = $("<td></td>").append(item.createTime);
				//更新按钮
				 var updateBtn = $("<button></button>").addClass("btn btn-info btn-sm btn_update")
					.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
				 updateBtn.attr("rap_id", item.rapId);
					var updateTd = $("<td></td>").append(updateBtn);
				 //删除按钮
				 var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm btn_del")
						.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
						deleteBtn.attr("rap_id", item.rapId).attr("rap_name",item.user.userName);
						var deleteTd = $("<td></td>").append(deleteBtn);
				
				/* 加到表格下的<tbody>里面  */
				$("<tr></tr>").append(rapIdTd).append(yearsTd).append(monthsTd).append(nameTd).append(jobPositionTd)
				.append(typeTd).append(moneyTd)
				.append(reasonTd).append(createTimeTd).append(updateTd).append(deleteTd)
				.appendTo("#table_id tbody")
			});
			
		}
		
		//根据职位id找到对应部门以及职位
		function find_deptAndPost(id) {
			var deptName='';
			var postName='';
			if(id != 0) {
				$.ajax({
					url : "${APP_PATH}/deptPost/getDmptByPId",
					type : "GET",
					data : "id="+id,
					async:false,
					success : function(data) {
						deptName = data.map.list.deptName;
					}
				});
				
				$.ajax({
					url : "${APP_PATH}/deptPost/getPostById",
					type : "GET",
					data : "id="+id,
					async:false,
					success : function(data) {
						postName = data.map.list.postName;
					}
				});
			}
			
			var data = deptName + " - " + postName;
			console.log(data);
			return data;
		}
		/* 填充分页信息 */
		function pager_data(e) {
			//清空分页信息
			$("#page_id").empty();
			$("#page_id").append($("<strong></strong>")
			  .append("当前是第"+e.pageNum+"页,共"+e.pages
					  +"页,共"+e.total+"条记录"));
			currentPage = e.pageNum;
		}
		
		/* 填充分页导航内容  */
		function nav_data(e) {
			//nav_id
			$("#nav_id").empty();
			var ul = $("<ul></ul>").addClass("pagination"); 
			
			var headLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
			var previousLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			
			if(e.pageNum != 1) {
				ul.append(headLi);
				ul.append(previousLi);
				headLi.click(function() {
					to_page(1);
				});
				previousLi.click(function() {
					to_page(e.pageNum - 1);
				});
			}
			
			var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var footLi = $("<li></li>").append($("<a></a>").append("尾页"));
			
			$.each(e.navigatepageNums, function(index, item) {
				var pageLi = $("<li></li>").append($("<a></a>").append(item));
				ul.append(pageLi);
				if(e.pageNum == item) {
					pageLi.addClass("active");
				}
				pageLi.click(function() {
					to_page(item);
				});
				
			});
			if(e.pageNum != e.pages) {
				ul.append(nextLi);
				ul.append(footLi);
				nextLi.click(function() {
					to_page(e.pageNum + 1);
				});
				footLi.click(function() {
					to_page(e.pages);
				});
			}
			ul.appendTo("#nav_id")
		}
		
		//=====================================日期选择=======================================================
		$("#select_month").change(function() {
			var years = $("#select_year").val();
			var months = $("#select_month").val();
			if(years != 0) {
				//选择对应年月份的记录
				to_check_page(1);
			}else {
				alert("请先填写年份！");
			}
		});
		
		
		//分页跳到第几页
		function to_check_page(pn) {
			var years = $("#select_year").val();
			var months = $("#select_month").val();
			$.ajax({
				url : "${APP_PATH}/rap/getDateRecordsNoUser/"+pn,
				data : {
					years : years,
					months : months
				},
				success : function(e) {
					var e = e.map.pageInfo;
					if(e) {
						console.log(e);
						//填充表格
						table_check_data(e);
						//填充分页信息
						pager_check_data(e);
						//填充分页导航信息
						nav_check_data(e);
					}
				}
			});
		}
	
		/* 填充表格数据 */
		function table_check_data(e) {
			//每次进入清空表格信息
			$("#table_id tbody").empty();
			var data = e.list;
			$.each(data, function(index, item) {
				var rapIdTd = $("<td></td>").append(item.rapId);
				var yearsTd = $("<td></td>").append(item.years);
				var monthsTd = $("<td></td>").append(item.months);
				var nameTd = $("<td></td>").append(item.user.userName);
				var jobPositionTd = $("<td></td>").append(find_deptAndPost(item.user.parentId));
				var typeTd = $("<td></td>").append(item.type);
				var moneyTd = $("<td></td>").append(item.money);
				var reasonTd = $("<td></td>").append(item.reason);
				var createTimeTd = $("<td></td>").append(item.createTime);
				//更新按钮
				 var updateBtn = $("<button></button>").addClass("btn btn-info btn-sm btn_update")
					.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
				 updateBtn.attr("rap_id", item.rapId);
					var updateTd = $("<td></td>").append(updateBtn);
				 //删除按钮
				 var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm btn_del")
						.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
						deleteBtn.attr("rap_id", item.rapId).attr("rap_name",item.user.userName);
						var deleteTd = $("<td></td>").append(deleteBtn);
				
				/* 加到表格下的<tbody>里面  */
				$("<tr></tr>").append(rapIdTd).append(yearsTd).append(monthsTd).append(nameTd).append(jobPositionTd)
				.append(typeTd).append(moneyTd)
				.append(reasonTd).append(createTimeTd).append(updateTd).append(deleteTd)
				.appendTo("#table_id tbody")
			});
			
		}
		
		/* 填充分页信息 */
		function pager_check_data(e) {
			//清空分页信息
			$("#page_id").empty();
			$("#page_id").append($("<strong></strong>")
			  .append("当前是第"+e.pageNum+"页,共"+e.pages
					  +"页,共"+e.total+"条记录"));
			currentPage = e.pageNum;
		}
		
		/* 填充分页导航内容  */
		function nav_check_data(e) {
			//nav_id
			$("#nav_id").empty();
			var ul = $("<ul></ul>").addClass("pagination"); 
			
			var headLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
			var previousLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			
			if(e.pageNum != 1) {
				ul.append(headLi);
				ul.append(previousLi);
				headLi.click(function() {
					to_check_page(1);
				});
				previousLi.click(function() {
					to_check_page(e.pageNum - 1);
				});
			}
			
			var nextLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
			var footLi = $("<li></li>").append($("<a></a>").append("尾页"));
			
			$.each(e.navigatepageNums, function(index, item) {
				var pageLi = $("<li></li>").append($("<a></a>").append(item));
				ul.append(pageLi);
				if(e.pageNum == item) {
					pageLi.addClass("active");
				}
				pageLi.click(function() {
					to_check_page(item);
				});
				
			});
			if(e.pageNum != e.pages) {
				ul.append(nextLi);
				ul.append(footLi);
				nextLi.click(function() {
					to_check_page(e.pageNum + 1);
				});
				footLi.click(function() {
					to_check_page(e.pages);
				});
			}
			ul.appendTo("#nav_id")
		}
		
	//=======================================增加奖惩========================================================	
	$("#btn_add_rap").click(function() {
		//先拿到dept中的数据
		geDept_advice_data();
		//弹出增加模态框
		$("#add_rap_modal").modal({
			backdrop : "static"
		});
	});
	
	//点击确定按钮
	$("#modal_add_sure").click(function() {
		//判断是否选人
		console.log("--");
		if($("#select_advice_emp").val() == null) {
			alert("请选择奖惩人！");
			return false;
		}
		if($("#money_id").val() == '') {
			alert("请填写奖惩金额！");
			return false;
		}
		//提交记录
		$.ajax({
			url : "${APP_PATH}/rap/addRapRecords",
			type : "POST",
			data : $("#add_rap_form").serialize(),
			success : function(data) {
				if(data) {
					alert("添加成功！");
					//关闭模态框
					$("#add_rap_modal").modal('hide');
					//跳到当前页面
					to_page(currentPage);
				}
			}
		});
		
	});
	
	
	//先拿到dept中的数据
	function geDept_advice_data() {
		$("#select_advice_dept").empty();
		$.ajax({
			url : "${APP_PATH}/deptPost/getDepts",
			type : "GET",
			success : function(data) {
				//遍历数据添加option
				var list = data.map.deptList;
				$.each(list, function(index, item) {
					var optionOp = $("<option></option>").append(item.deptName).attr("value", item.deptId);
					optionOp.appendTo("#select_advice_dept");
				});
			}
		});
	}
	
	//部门select的onchange事件
	$("#select_advice_dept").change(function(){
		$("#select_advice_post").empty();
		$("#select_advice_emp").empty();
		var value = $("#select_advice_dept").val();
		if(value != 0) {
		//通过部门id去拿职位
		 $.ajax({
			 url : "${APP_PATH}/deptPost/getPosts/"+value,
			 type : "GET",
			 success : function(data) {
				 var list = data.map.jobPostList;
					$.each(list, function(index, item) {
						var optionOp = $("<option></option>").append(item.postName).attr("value", item.postId);
						optionOp.appendTo("#select_advice_post");
					});
			 }
		 });
		}
		});
	
	//职位select的onchange事件
	$("#select_advice_post").change(function(){
		$("#select_advice_emp").empty();
		var value = $("#select_advice_post").val();
		if(value != 0) {
			//通过职位找员工
			 $.ajax({
				 url : "${APP_PATH}/deptPost/getEmps/"+value,
				 type : "GET",
				 success : function(data) {
					 var list = data.map.empList;
						$.each(list, function(index, item) {
							var optionOp = $("<option></option>").append(item.userName).attr("value", item.userId);
							optionOp.appendTo("#select_advice_emp");
						});
				 }
			 });
		}
	})

	//===========================================删除====================================================	
	//点击删除按钮
	$(document).on("click", ".btn_del", function() {
		
		if(confirm("确定删除【"+$(this).attr("rap_name")+"】的这条奖惩记录吗？")) {
			$.ajax({
				url : "${APP_PATH}/rap/delRapRecord/"+$(this).attr("rap_id"),
				success : function(data) {
					if(data) {
						alert("删除成功！");
						to_page(currentPage);
					}
				}
			});
		}
	});
	
	//============================================修改==================================================
	$(document).on("click", ".btn_update", function() {
		//填充模态框中的数据
		fill_update_data($(this).attr("rap_id"));
		//弹出模态框
		$("#update_rap_modal").modal({
			backdrop : "static"
		});
	});
		
	function fill_update_data(id) {
		//给修改确认按钮添加id
		$("#update_modal_btn_sure").attr("rap_id", id);
		//找到这条记录
		$.ajax({
			url : "${APP_PATH}/rap/findRecordById",
			data : "id=" + id,
			success : function(data) {
				if(data) {
					var entity = data.map.entity;
					$("#select_type_update").val([entity.type]);
					$("#money_update_id").val(entity.money);
					$("#reason_update_id").val(entity.reason);
				}
			}
		});
	}
	
	//点击修改确认按钮
	$("#update_modal_btn_sure").click(function() {
		$.ajax({
			url : "${APP_PATH}/rap/updateRecord/"+$(this).attr("rap_id"),
			data : $("#update_rap_form").serialize(),
			success : function(data) {
				if(data) {
					//添加成功
					alert("更新成功！");
					//关闭模态框
					$("#update_rap_modal").modal('hide');
					//跳到当前页面
					to_page(currentPage);
				}
			}
		});
	});
		
		
		
		
		
		
		
		
		
		
	</script>
</html>