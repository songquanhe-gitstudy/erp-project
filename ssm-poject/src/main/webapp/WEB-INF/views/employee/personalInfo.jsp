<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>课程信息显示</title>
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
	<!-- 进入员工界面弹出消息 -->
	<div class="modal fade bs-example-modal-sm" id="message_modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">消息提示</h4>
	      </div>
	      <div class="modal-body" id="modal_train_id">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default btn-info" data-dismiss="modal">确认</button>
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
					    	<h1 class="col-md-5">个人信息</h1>
						</div>
				    </div>
				    <div class="col-md-offset-4">
				    	<form class="form-horizontal" role="form" onsubmit="return confirm_data()" action="${APP_PATH}/employee/saveInfo.do" method="post" id="form_id">
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" readonly="readonly" name="name" id="add_name" placeholder="请填写真实姓名">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">部门名称</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" readonly="readonly" name="deptAndPost" id="add_name" placeholder="请填写部门名称">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">性别</label>
						    <div class="col-sm-4">
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
						    <div class="col-sm-4">
						      <input type="text" class="form-control" name="age" id="add_age" placeholder="请填写年龄">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">生日</label>
						    <div class="col-sm-4">
						      <input type="date" class="form-control" name="birthDay" id="add_birthday">
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
						    <label for="inputEmail3" class="col-sm-2 control-label">联系电话</label>
						    <div class="col-sm-4">
						      <input type="text" class="form-control" name="phoneNumber" id="add_phoneNumber" placeholder="请填写联系电话">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="inputEmail3" class="col-sm-2 control-label">email</label>
						    <div class="col-sm-4">
						      <input type="email" class="form-control" name="email" id="add_email" placeholder="请填写email">
						    </div>
						  </div>
						  <div class="form-group">
						    <div class="col-md-offset-3 col-md-12">
						      <button type="submit" class="btn btn-default btn-info" id="btn_submit">修改</button>
						    </div>
						  </div>
						</form>			
				    </div>
				   
				    <div class="panel-footer">
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
			//发一个请求查看有多少培训消息
			// get_train_message();
			
			var entity = ${entity};
			//根据职位id找到对应部门以及职位
			find_deptAndPost(entity.parentId);
			//填充form表单数据
			fill_form_data(entity);
			
		});
		
		//根据职位id找到对应部门以及职位
		function find_deptAndPost(id) {
			$.ajax({
				url : "${APP_PATH}/deptPost/getDmptByPId",
				type : "GET",
				data : "id="+id,
				async : true,
				success : function(data) {
					var deptName = data.map.list.deptName;
					$("form input[name=deptAndPost]").val(deptName);
				}
			});
			
			$.ajax({
				url : "${APP_PATH}/deptPost/getPostById",
				type : "GET",
				data : "id="+id,
				async: true,
				success : function(data) {
					var postName = data.map.list.postName;
					var deptName = $("form input[name=deptAndPost]").val();
					var deptAndPost = deptName + "-" + postName;
					$("form input[name=deptAndPost]").val(deptAndPost)
				}
			});
			
		}
		
		function confirm_data() {
			if(confirm("确认修改吗？")) {
				return true
			}else {
				return false;
			}
		}
		
		//填充form表单数据
		function fill_form_data(entity) {
			$("form input[name=name]").val(entity.userName);
			$("#form_id input[name=gender]").val([entity.gender]);
			$("form input[name=age]").val(entity.age);
			$("form input[name=birthDay]").val(entity.birthDay)
			$("form select[name=education]").val([entity.education]);
			$("form input[name=phoneNumber]").val(entity.phoneNumber);
			$("form input[name=email]").val(entity.email);
		}
		
		/* //培训消息
		function get_train_message() {
			$.ajax({
				url : "${APP_PATH}/train/empTrainInfoNumber",
				type : "GET",
				success : function(data) {
					var message_train = data.map.trainMessages;
					if(message_train != 0) {
						//写一条信息
						var message = $("<h4></h4>")
						.append("您有"+message_train+"条培训消息!")
						.appendTo("#modal_train_id")
						$("#message_modal").modal({
							backdrop:"static"
						});
					}
				}
			});
		} */
		
		
		
		
		
		
		
	</script>
</html>