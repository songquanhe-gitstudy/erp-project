<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>员工信息管理</title>
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

	<!-- 薪资模态框 -->
	<div class="modal fade" id="emp_salary_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="span_state">考勤记录</h4>
	      </div>
	      <div class="modal-body">
	        <table class="table table-bordered" id="table_salary_id">
		        <thead>
		            <tr>
	            	 <th>序号</th>
					<th>年份</th>
					<th>月份</th>
					<th>基本工资</th>
					<th>绩效工资</th>
					<th>加班工资</th>
					<th>奖惩金</th>
					<th>社保</th>
					<th>总工资</th>
					<th>工资单状态</th>
		            </tr>
		        </thead>
		        <tbody>
		        </tbody>
		    </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary modal_btn_invite_cancel" data-dismiss="modal">确定</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 考勤模态框 -->
	<div class="modal fade" id="emp_attend_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="span_state">考勤记录</h4>
	      </div>
	      <div class="modal-body">
	        <table class="table table-bordered" id="table_attend_id">
		        <thead>
		            <tr>
	            	  <th>序号</th>
					  <th>年份</th>
					  <th>月份</th>
					  <th>天</th>
				      <th>上班时间</th>
				      <th>下班时间</th>
				      <th>状态</th>
		            </tr>
		        </thead>
		        <tbody>
		        </tbody>
		    </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary modal_btn_invite_cancel" data-dismiss="modal">确定</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 删除模态框 -->
	<div class="modal fade" id="del_emp_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">删除员工</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" id="del_form">
	          <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">员工名</label>
			   <div class="col-sm-3">
			   	   <input type="hidden" class="form-control" name="userId"  id="del_emp_id">
			   	   <input type="text" class="form-control" name="userName"  id="del_emp_name">
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">删除原因</label>
			   <div class="col-sm-3">
				   <textarea type="text" class="form-control" name="reason"  id="del_reaon"></textarea>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default modal_btn_changepost_cancel" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="modal_btn_del">确定</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- =======================================查看=============================================  -->
	<!-- 详细信息模态框 -->
	<div class="modal fade" id="check_emp_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工详细信息</h4>
	      </div>
	      <div class="modal-body">
	        <div>
		    	<form class="form-horizontal" role="form" onsubmit="return confirm_data()" action="#" method="post" id="form_id">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" readonly="readonly" name="name" id="add_name" placeholder="请填写真实姓名">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">性别</label>
				    <div class="col-sm-6">
					  <label class="radio-inline">
					    <input type="radio" name="gender" readonly="readonly" id="add_gender" checked="checked" value="M"> 男
					  </label>
					    <label class="radio-inline">
					  	<input type="radio" name="gender" readonly="readonly" id="add_gender" value="F"> 女
					   </label>
					</div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">年龄</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" readonly="readonly" name="age" id="add_age" placeholder="请填写年龄">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">生日</label>
				    <div class="col-sm-6">
				      <input type="date" class="form-control" readonly="readonly" name="birthDay" id="add_birthday">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">学历</label>
				    <div class="col-sm-4">
				    <select class="form-control" name="education" readonly="readonly" id="add_aducation">
						  <option value="本科">本科</option>
						  <option value="研究生">研究生</option>
						  <option value="博士">博士</option>
						  <option value="其他">其他</option>
						</select>
					</div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">联系电话</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" readonly="readonly" name="phoneNumber" id="add_phoneNumber" placeholder="请填写联系电话">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">email</label>
				    <div class="col-sm-6">
				      <input type="email" class="form-control" readonly="readonly" name="email" id="add_email" placeholder="请填写email">
				    </div>
				  </div>
				</form>			
		    </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default modal_btn_checkout_cancel" data-dismiss="modal">关闭</button>
	       <!--  <button type="button" class="btn btn-primary" id="modal_btn_checkout_post">确定</button> -->
	      </div>
	    </div>
	  </div>
	</div>

	<!-- ======================================换岗============================================== -->
	<!-- 换岗模态框 -->
	<div class="modal fade" id="change_post_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">换岗操作</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" id="change_job_form">
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">岗位</label>
			   <div class="col-sm-3">
			   	   <label  >部门</label>
			   	   <input type="hidden" class="form-control" name="userId"  id="change_job_id">
				   <select class="form-control" id="select_dept" name="jobDept">
					</select>
				</div>
				<div class="col-sm-4">
					<label>职位</label>
					<select class="form-control" id="select_post" name="parentId">
					</select>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default modal_btn_changepost_cancel" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="modal_btn_change_post">确定</button>
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
					    	<h1 class="col-md-5">员工信息</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" id="form_search" method="post">
							<div class="input-group">
						   	   <label  >状态</label>
							    <select class="form-control" id="state_id" name="state">
							    <option value="所有">所有</option>
							   	<option value="在职">在职</option>
							   	<option value="游客">游客</option>
							   	<option value="离职">离职</option>
								</select>
							</div>
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入姓名查找" name="findByName">
									<span class="input-group-addon btn" onclick="search_user()" id="sub">搜索</span>
								</div>
							</form>
						</div>
						
				    </div>
				    <table class="table table-bordered" id="table_id">
					        <thead>
					            <tr>
					            	<th>序号</th>
									<th>员工姓名</th>
									<th>员工职位</th>
									<th>员工状态</th>
									<th>换岗操作</th>
									<th>培训信息</th>
									<th>考勤信息</th>
									<th>薪资信息</th>
									<th>删除</th>
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
	var currentpage;
		$(function() {
			//到的页码
			to_page(1);
		});
		
	
		function to_page(pn) {
			$("#table_id tbody").empty();
			$.ajax({
				url : "${APP_PATH}/admin/ajax_showEmpInfo/"+pn,
				data : $("#form_search").serialize(),
				success : function(e) {
					if(e) {
						console.log(e)
						var list = e.map.list.list;
						$.each(list, function(index, item) {
							var idTd = $("<td></td>").append(item.userId);
							var nameTd = $("<td></td>").append(item.userName);
							var deptAndPostTd = $("<td></td>").append(find_deptAndPost(item.parentId));
							var stateTd = $("<td></td>").append(item.state);
							//换岗按钮
							if(item.state == "离职" || item.state == "游客") {
								var chagejobBtn = $("<button></button>").addClass("btn btn-default btn-sm btn_change_job")
								.append($("<span></span>").addClass("glyphicon glyphicon-retweet")).append("换岗");
								chagejobBtn.attr("emp_id", item.userId).attr('disabled',true);
								var changejobTd = $("<td></td>").append(chagejobBtn);
							}else {
								var chagejobBtn = $("<button></button>").addClass("btn btn-warning btn-sm btn_change_job")
								.append($("<span></span>").addClass("glyphicon glyphicon-retweet")).append("换岗");
								chagejobBtn.attr("emp_id", item.userId).attr("postId", item.parentId);
								var changejobTd = $("<td></td>").append(chagejobBtn);
							}
							//详细信息
							var detailInfoBtn = $("<button></button>").addClass("btn btn-info btn-sm btn_detail_info")
							.append($("<span></span>").addClass("glyphicon glyphicon-zoom-in")).append("查看");
							detailInfoBtn.attr("emp_id", item.userId);
							var detailInfoTd = $("<td></td>").append(detailInfoBtn);
							/* //培训信息
							if(item.state == "游客") {
								var trainBtn = $("<button></button>").addClass("btn btn-default btn-sm btn_train_info")
								.append($("<span></span>").addClass("glyphicon glyphicon-blackboard")).append("培训");
								trainBtn.attr("emp_id", item.userId).attr('disabled',true);
								var trainTd = $("<td></td>").append(trainBtn);
							}else {
								var trainBtn = $("<button></button>").addClass("btn btn-primary btn-sm btn_train_info")
								.append($("<span></span>").addClass("glyphicon glyphicon-blackboard")).append("培训");
								trainBtn.attr("emp_id", item.userId);
								var trainTd = $("<td></td>").append(trainBtn);
							} */
							//考勤信息
							if(item.state == "游客") {
								var attendanceBtn = $("<button></button>").addClass("btn btn-default btn-sm btn_attend_info")
								.append($("<span></span>").addClass("glyphicon glyphicon-calendar")).append("考勤");
								attendanceBtn.attr("emp_id", item.userId).attr('disabled',true);
								var attendanceTd = $("<td></td>").append(attendanceBtn);
							}else {
								var attendanceBtn = $("<button></button>").addClass("btn btn-success btn-sm btn_attend_info")
								.append($("<span></span>").addClass("glyphicon glyphicon-calendar")).append("考勤");
								attendanceBtn.attr("emp_id", item.userId);
								var attendanceTd = $("<td></td>").append(attendanceBtn);
							}
							//薪资信息
							if(item.state == "游客") {
								var wageBtn = $("<button></button>").addClass("btn btn-default btn-sm btn_wage_info")
								.append($("<span></span>").addClass("glyphicon glyphicon-usd")).append("薪资");
								wageBtn.attr("emp_id", item.userId).attr('disabled',true);
								var wageTd = $("<td></td>").append(wageBtn);
							}else {
								var wageBtn = $("<button></button>").addClass("btn btn-info btn-sm btn_wage_info")
								.append($("<span></span>").addClass("glyphicon glyphicon-usd")).append("薪资");
								wageBtn.attr("emp_id", item.userId);
								var wageTd = $("<td></td>").append(wageBtn);
							}
							//删除按钮
							if(item.state == "离职" || item.state == "游客"){
								var deleteBtn = $("<button></button>").addClass("btn btn-default btn-sm active")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
								deleteBtn.attr("emp_id", item.userId).attr('disabled',true);
								var deleteTd = $("<td></td>").append(deleteBtn);
							}else{
								var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm btn_del")
								.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
								deleteBtn.attr("emp_id", item.userId).attr("emp_name",item.userName );
								var deleteTd = $("<td></td>").append(deleteBtn);
							}
							
							$("<tr></tr>").append(idTd)
										  .append(nameTd)
										  .append(deptAndPostTd)
										  .append(stateTd)
										  .append(changejobTd)
										  .append(detailInfoTd)
										  .append(attendanceTd)
										  .append(wageTd)
										  .append(deleteTd)
										  .appendTo("#table_id tbody");
						});
						//填充分页信息
						pager_data(e.map.list);
						//填充分页导航信息
						nav_data(e.map.list);
					}
				}
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
			currentpage = e.pageNum;
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
	
		//点击换岗按钮
		$(document).on("click", ".btn_change_job",function() {
			//给模态框中的确认按钮添加id
			$("#modal_btn_change_post").attr("emp_id", $(this).attr("emp_id"));
			//把部门对应上去
			var deptId = get_dept_id($(this).attr("postId"));
			//通过部门id拿该部门所有的职位
			get_post_data(deptId, $(this).attr("postId"));
			//拿到dept中的数据
			geDept_data(deptId);
			//弹出模态框
			$("#change_post_modal").modal({
				backdrop:"static"
			});
		});
		
		//点击模态框中的确认按钮
		$("#modal_btn_change_post").click(function() {
			//给表单设置id
			$("#change_job_id").val($(this).attr("emp_id"));
			$.ajax({
				url : "${APP_PATH}/deptPost/chDeptAndPost",
				type : "POST",
				data : $("#change_job_form").serialize(),
				success : function(e) {
					if(e) {
						//关闭模态框
						$("#change_post_modal").modal('hide');
						//跳到当前页面
						to_page(currentpage);
					}
				}
			});
		});
		
		//先拿到dept中的数据
		function geDept_data(id) {
			$("#select_dept").empty();
			$.ajax({
				url : "${APP_PATH}/deptPost/getDepts",
				type : "GET",
				success : function(data) {
					//遍历数据添加option
					var list = data.map.deptList;
					$.each(list, function(index, item) {
						if(id == item.deptId) {
							var optionOp = $("<option></option>").append(item.deptName).attr("value", item.deptId).attr("selected","selected");
							optionOp.appendTo("#select_dept");
						}else {
							var optionOp = $("<option></option>").append(item.deptName).attr("value", item.deptId);
							optionOp.appendTo("#select_dept");
						}
					});
				}
			});
		}
		
		//部门select的onchange事件
		$("#select_dept").change(function(){
			var postId = -1;
			$("#select_post").empty();
			var value = $("#select_dept").val();
			if(value != 0) {
				//通过部门id去拿职位
				get_post_data(value, postId);
			}
			});
		
		//通过部门id去拿职位
		function get_post_data(value, postId) {
			
			 $.ajax({
				 url : "${APP_PATH}/deptPost/getPosts/"+value,
				 type : "GET",
				 success : function(data) {
					 var list = data.map.jobPostList;
						$.each(list, function(index, item) {
							if(postId == item.postId) {
								var optionOp = $("<option></option>").append(item.postName).attr("value", item.postId).attr("selected","selected");
								optionOp.appendTo("#select_post");
							}else {
								var optionOp = $("<option></option>").append(item.postName).attr("value", item.postId);
								optionOp.appendTo("#select_post");
							}
						});
				 }
			 });
		}
		
		//职位select的onchange事件
		$("#select_post").change(function(){
			var value = $("#select_post").val();
		})
		
		$(".modal_btn_changepost_cancel").click(function() {
			$("#select_post").empty();
		});
	
		//获取部门id
		function get_dept_id(id) {
			var deptId;
			$.ajax({
				url : "${APP_PATH}/deptPost/getDmptByPId",
				type : "GET",
				data : "id="+id,
				async:false,
				success : function(data) {
					deptId = data.map.list.deptId;
				}
			});
			return deptId;
		}
	
	//=========================================查看============================================
	//点击查看详细信息按钮
	$(document).on("click", ".btn_detail_info", function() {
		//查出该员工所有的信息
		get_per_emp_data($(this).attr("emp_id"));
		//弹出模态框
		$("#check_emp_modal").modal({
			backdrop : "static"
		});
	});
	
	//查出该员工所有的信息
	function get_per_emp_data(id) {
		$.ajax({
			url : "${APP_PATH}/admin/getPerEmps/"+id,
			type : "GET",
			success : function(e) {
				if(e) {
					console.log(e);
					//给表单填充数据
					var entity = e.map.list;
					$("form input[name=name]").val(entity.userName);
					$("#form_id input[name=gender]").val([entity.gender]);
					$("form input[name=age]").val(entity.age);
					$("form input[name=birthDay]").val(entity.birthDay)
					$("form select[name=education]").val([entity.education]);
					$("form input[name=phoneNumber]").val(entity.phoneNumber);
					$("form input[name=email]").val(entity.email);
					
				}
			}
		})
	}
	
	//====================================删除===========================================================
	$(document).on("click", ".btn_del",function(){
		$("#del_emp_id").val($(this).attr("emp_id"));
		$("#del_emp_name").val($(this).attr("emp_name"));
		//弹出删除模态框
		$("#del_emp_modal").modal({
			backdrop : "static"
		});
	});
	
	//点击模态框中的确定按钮
	$("#modal_btn_del").click(function() {
		$.ajax({
			url : "${APP_PATH}/admin/delEmp",
			data : $("#del_form").serialize(),
			success : function(e) {
				if(e) {
					//关闭模态框
					$("#del_emp_modal").modal('hide');
					//回到当前页面
					to_page(currentpage);
				}
			}
		});
	});
	
	//========================================搜索============================================
	function search_user() {
		/* $.ajax({
			url : "${APP_PATH}/admin/ajax_showEmpInfo",
			type : "POST",
			data : $("#form_search").serialize(),
			success : function(data) { */
				to_page(1);
	/* 		}
		}); */
	}
	
	//=========================================点击考勤============================================
	$(document).on("click", ".btn_attend_info", function() {
		//填充员工考勤记录
		fill_attend_data($(this).attr("emp_id"));
		//弹出模态框
		$("#emp_attend_modal").modal({
			backdrop : "static"
		});
	});
	
	function fill_attend_data(userId) {
		$("#table_attend_id tbody").empty();
		$.ajax({
			url : "${APP_PATH}/attendance/asUserData/"+userId,
			success : function (data) {
				if(data) {
					console.log("===========")
					console.log(data)
					var list = data.map.asLsit; 
					//填充
					$.each(list, function(index, item) {
						var idTd = $("<td></td>").append(item.id);
						var yearsTd = $("<td></td>").append(item.years);
						var monthsTd = $("<td></td>").append(item.months);
						var daysTd = $("<td></td>").append(item.days);
						var onWorkTimeTd = $("<td></td>").append(item.onWorkTime);
						var outWorkTimeTd = $("<td></td>").append(item.outWorkTime);
						var descriptTd = $("<td></td>").append(item.descript);
						$("<tr></tr>").append(idTd).append(yearsTd).append(monthsTd)
									  .append(daysTd).append(onWorkTimeTd).append(outWorkTimeTd).append(descriptTd)
									  .appendTo("#table_attend_id tbody");
					});
				}
			}
		});
	}
	
	//==========================================薪资查看==================================================
	$(document).on("click", ".btn_wage_info", function() {
		//填充员工考勤记录
		fill_salary_data($(this).attr("emp_id"));
		//弹出模态框
		$("#emp_salary_modal").modal({
			backdrop : "static"
		});
	});
	function fill_salary_data(userId) {
		$("#table_salary_id tbody").empty();
		$.ajax({
			url : "${APP_PATH}/wage/findUserWage/"+userId,
			success : function (data) {
				if(data) {
					var list = data.map.wageList; 
					//填充
					$.each(list, function(index, item) {
						var wageIdTd = $("<td></td>").append(item.wageId);
						var yearsTd = $("<td></td>").append(item.years);
						var monthsTd = $("<td></td>").append(item.months);
						var baseWageTd = $("<td></td>").append(item.baseWage);
						var perfWageTd = $("<td></td>").append(item.perfWage);
						var ovWageTd = $("<td></td>").append(item.ovWage);
						var rapWageTd = $("<td></td>").append(item.rapWage);
						var jinpoWageTd = $("<td></td>").append(item.jinpoWage);
						var totalWageTd = $("<td></td>").append(item.totalWage);
						if(item.state == 0) {
							var stateTd = $("<td></td>").append("正常");
						}else if(item.state == 1) {
							var stateTd = $("<td></td>").append("申请复议中");
						}else if(item.state == 2) {
							var stateTd = $("<td></td>").append("复议完成");
						}
						$("<tr></tr>").append(wageIdTd).append(yearsTd).append(monthsTd)
									  .append(baseWageTd).append(perfWageTd).append(ovWageTd)
									  .append(rapWageTd).append(jinpoWageTd).append(totalWageTd)
									  .append(stateTd)
									  .appendTo("#table_salary_id tbody");
					});
				}
			}
		});
	}
	
	
	
	
	
	
	
	
	</script>
</html>