<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>简历管理</title>
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
	<!-- 流程状态模态框 -->
	<div class="modal fade" id="resume_state_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="span_state">流程状态</h4>
	      </div>
	      <div class="modal-body">
	        <table class="table table-bordered" id="table_flow_id">
		        <thead>
		            <tr>
	            	  <th>任务号</th>
					  <th>流程号</th>
					  <th>节点内容</th>
					  <th>执行人</th>
				      <th>创建时间</th>
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
	
	<!-- 指派人模态框 -->
	<div class="modal fade" id="resume_deptmanage_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="span_state">指定委派人</h4>
	      </div>
	      <div class="modal-body">
	       	 <div class="form-group">
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
					<select class="form-control" id="select_advice_emp" name="jobEmp">
					</select>
				</div>
			 </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="modal_dvice_emp_sure">确定</button>
	      </div>
	    </div>
	  </div>
	</div>


	<!-- 查看模态框 -->
	<div class="modal fade" id="check_resume_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">简历信息</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" role="form" method="post" id="form_check_id">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">真实姓名</label>
			    <div class="col-sm-10">
			      <input type="hidden" class="form-control" name="recallData" id="recall_data">
			      <input type="text" disabled="true" class="form-control" name="name" id="add_name">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">年龄</label>
			    <div class="col-sm-10">
			      <input type="text" disabled="true" class="form-control" name="age" id="add_age">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">性别</label>
			    <div class="col-sm-10">
				  <label class="radio-inline">
				    <input type="radio" disabled="true"  name="gender" id="add_gender" checked="checked" value="M"> 男
				  </label>
				    <label class="radio-inline">
				  	<input type="radio" disabled="true"  name="gender" id="add_gender" value="F"> 女
				   </label>
				</div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">学历</label>
			    <div class="col-sm-3">
			    <select class="form-control" disabled="true"  name="education" id="add_aducation">
					  <option value="本科">本科</option>
					  <option value="研究生">研究生</option>
					  <option value="博士">博士</option>
					  <option value="其他">其他</option>
					</select>
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">应聘职位</label>
			   <div class="col-sm-3">
			   	   <label  >部门</label>
				   <select class="form-control" disabled="true"  id="select_dept" name="jobDept">
				   	<option value=0></option>
					</select>
				</div>
				<div class="col-sm-3">
					<label>职位</label>
					<select class="form-control" disabled="true"  id="select_post" name="jobPositon">
					</select>
				</div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">工作经验</label>
			      <div class="col-sm-3">
			    	<select class="form-control" disabled="true"  name="jobExp" id="add_jobExp">
					  <option value="无">无</option>
					  <option value="1年">1年</option>
					  <option value="1-3年">1-3年</option>
					  <option value="3-5年">3-5年</option>
					  <option value="5年以上">5年以上</option>
					</select>
					</div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">上份工作</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" disabled="true" name="preJob" id="add_preJob">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">期待薪资</label>
			    <div class="col-sm-3">
			    	<select class="form-control" disabled="true"  name="exceptSalary" id="add_exceptSalary">
					  <option value="2000-3000">2000-3000</option>
					  <option value="3000-4000">3000-4000</option>
					  <option value="4000-5000">4000-5000</option>
					  <option value="5000-10000">5000-10000</option>
					  <option value="10000以上">10000以上</option>
					</select>
					</div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">联系电话</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" disabled="true"  name="phoneNumber" id="add_phoneNumber" placeholder="请填写联系电话">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="email" class="form-control" disabled="true" name="email" id="add_email" placeholder="请填写email">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">政治面貌</label>
			    <div class="col-sm-3">
			    <select class="form-control" disabled="true" name="politicsStatus" id="add_politicsStatus">
					  <option value="普通群众" >普通群众</option>
					  <option value="少先队员">少先队员</option>
					  <option value="共青团员">共青团员</option>
					  <option value="天朝党员">天朝党员</option>
					  <option value="搬砖工">搬砖工</option>
					</select>
				</div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">兴趣爱好</label>
			    <div class="col-sm-10">
			      <textarea cols="4"  class="form-control" disabled="true" name="hobbies" id="add_hobbies">
			      </textarea>
			    </div>
			  </div>
			</form>			
	      </div>
	      <div class="modal-body">
	         
	      </div>
	      
	      <div class="modal-footer">
	      	  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">面试时间</label>
			    <div class="col-sm-6">
			      <input type="date"  class="form-control" name="interviewDate" id="interviewDate_id">
			    </div>
			  </div>

			<button type="button" class="btn btn-primary advice_visitor_invite" name="" id="">
			<span class="glyphicon glyphicon-transfer"></span>通知面试
			</button>
			<div id="invite_dept_id">
				<button type="button" class="btn btn-success advice_visitor_invite_dept" name="" id="">
				<span class="glyphicon glyphicon-user"></span>面试人
				</button>
			</div>
	        <button type="button" class="btn btn-default modal_btn_invite_cancel" data-dismiss="modal">关闭</button>
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
					    	<h1 class="col-md-5">简历信息</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" id="form_search" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入查找" name="findByName">
									<span class="input-group-addon btn" onclick="search_user()" id="sub">搜索</span>
								</div>
							</form>

						</div>
				    </div>
				    <table class="table table-bordered" id="table_id">
					        <thead>
					            <tr>
					            	<th>序号</th>
									<th>姓名</th>
									<th>应聘职位</th>
									<th>工作经验</th>
									<th>学历</th>
									<th>状态</th>
									<th>详细信息</th>
									<th>流程状态</th>
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
				url : "${APP_PATH}/resume/showResumeData/"+pn,
				//data : $("#form_search").serialize(),
				success : function(e) {
					if(e) {
						console.log('---------=========')
						console.log(e)
						var list = e.map.list.list;
						fill_resume_data(list);
						//填充分页信息
						pager_data(e.map.list);
						//填充分页导航信息
						nav_data(e.map.list);
					}
				}
			});
		}
		
		//填充数据
		function fill_resume_data(list) {
			$.each(list, function(index, item) {
				var resumeInfo = '';
				if(item.state == 1) 
					resumeInfo = "简历状态: 收取中";
				if(item.state == 2) {
					resumeInfo = "简历状态: 查看中";
				}
				if(item.state == 3) {
					resumeInfo = "简历状态: 已标记";
				}
				if(item.state == 4) {
					resumeInfo = "简历状态: 通知面试";
				}
				if(item.state == 5) {
					resumeInfo = "简历状态: 等待管理人面试";
				}
				if(item.state == 6) {
					resumeInfo = "简历状态: 录用";
				}
				if(item.state == 7) {
					resumeInfo = "简历状态: 不录用..";
				}
				var idTd = $("<td></td>").append(item.resumeId);
				var nameTd = $("<td></td>").append(item.name);
				var deptAndPostTd = $("<td></td>").append(find_deptAndPost(item.jobPositon));
				var jobExpTd = $("<td></td>").append(item.jobExp);
				var educationTd = $("<td></td>").append(item.education);
				//简历状态
				var sateTd = $("<td></td>").append(resumeInfo);
				//详细信息
				var detailInfoBtn = $("<button></button>").addClass("btn btn-info btn-sm btn_detail_info")
				.append($("<span></span>").addClass("glyphicon glyphicon-eye-open")).append("查看");
				detailInfoBtn.attr("resume_id", item.resumeId)
				.attr("dept_id", item.jobDept)
				.attr("post_id", item.jobPositon)
				.attr("state", item.state)
				.attr("time", item.interviewDate);
				var detailInfoTd = $("<td></td>").append(detailInfoBtn);
				//状态查看按钮
				var stateBtn = $("<button></button>").addClass("btn btn-warning btn-sm btn_state_job")
				.append($("<span></span>").addClass("glyphicon glyphicon-stats")).append("状态");
				stateBtn.attr("resume_id", item.resumeId).attr("resume_name", item.nmae);
				var chanstate = $("<td></td>").append(stateBtn);
				
				//删除按钮
				var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm btn_del")
				.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				deleteBtn.attr("resume_id", item.resumeId).attr("resume_name",item.name );
				var deleteTd = $("<td></td>").append(deleteBtn);
			
				$("<tr></tr>").append(idTd)
							  .append(nameTd)
							  .append(deptAndPostTd)
							  .append(jobExpTd)
							  .append(educationTd)
							  .append(sateTd)
							  .append(detailInfoTd)
							  .append(chanstate)
							  .append(deleteTd)
							  .appendTo("#table_id tbody");
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

	//================================================查看简历===================================================	
	$(document).on("click", ".btn_detail_info",function() {
		//显示的面试人按钮
		$("#invite_dept_id").hide();
		$(".advice_visitor_invite").attr('disabled', false)
		var state = $(this).attr("state");
		if(state == 4) {
			$(".advice_visitor_invite").attr('disabled', true)
			//显示隐藏的面试人按钮
			$("#invite_dept_id").show();
			var time = $(this).attr("time")
			$("#interviewDate_id").val(time);
			//点击面试人按钮
			$(".advice_visitor_invite_dept").click(function(){
				//给面试按钮加简历id
				$(".advice_visitor_invite").attr("resume_id", $(this).attr("resume_id"));
				//TODO
				//关闭模态框
				$("#check_resume_modal").modal('hide');
				//指派人数据
				geDept_advice_data();
				//弹出指派人模态框
				$("#resume_deptmanage_modal").modal({
					backdrop : "static"
				});	
			});
		}else {
			//清空面试时间
			$("#interviewDate_id").val('');
		}
		if(state > 4) {
			//设置面试时间
			var time = $(this).attr("time")
			$("#interviewDate_id").val(time);
			//隐藏的面试人按钮
			$("#invite_dept_id").hide();
			//面试按钮不可用
			$(".advice_visitor_invite").attr('disabled', true)
		}
		//给简历更新状态
		update_resume_check($(this).attr("resume_id"), state);
		//给面试按钮加简历id
		$(".advice_visitor_invite").attr("resume_id", $(this).attr("resume_id"));
		//给面试人按钮加简历id
		$("#modal_dvice_emp_sure").attr("resume_id", $(this).attr("resume_id"));
		//信息填充
		fill_per_info($(this).attr("resume_id"));
		//先拿到dept中的信息
		geDept_data($(this).attr("dept_id"));
		//通过部门id拿到所有的职位
		get_post_data($(this).attr("dept_id"), $(this).attr("post_id"));
		//弹出模态框
		$("#check_resume_modal").modal({
			backdrop : "static"
		});
	});
	//给简历更新状态
	function update_resume_check(id, state) {
		$.ajax({
			url : "${APP_PATH}/resume/updateResumeCheck",
			data : {
				id : id,
				state : state
			},
			success :function(data) {
				if(data) {
					//跳转到当前页面
					to_page(currentpage);
				}
			}
		});
	}
		
	function fill_per_info(id) {
		$.ajax({
			url : "${APP_PATH}/resume/getResumeInfo/"+id,
			type : "GET",
			success : function(data) {
				if(data) {
					var entity = data.map.entity;
					$("#add_name").val(entity.name);
					$("#add_age").val(entity.age);
					$("#form_id input[name=gender]").val([entity.gender]);
					$("#add_aducation").val([entity.education]);
					console.log(entity.jobDept);
					//$("#form_id select[name=jobDept]").val([entity.jobDept]);
					//$("#form_id select[name=jobDept] option[value=entity.jobDept]").attr("selected","selected");
					
					$("#form_id select[name=jobPositon]").val([entity.jobPositon]);
					$("#add_jobExp").val([entity.jobExp]);
					$("#add_preJob").val(entity.preJob);
					$("#add_exceptSalary").val([entity.exceptSalary]);
					$("#add_phoneNumber").val(entity.phoneNumber);
					$("#add_email").val(entity.email);
					$("#add_politicsStatus").val(entity.politicsStatus);
					$("#add_hobbies").text(entity.hobbies);
				}
			}
		});
	}
	
	//拿到dept中的数据
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
						var optionOp = $("<option></option>").append(item.deptName).attr("value", item.deptId).attr("selected", "selected");
						optionOp.appendTo("#select_dept");
					}else {
						var optionOp = $("<option></option>").append(item.deptName).attr("value", item.deptId);
						optionOp.appendTo("#select_dept");
					}
					
				});
			}
		});
		console.log(1)
	}
	
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
	//================================通知游客去面试=================================================
		$(".advice_visitor_invite").click(function() {
			var interviewDate = $("#interviewDate_id").val();
			var datetamp = Date.parse(new Date());
			var selecttamp = Date.parse(new Date(interviewDate));
			if(datetamp >= selecttamp){
				alert('面试时间不能小于今天！');
				return false;
			}else if(interviewDate != ""){
				//更新简历数据
				update_resume_advice($(this).attr("resume_id"), selecttamp);
				//关闭模态框
				$("#check_resume_modal").modal('hide');
				//指派人数据
				geDept_advice_data();
				//弹出指派人模态框
				$("#resume_deptmanage_modal").modal({
					backdrop : "static"
				});	
			}else {
				alert('请填写面试时间！');
			}
			
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
		
		//更新简历数据
		function update_resume_advice(id, selecttamp) {
			$.ajax({
				url : "${APP_PATH}/resume/updateResumeAdvice",
				data : {
					id : id,
					interviewDates : selecttamp
				},
				success : function(data) {
					if(data) {
						alert('面试通知已下发！');
						to_page(currentpage);
					}
				}
			});
		}
		
		//指派人确定按钮
		$("#modal_dvice_emp_sure").click(function() {
			var empId = $("#select_advice_emp").val();
			if(empId == null || empId == '') {
				alert("指派人不能为空！");
			}else {
				//走流程,把简历面试节点给委派人
				update_resume_dpetManage($(this).attr("resume_id"), empId);
			}
		});
	
		function update_resume_dpetManage(resume_id, empId){
			var interviewDate = $("#interviewDate_id").val();
			var selecttamp = Date.parse(new Date(interviewDate));
			$.ajax({
				url : "${APP_PATH}/resume/updateResumeDeptManage",
				data : {
					resume_id : resume_id,
					empId : empId,
					interviewDates : selecttamp
				},
				success : function(data) {
					if(data) {
						alert('面试安排人员完成！');
						//关闭委派人模态框
						$("#resume_deptmanage_modal").modal('hide');
						//走完安排人员
						to_page(currentpage);
					}
				}
			});
		}
		
	//======================================流程状态==========================================================
		$(document).on("click", ".btn_state_job", function() {
			//$("#span_state").html($(this).attr("resume_name"))
			//状态数据填充
			fill_state_info($(this).attr("resume_id"));
			//弹出模态框
			$("#resume_state_modal").modal({
				backdrop : "static"
			});
		});
	
		//填充数据
		function fill_state_info(resume_id) {
			$("#table_flow_id tbody").empty();
			$.ajax({
				url : "${APP_PATH}/resumeFlow/getFlowData/"+resume_id,
				type : "GET",
				success : function(data) {
					if(data) {
						console.log(data);
						var list = data.map.rfList;
						$.each(list, function(index, item) {
							var stateTd = $("<td></td>").append(item.state);
							var resumeIdTd = $("<td></td>").append(item.resumeId);
							var contentTd = $("<td></td>").append(item.content);
							var operatorNowTd = $("<td></td>").append(item.operatorNow);
							var createTimeTd = $("<td></td>").append(item.createTime);
							$("<tr></tr>").append(stateTd).append(resumeIdTd).append(contentTd)
										  .append(operatorNowTd).append(createTimeTd)
										  .appendTo("#table_flow_id tbody");
						});
						
					}
				}
			});
		}
		
		
	//======================================删除======================================================
		$(document).on("click", ".btn_del",function() {
		if(confirm("确认删除【"+$(this).attr("resume_name")+"】的简历吗？")) {
			$.ajax({
				url : "${APP_PATH}/resume/deleteResume/"+$(this).attr("resume_id"),
				success : function(data) {
					if(data) {
						alert("删除成功！")
						to_page(currentpage);
					}
				}
			});
		}
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
	
	
	
	
	
	
	
	
	
	
	
	</script>
</html>