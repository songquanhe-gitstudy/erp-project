<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<% 
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<script src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"</link>
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

	<style type="text/css">
	body{
	   background: url(images/a.jpg)repeat;
	}
	#login-box {
		border:1px solid #798A8F;
		padding: 35px;
		border-radius:15px;
		background: #719BAC;
		color: #fff;
	}

	</style>
</head>
<body>

	<!-- 注册模态框 -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">注册</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="userName_id" name="userName"  placeholder="请填写用户名">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">密码</label>
			    <div class="col-sm-10">
			      <input type="password" class="form-control" id="password_id" name="password"  placeholder="请填写密码">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">学历</label>
			    <div class="col-sm-6">
			      <select class="form-control" name="education" id="education_id">
					  <option value="本科">本科</option>
					  <option value="研究生">研究生</option>
					  <option value="博士">博士</option>
					  <option value="其他">其他</option>
				  </select>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>
			    <div class="col-sm-10">
			      <input type="email" class="form-control" name="email" id="email_id" placeholder="请输入邮箱">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">性别</label>
			    <div class="col-sm-10">
				  <label class="radio-inline">
				    <input type="radio" name="gender" id="model_add_gender1" checked="checked" value="M"> 男
				  </label>
				    <label class="radio-inline">
				  	<input type="radio" name="gender" id="model_add_gender2" value="F"> 女
				   </label>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="btn_add_user">增加</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 登录提交的表单 -->
	<div class="container" id="top">
		<div class="row" style="margin-top: 150px; ">
			<div class="col-md-4"></div>
			<div class="col-md-4" id="login-box">
				<form class="form-horizontal" role="form" action="${APP_PATH}/user/login.do" id="form_login_id"  method="post">
				  <div class="form-group">
				    <label for="firstname" class="col-sm-3 control-label">用户名</label>
				    <div class="col-sm-9">
				      <input type="text" class="form-control"  placeholder="请输入用户名" name="userName" id="empName_add_input">
				       <span id="span_login_id" class="help-block"></span>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="lastname" class="col-sm-3 control-label">密码</label>
				    <div class="col-sm-9">
				      <input type="password" class="form-control"  placeholder="请输入密码" name="password" id="pwd_add_input">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-3 col-sm-10">
				      <div class="checkbox">
				        <label class="radio-inline">
						  <input type="radio" name="roleId" id="inlineRadio1" value="1" checked="checked"> 管理员
						</label>
						<label class="radio-inline">
						  <input type="radio" name="roleId" id="inlineRadio2" value="2"> 员工
						</label>
						<label class="radio-inline">
						  <input type="radio" name="roleId" id="inlineRadio3" value="3"> 游客
						</label>
				      </div>
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-md-offset-6 col-md-10">
				      <button type="button" class="btn btn-default btn-info" id="btn_login" onclick = "loginPer();">登录</button>
				      <button type="button" class="btn btn-info" id="btn_register" >注册</button>
				    </div>
				  </div>
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>		
	</div>
	
	<script type="text/javascript">
		$(function() {
			//清空form
			reset_form("#form_login_id");
		});	
		
		//清空表单样式及内容
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		//===================================登录校验===========================================
		//显示校验结果的提示信息
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		//校验用户名是否可用
		$("#empName_add_input").change(function(){
			//发送ajax请求校验用户名是否可用
			var empName = this.value;
			$.ajax({
				url:"${APP_PATH}/user/checkuser",
				data:"empName="+empName,
				type:"POST",
				success:function(result){
					if(result.code==100){
						show_validate_msg("#empName_add_input","success","用户名存在");
						$("#emp_save_btn").attr("ajax-va","success");
					}else{
						show_validate_msg("#empName_add_input","error","用户名不存在");
						$("#emp_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		
		//=================================注册=================================================
			//点击注册按钮
		$("#btn_register").click(function() {
			//清空值表单
			reset_form("#registerModal form");
			//弹出模态框
			$("#registerModal").modal({
				backdrop:"static"
			});
		}); 
		
		//提交注册表单
		$("#btn_add_user").click(function() {
			//错误信息禁止提交
			if(!checkRegister()) {
				alert("请按提示输入正确信息!");
				return false;
			} 
			$.ajax({
				url : "${APP_PATH}/user/register",
				type : "POST",
				data : $("#registerModal form").serialize(),
				success : function(e) {
					if(e) {
						//后端校验
						if(e.code == 200) {	
							if(undefined != e.map.errorFields.userName){
								show_validate_msg("#userName_id", "error", e.map.errorFields.userName);
								alert("提交失败，用户名不可用");
							 }
							if(undefined != e.map.errorFields.password){
								show_validate_msg("#password_id", "error", e.map.errorFields.password);
								alert("提交失败，密码不可用");
							 }
							if(undefined != e.map.errorFields.email){
								alert("提交失败，邮箱不可用");
								show_validate_msg("#email_id", "error", e.map.errorFields.email);
							 }
							
						}else {
							alert("注册成功");
							//关闭模态框
							$("#registerModal").modal('hide')
						}
					}
				}
			});
		});
		//是否校验都通过
		function checkRegister() {
			if(!userNameCheck()){
				return false;
			}
			if(!pwdCheck()){
				return false;
			}
			if(!emailCheck()){
				return false;
			}
			return true;
		}
		//1、拿到要校验的数据，使用正则表达式
		function userNameCheck() {
			var empName = $("#userName_id").val();
			//var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			var regName = /(^[\u2E80-\u9FFF]{2,5}$)/;
			if(!regName.test(empName)){
				//alert("用户名为2-5位中文");
				show_validate_msg("#userName_id", "error", "用户名为2-5位中文");
				return false;
			}else{
				show_validate_msg("#userName_id", "success", "");
			};
			return true;
		}
		//2、校验密码
		function pwdCheck() {
			var pwd = $("#password_id").val();
			var regPwd=/^[A-Za-z]+[0-9]+[A-Za-z0-9]*|[0-9]+[A-Za-z]+[A-Za-z0-9]*$/g;
			if(!regPwd.test(pwd)) {
				show_validate_msg("#password_id", "error", "密码必须由6-16个英文字母和数字的字符串组成");
				return false;
			}else {
				show_validate_msg("#password_id", "success", "");
			}
			return true;
		}
		//3、校验邮箱信息
		function emailCheck() {
			
			var email = $("#email_id").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				show_validate_msg("#email_id", "error", "邮箱格式不正确");
				return false;
			}else{
				show_validate_msg("#email_id", "success", "");
			}
			return true;
		}
		$("#userName_id").change(function() {
			userNameCheck();
		});
		$("#password_id").change(function() {
			pwdCheck();
		});
		$("#email_id").change(function() {
			emailCheck();
		});
		//================================手动提交表单================================================
		function loginPer() {
			if($("#pwd_add_input").val() == '') {
				alert('请输入密码！');				
				return false;
			}
			if($("#span_login_id").text() == '用户名不存在') {
				alert('用户名有误！');
				return false;
			}
			
			$("#form_login_id").submit();			
		}	
			
			
			
			
			
			
			
	
	</script>
</body>
</html>