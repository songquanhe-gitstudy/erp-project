<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>培训信息</title>
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
	<!-- 添加培训模态框 -->
	<div class="modal fade" id="add_train_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">培训添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" id="add_train_form">
	          <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">培训名称</label>
			   <div class="col-sm-6">
			   	   <input type="text" class="form-control" name="trainName"  id="train_name_id">
				</div>
			  </div>
			  <div class="form-group">
			  <label for="inputEmail3" class="col-sm-2 control-label">培训人</label>
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
					<select class="form-control" id="select_advice_emp" name="uid">
					</select>
				</div>
			 </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">培训部门</label>
			   	 <div class="col-sm-6">
				   <select class="form-control" id="select_dept" name="deptId">
				   </select>
				 </div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">培训时间</label>
			   <div class="col-sm-6">
				   <input type="date" class="form-control" name="trainTime"  id="trainTime_id">
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">培训内容</label>
			   <div class="col-sm-6">
				   <textarea type="text" class="form-control" name="trainContent"  id="trainContent_id"></textarea>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default modal_btn_train_cancel" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="modal_btn_sure">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 修改培训模态框 -->
	<div class="modal fade" id="update_train_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">培训修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" id="update_train_form">
	          <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">培训名称</label>
			   <div class="col-sm-6">
			   	   <input type="text" class="form-control" name="trainName"  id="update_name_id">
				</div>
			  </div>
			  <div class="form-group">
			  <label for="inputEmail3" class="col-sm-2 control-label">培训人</label>
			   <div class="col-sm-3">
			   	   <label  >部门</label>
				   <select class="form-control" id="select_advice_dept2" name="jobDept">
				   	<option value=0></option>
					</select>
				</div>
				<div class="col-sm-4">
					<label>职位</label>
					<select class="form-control" id="select_advice_post2" name="jobPositon">
					</select>
				</div>
				<div class="col-sm-3">
					<label>员工</label>
					<select class="form-control" id="select_advice_emp2" name="uid">
					</select>
				</div>
			 </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">培训部门</label>
			   	 <div class="col-sm-6">
				   <select class="form-control" id="select_dept2" name="deptId">
				   </select>
				 </div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">培训时间</label>
			   <div class="col-sm-6">
				   <input type="date" class="form-control" name="trainTime"  id="update_trainTime_id">
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">培训内容</label>
			   <div class="col-sm-6">
				   <textarea type="text" class="form-control" name="trainContent"  id="update_trainContent_id"></textarea>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default modal_btn_train_cancel" data-dismiss="modal">关闭</button>
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
					    	<h1 class="col-md-5">培训信息</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" id="train_form" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入培训名称查找" name="findByName">
									<span class="input-group-addon btn" onclick="search_train()" id="sub">搜索</span>
								</div>
							</form>
							<div style="right: 0px">
								<button type="button" class="btn btn-primary add_train_btn">
								 <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加
								</button>
							</div>
						</div>
				    </div>
				    <table class="table table-bordered" id="table_id">
					        <thead>
					            <tr>
				            	  <th>序号</th>
								  <th>培训名称</th>
								  <th>培训部门</th>
								  <th>培训人</th>
								  <th>培训时间</th>
								  <th>培训内容</th>
								  <th>培训状态</th>
								  <th>更改信息</th>
								  <th>删除培训</th>
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
	//最后一页
	var totalPage;
	//当前页
	var currentPage;
	 $(function() {
		 //取培训表中的数据
		 to_page(1);
	 });
	 
	 function to_page(pn) {
		 $.ajax({
			 url : "${APP_PATH}/train/showTrainData/"+pn,
			 tape : "GET",
			 data : $("#train_form").serialize(),
			 success :function(data) {
				 $("#table_id tbody").empty();
				 if(data) {
					 console.log("====")
					 var list = data.map.pageInfo.list;
					 console.log(list)
					 $.each(list, function(index, item) {
						 var trainIdTd = $("<td></td>").append(item.trainId);
						 var trainNameTd = $("<td></td>").append(item.trainName);
						 var trainDeptTd = $("<td></td>").append(get_dept_name(item.deptId));
						 var nameEmpTd = $("<td></td>").append(get_emp_name(item.uid));
						 var trainContentTd = $("<td></td>").append(item.trainContent);
						 var trainTimeTd = $("<td></td>").append(item.trainTime);
						 var trainContentTd = $("<td></td>").append(item.trainContent);
						 if(get_train_state(item.trainTime) == "培训未开始") {
							 	var trainstateTd = $("<td></td>")
							 	.append(get_train_state(item.trainTime))
							 	.css('background-color', '#F4CCB2') ;
							 }else if(get_train_state(item.trainTime) == '培训进行中') {
								 var trainstateTd = $("<td></td>")
								 	.append(get_train_state(item.trainTime))
								 	.css('background-color', '#FB304F') ;
							 }else if (get_train_state(item.trainTime) == '培训已结束') {
								 var trainstateTd = $("<td></td>")
								 	.append(get_train_state(item.trainTime))
								 	.css('background-color', '#CAC5C5') ;
							 }
						 
						//更新按钮
						 var updateBtn = $("<button></button>").addClass("btn btn-info btn-sm btn_update")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
						 updateBtn.attr("train_id", item.trainId);
							var updateTd = $("<td></td>").append(updateBtn);
						 //删除按钮
						 var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm btn_del")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
								deleteBtn.attr("train_id", item.trainId).attr("train_name",item.trainName);
								var deleteTd = $("<td></td>").append(deleteBtn);
						 //放入tbody中
						 var tTr = $("<tr></tr>").append(trainIdTd).append(trainNameTd)
						 						.append(trainDeptTd).append(nameEmpTd)
						 						.append(trainContentTd).append(trainTimeTd)
						 						.append(trainContentTd).append(trainstateTd).append(updateTd)
						 						.append(deleteTd)
						 						.appendTo("#table_id tbody");
					 });
				 }
				//填充分页信息
				pager_data(data.map.pageInfo);
				//填充分页导航信息
				nav_data(data.map.pageInfo);
			 }
		 });
	 }
	 
	//获取培训人名称
	 function get_emp_name(uid) {
		 var name = '';
		 if(uid != 0) {
			 $.ajax({
				 url : "${APP_PATH}/user/getEmpNameById/"+uid,
				 async : false,
				 success : function(data) {
					 if(data) {
						 var entity = data.map.entity;
						 name = entity.userName;
					 }
				 }
			 });
		 }
		 return name;
	 }
	 
	//获取培训状态
	 function get_train_state(time) {
		 var date = new Date();
		 var month = date.getMonth()+1;
		 var myDate=date.getFullYear()+"-"+month+"-"+date.getDate()+"";
		 //myDate = new Date(Date.parse(myDate.replace(/-/g, "/")));
		 
		 var toDateTime = Date.parse(new Date(myDate));
		 var trainTime = Date.parse(new Date(time));
		 if(toDateTime < trainTime) {
			 return "培训未开始";
		 }else if(toDateTime == trainTime) {
			 return "培训进行中";
		 }else if(toDateTime > trainTime){
			 return "培训已结束";
		 }
	 }
	 //获取部门名称
	 function get_dept_name(id) {
		 var deptName='';
		if(id != 0 && id != null) {
			$.ajax({
				url : "${APP_PATH}/deptPost/getDeptBydID/"+id,
				type : "GET",
				async:false,
				success : function(data) {
					console.log("===============")
					console.log(data)
					deptName = data.map.list.deptName;
				}
			});
		}
		return deptName;
	 }
	 
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
	 
	 /* 填充分页信息 */
		function pager_data(e) {
			//清空分页信息
			$("#page_id").empty();
			$("#page_id").append($("<strong></strong>")
			  .append("当前是第"+e.pageNum+"页,共"+e.pages
					  +"页,共"+e.total+"条记录"));
			totalPage = e.total+1;
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
	 
	 //=========================================添加===================================================
	 $(".add_train_btn").click(function() {
		 //拿到部门
		 geDept_data();
		 //指定培训人
		 geDept_advice_data();
		 //弹出模态框
		 $("#add_train_modal").modal({
			 backdrop : "static"
		 });
	 });
	 
	//先拿到dept中的数据
	function geDept_data() {
		$("#select_dept").empty();
		$.ajax({
			url : "${APP_PATH}/deptPost/getDepts",
			type : "GET",
			success : function(data) {
				console.log("---------")
				console.log(data)
				//遍历数据添加option
				var list = data.map.deptList;
				$.each(list, function(index, item) {
						var optionOp = $("<option></option>").append(item.deptName).attr("value", item.deptId);
						optionOp.appendTo("#select_dept");
				});
			}
		});
	}
	//点击确认按钮
	$("#modal_btn_sure").click(function() {
		//获取添加表单上的时间
		var addTime = $("#trainTime_id").val();
		var toDayTime = Date.parse(new Date());
		var trainTime = Date.parse(new Date(addTime));
		if($("#train_name_id").val() == "") {
			alert("培训名称不能为空！");
			return false;
		}
		//指定人
		var emp = $("#select_advice_emp").val();
		if(emp == null) {
			alert("指定人不能为空！");
			return false;
		}
		if(addTime == '') {
			alert("请填写时间！");
			return false;
		}
		if(trainTime <= toDayTime) {
			alert("培训时间不能小于今天！");
			return false;
		}
		if($("#trainContent_id").val() == "") {
			alert("培训内容不能为空！");
			return false;
		}
		//提交表单
		$.ajax({
			url : "${APP_PATH}/train/addTrain",
			type : "POST",
			data : $("#add_train_form").serialize(),
			success : function(data) {
				if(data) {
					alert("添加成功！")
					to_page(1);
					$("#add_train_modal").modal('hide');
					//清除表单中缓存的数据
					$("#train_name_id").val('');
					$("#trainTime_id").val('');
					$("#trainContent_id").val('');
				}
			}
		});
	});
	
	//========================================删除=====================================================
	$(document).on("click", ".btn_del", function() {
		var trainName = $(this).attr("train_name")
		if(confirm("确认删除主题【"+ trainName +"】这个培训吗")) {
			$.ajax({
				url : "${APP_PATH}/train/delTrain/"+$(this).attr("train_id"),
				success : function() {
					//跳回当前页面
					to_page(currentPage);
				}
			});
		}
	});
	
	//==========================================修改=====================================================
	$(document).on("click", ".btn_update", function() {
		//拿到部门
		 geDept_data2();
		//指定培训人
		 geDept_advice_data2();
		//拿到当前培训的信息
		get_currnet_train($(this).attr("train_id"));
		//给模态框确认按钮赋值
		$("#update_modal_btn_sure").attr("tarin_id", $(this).attr("train_id"));
		//弹出模态框
		$("#update_train_modal").modal({
			backdrop : "static"
		});
	});
	//拿到当前培训的信息
	function get_currnet_train(id) {
		$.ajax({
			url : "${APP_PATH}/train/findById/"+id,
			type : "GET",
			success : function(data) {
				if(data) {
					var entity = data.map.list;
					//把信息填充到表单
					$("#update_name_id").val(entity.trainName);
					$("#update_trainTime_id").val(entity.trainTime);
					$("#select_dept2").val([entity.deptId]);
					$("#update_trainContent_id").val(entity.trainContent);
				}
			}
		});
	}
	
	//先拿到dept中的数据
	function geDept_data2() {
		$("#select_dept2").empty();
		$.ajax({
			url : "${APP_PATH}/deptPost/getDepts",
			type : "GET",
			success : function(data) {
				console.log("---------")
				console.log(data)
				//遍历数据添加option
				var list = data.map.deptList;
				$.each(list, function(index, item) {
						var optionOp = $("<option></option>").append(item.deptName).attr("value", item.deptId);
						optionOp.appendTo("#select_dept2");
				});
			}
		});
	}
	
	//点击更新确认按钮
	$("#update_modal_btn_sure").click(function() {
		console.log($(this).attr("tarin_id"))
		$.ajax({
			url : "${APP_PATH}/train/updateTrain/"+$(this).attr("tarin_id"),
			type : "POST",
			data : $("#update_train_form").serialize(),
			success : function(data) {
				if(data) {
					alert("更新成功！");
					//关闭模态框
					$("#update_train_modal").modal('hide');
					to_page(currentPage);
				}
			}
		});
	});
	
	//先拿到dept中的数据
	function geDept_advice_data2() {
		$("#select_advice_dept2").empty();
		$.ajax({
			url : "${APP_PATH}/deptPost/getDepts",
			type : "GET",
			success : function(data) {
				//遍历数据添加option
				var list = data.map.deptList;
				$.each(list, function(index, item) {
					var optionOp = $("<option></option>").append(item.deptName).attr("value", item.deptId);
					optionOp.appendTo("#select_advice_dept2");
				});
			}
		});
	}
	
	//部门select的onchange事件
	$("#select_advice_dept2").change(function(){
		$("#select_advice_post2").empty();
		$("#select_advice_emp2").empty();
		var value = $("#select_advice_dept2").val();
		if(value != 0) {
		//通过部门id去拿职位
		 $.ajax({
			 url : "${APP_PATH}/deptPost/getPosts/"+value,
			 type : "GET",
			 success : function(data) {
				 var list = data.map.jobPostList;
					$.each(list, function(index, item) {
						var optionOp = $("<option></option>").append(item.postName).attr("value", item.postId);
						optionOp.appendTo("#select_advice_post2");
					});
			 }
		 });
		}
		});
	
	//职位select的onchange事件
	$("#select_advice_post2").change(function(){
		$("#select_advice_emp2").empty();
		var value = $("#select_advice_post2").val();
		if(value != 0) {
			//通过职位找员工
			 $.ajax({
				 url : "${APP_PATH}/deptPost/getEmps/"+value,
				 type : "GET",
				 success : function(data) {
					 var list = data.map.empList;
						$.each(list, function(index, item) {
							var optionOp = $("<option></option>").append(item.userName).attr("value", item.userId);
							optionOp.appendTo("#select_advice_emp2");
						});
				 }
			 });
		}
	})
	
	//=====================================模糊查询=========================================================
	function search_train() {
		to_page(1);
	}
	
	
	
	
	
	
	 
	</script>
</html>