<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>简历填写</title>
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
					    	<h1 class="col-md-5">填写简历</h1>
					    	<div id="resume_info">
					    	</div>
					    	<h5 class="col-md-5">提示：简历一旦被管理员查看就不可修改！</h5>
					    	<div id="div_write_again">
						     	  <button type="button" class="btn btn-success" id="btn_write_again" >重写一份</button>
						      	</div>
						</div>
						
				    </div>
						<form class="form-horizontal" role="form"  method="post" id="form_id">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">真实姓名</label>
						    <div class="col-sm-10">
						      <input type="hidden" class="form-control" name="recallData" id="add_state">
						      <input type="text" class="form-control" name="name" id="add_name" placeholder="请填写真实姓名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">年龄</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="age" id="add_age" placeholder="请填写年龄">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">性别</label>
						    <div class="col-sm-10">
							  <label class="radio-inline">
							    <input type="radio" name="gender" id="add_gender" checked="checked" value="M"> 男
							  </label>
							    <label class="radio-inline">
							  	<input type="radio" name="gender" id="add_gender" value="F"> 女
							   </label>
							</div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">学历</label>
						    <div class="col-sm-3">
						    <select class="form-control" name="education" id="add_aducation">
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
							   <select class="form-control" id="select_dept" name="jobDept">
							   	<option value=0></option>
								</select>
							</div>
							<div class="col-sm-3">
								<label>职位</label>
								<select class="form-control" id="select_post" name="jobPositon">
								</select>
							</div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">工作经验</label>
						      <div class="col-sm-3">
						    	<select class="form-control" name="jobExp" id="add_jobExp">
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
						      <input type="text" class="form-control" name="preJob" id="add_preJob" placeholder="请输入上份工作">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">期待薪资</label>
						    <div class="col-sm-3">
						    	<select class="form-control" name="exceptSalary" id="add_exceptSalary">
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
						      <input type="text" class="form-control" name="phoneNumber" id="add_phoneNumber" placeholder="请填写联系电话">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">email</label>
						    <div class="col-sm-10">
						      <input type="email" class="form-control" name="email" id="add_email" placeholder="请填写email">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">政治面貌</label>
						    <div class="col-sm-3">
						    <select class="form-control" name="politicsStatus" id="add_politicsStatus">
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
						      <textarea cols="4"  class="form-control" name="hobbies" id="add_hobbies" placeholder="请填写兴趣爱好">
						      </textarea>
						    </div>
						  </div>
						  <div class="form-group">
						    <div class="col-md-offset-6 col-md-12">
						    	<div id="div_submit">
						      	  <button type="button" class="btn btn-default btn-info" id="btn_submit">提交</button>
						      	</div>
						      	<div id="div_update">
						     	  <button type="button" class="btn btn-success" id="btn_update" >修改</button>
						      	</div>
						    </div>
						  </div>
						</form>				    
				</div>

			</div>
		</div>
	</div>
	<div class="container" id="footer">
		<div class="row">
			<div class="col-md-12">
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
		$(function() {
			//修改按钮一开始是隐藏的
			$("#div_update").hide();
			$("#div_submit").show();
			$("#div_write_again").hide();
			//如果简历已经提交
			var entity = ${entity};
			//先拿到dept中的数据
			geDept_data(entity.jobDept);
			
			if(entity != null && entity != 1) {
				//显示liuche
				var resumeInfo = '';
				if(entity.state == 1) 
					resumeInfo = "简历状态: 收取中..";
				if(entity.state == 2) {
					resumeInfo = "简历状态: 正在查看..";
				}
				if(entity.state == 3) {
					resumeInfo = "简历状态: 已标记..";
				}
				if(entity.state == 4) {
					resumeInfo = "简历状态: 通知面试.." + "面试时间:"+entity.interviewDate;
				}
				if(entity.state == 5) {
					resumeInfo = "简历状态: 通知部门管理人面试..";
				}
				if(entity.state == 6) {
					resumeInfo = "简历状态: 录用";
				}
				if(entity.state == 7) {
					resumeInfo = "简历状态: 不录用..";
					//给重写按钮加一个resumeid
					$("#btn_write_again").attr("resume_id", entity.resumeId);
					$("#div_write_again").show();
				}
					var h1 = $("<h3></h3>").append(resumeInfo).appendTo("#resume_info");
				//回写职位
				get_post_data(entity.jobDept, entity.jobPositon);
				//给表单填充数据	
				form_data(entity);
				//button改为修改显示增加隐藏
				$("#div_update").show();
				$("#div_submit").hide();
			}
		});
		
		//先拿到dept中的数据
		function geDept_data(deptId) {
			$.ajax({
				url : "${APP_PATH}/deptPost/getDepts",
				type : "GET",
				success : function(data) {
					//遍历数据添加option
					var list = data.map.deptList;
					$.each(list, function(index, item) {
						if(deptId == item.deptId) {
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
			$("#select_post").empty();
			var value = $("#select_dept").val();
			if(value != 0) {
			//通过部门id去拿职位
			 $.ajax({
				 url : "${APP_PATH}/deptPost/getPosts/"+value,
				 type : "GET",
				 success : function(data) {
					 var list = data.map.jobPostList;
						$.each(list, function(index, item) {
							var optionOp = $("<option></option>").append(item.postName).attr("value", item.postId);
							optionOp.appendTo("#select_post");
						});
				 }
			 });
			}
			});
		
		//职位select的onchange事件
		$("#select_post").change(function(){
			var value = $("#select_post").val();
		})
		
		//通过部门id去拿职位
		function get_post_data(deptId, postId) {
			
			 $.ajax({
				 url : "${APP_PATH}/deptPost/getPosts/"+deptId,
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
		
		//填充form表单数据
		function form_data(entity) {
			$("#add_name").val(entity.name);
			$("#add_age").val(entity.age);
			$("#form_id input[name=gender]").val([entity.gender]);
			$("#add_aducation").val([entity.education]);
			$("#form_id select[name=jobPositon]").val([entity.jobPositon]);
			$("#add_jobExp").val([entity.jobExp]);
			$("#add_preJob").val(entity.preJob);
			$("#add_exceptSalary").val([entity.exceptSalary]);
			$("#add_phoneNumber").val(entity.phoneNumber);
			$("#add_email").val(entity.email);
			$("#add_politicsStatus").val(entity.politicsStatus);
			$("#add_hobbies").text(entity.hobbies);
			$("#add_state").val(entity.state);
		}
		
		//点击提交简历表单
		$("#btn_submit").click(function() {
			$.ajax({
				url : "${APP_PATH}/visitor/saveResume",
				type : "POST",
				data : $("#form_id").serialize(),
				success : function(data) {
					if(data) {
						alert("简历提交成功！");
						//刷新页面
						history.go(0);
					}
				}
		  });
		}); 
		
		//点击提交简历表单(如果简历被查看就不可修改)
		$("#btn_update").click(function() {
			var state = $("#add_state").val();
			console.log(state)
				if(state == 1){
					$.ajax({
						url : "${APP_PATH}/visitor/updateResume",
						type : "POST",
						data : $("#form_id").serialize(),
						success : function(data) {
							if(data) {
								//刷新页面
								history.go(0);
							}
						}
				  });
				}else {
					alert('您的简历正在被处理，不可修改！');
				}
			});
		
		//重写简历即删除简历
		$("#btn_write_again").click(function() {
			if(confirm("确定重写简历吗?")) {
				$.ajax({
					url : "${APP_PATH}/resume/writeResumeAgain/"+$(this).attr("resume_id"),
					success : function(data) {
						if(data) {
							alert("请重写，祝好运");
							//刷新页面
							history.go(0);
						}
					}
				});
			}
		});
			
		
		
		
		
		
		
		
		
		
		
		
	</script>

</body>
</html>