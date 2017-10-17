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
	<!-- 添加培训模态框 -->
	<div class="modal fade" id="add_invite_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">招聘添加</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" id="add_invite_form">
	          <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">招聘名称</label>
			   <div class="col-sm-6">
			   	   <input type="text" class="form-control" name="name"  id="add_name_id">
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">职位</label>
			   <div class="col-sm-6">
				   <select class="form-control" name="jobPosition" id="add_jobPosition_id">
				   </select>
				</div>
			  </div>
			   <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">薪资</label>
			   <div class="col-sm-6">
				   <select class="form-control" name="salary" id="add_salary_id">
				   	  <option value="2000-3000">2000-3000</option>
					  <option value="3000-4000">3000-4000</option>
					  <option value="4000-5000">4000-5000</option>
					  <option value="5000-10000">5000-10000</option>
					  <option value="10000以上">10000以上</option>
				   </select>
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">福利</label>
			   <div class="col-sm-6">
				   <input type="text" class="form-control" name="welfare"  id="add_welfare_id">
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">工作地址</label>
			   	 <div class="col-sm-6">
				   <input type="text" class="form-control" name="address"  id="add_address_id">
				 </div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">要求</label>
			   <div class="col-sm-6">
				   <textarea type="text" class="form-control" name="requires"  id="add_require_id"></textarea>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default modal_btn_invite_cancel" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="modal_btn_sure">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 修改招聘模态框 -->
	<div class="modal fade" id="update_invite_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">招聘修改</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" id="update_invite_form">
	          <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">招聘名称</label>
			   <div class="col-sm-6">
			   	   <input type="text" class="form-control" name="name"  id="update_name_id">
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">职位</label>
			   <div class="col-sm-6">
				   <select class="form-control" name="jobPosition" id="update_jobPosition_id">
				   </select>
				</div>
			  </div>
			   <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">薪资</label>
			   <div class="col-sm-6">
				   <select class="form-control" name="salary" id="update_salary_id">
				   	  <option value="2000-3000">2000-3000</option>
					  <option value="3000-4000">3000-4000</option>
					  <option value="4000-5000">4000-5000</option>
					  <option value="5000-10000">5000-10000</option>
					  <option value="10000以上">10000以上</option>
				   </select>
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">福利</label>
			   <div class="col-sm-6">
				   <input type="text" class="form-control" name="welfare"  id="update_welfare_id">
				</div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">工作地址</label>
			   	 <div class="col-sm-6">
				   <input type="text" class="form-control" name="address"  id="update_address_id">
				 </div>
			  </div>
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">要求</label>
			   <div class="col-sm-6">
				   <textarea type="text" class="form-control" name="requires"  id="update_require_id"></textarea>
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
					    	<h1 class="col-md-5">招聘信息</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;"  id="form_invit" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入查找" name="findByName">
									<span class="input-group-addon btn" onclick="search_invite()" id="sub">搜索</span>
								</div>
							</form>
							<div style="right: 0px">
								<button type="button" class="btn btn-primary add_invite_btn">
								 <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加
								</button>
							</div>
						</div>
				    </div>
				    <table class="table table-bordered" id="table_id">
					        <thead>
					            <tr>
					            	<th>序号</th>
									<th>招聘名称</th>
									<th>工作岗位</th>
									<th>薪资</th>
									<th>福利</th>
									<th>地址</th>
									<th>要求</th>
									<th>修改信息</th>
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
	//最后一页
	var totalPage;
	//当前页面
	var currentPage;
	 $(function() {
		 //页面跳转
		 to_page(1);
	 });
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/inviter/showInviterInfoJSON/"+pn,
				data : $("#form_invit").serialize(),
				type : "GET",
				success : function(e) {
					if(e) {
						var ele = e.map.pageInfo;
						console.log(ele);
						//填充表格
						table_data(ele);
						//填充分页信息
						pager_data(ele);
						//填充分页导航信息
						nav_data(ele);
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
				var inviteIdTd = $("<td></td>").append(item.inviteId);
				var nameTd = $("<td></td>").append(item.name);
				var jobPositionTd = $("<td></td>").append(item.jobPosition);
				var salaryTd = $("<td></td>").append(item.salary);
				var welfareTd = $("<td></td>").append(item.welfare);
				var addressTd = $("<td></td>").append(item.address);
				var requireTd = $("<td></td>").append(item.requires);
				//更新按钮
				 var updateBtn = $("<button></button>").addClass("btn btn-info btn-sm btn_update")
					.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
				 updateBtn.attr("invite_id", item.inviteId);
					var updateTd = $("<td></td>").append(updateBtn);
				 //删除按钮
				 var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm btn_del")
						.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
						deleteBtn.attr("invite_id", item.inviteId).attr("invite_name",item.name);
						var deleteTd = $("<td></td>").append(deleteBtn);
				
				/* 加到表格下的<tbody>里面  */
				$("<tr></tr>").append(inviteIdTd).append(nameTd).append(jobPositionTd)
				.append(salaryTd).append(welfareTd)
				.append(addressTd).append(requireTd).append(updateTd).append(deleteTd)
				.appendTo("#table_id tbody")
			});
			
		}
		
		/* 填充分页信息 */
		function pager_data(e) {
			//清空分页信息
			$("#page_id").empty();
			$("#page_id").append($("<strong></strong>")
			  .append("当前是第"+e.pageNum+"页,共"+e.pages
					  +"页,共"+e.total+"条记录"));
			totalPage = e.total + 1;
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
		 $(".add_invite_btn").click(function() {
			 //拿到部门
			 geDept_data();
			 //弹出模态框
			 $("#add_invite_modal").modal({
				 backdrop : "static"
			 });
		 });
		 
		//先拿到职位中的数据
		function geDept_data() {
			$("#add_jobPosition_id").empty();
			$.ajax({
				url : "${APP_PATH}/deptPost/getPosts",
				type : "GET",
				success : function(data) {
					//遍历数据添加option
					var list = data.map.postList;
					$.each(list, function(index, item) {
							var optionOp = $("<option></option>").append(item.postName).attr("value", item.postName);
							optionOp.appendTo("#add_jobPosition_id");
					});
				}
			});
		}
		//点击确认按钮
		$("#modal_btn_sure").click(function() {
			//提交表单
			$.ajax({
				url : "${APP_PATH}/inviter/addInvite",
				type : "POST",
				data : $("#add_invite_form").serialize(),
				success : function(data) {
					if(data) {
						alert("添加成功！")
						to_page(totalPage);
						$("#add_invite_modal").modal('hide');
						//清除表单中缓存的数据
						$("#add_jobPosition_id").val('');
						$("#add_welfare_id").val('');
						$("#add_address_id").val('');
						$("#add_require_id").val('');
					}
				}
			});
		});
		
		//========================================删除=====================================================
		$(document).on("click", ".btn_del", function() {
			var inviteName = $(this).attr("invite_name")
			if(confirm("确认删除主题【"+ inviteName +"】这个招聘信息吗？")) {
				$.ajax({
					url : "${APP_PATH}/inviter/delInvite/"+$(this).attr("invite_id"),
					success : function() {
						//跳回当前页面
						to_page(currentPage);
					}
				});
			}
		});
		
		//=======================================修改===================================================
		$(document).on("click", ".btn_update", function() {
		//拿到部门
		 geDept_data2();
		//拿到当前招聘的信息
		get_currnet_invite($(this).attr("invite_id"));
		//给模态框确认按钮赋值
		$("#update_modal_btn_sure").attr("invite_id", $(this).attr("invite_id"));
		//弹出模态框
		$("#update_invite_modal").modal({
			backdrop : "static"
		});
	});
	//拿到当前招聘的信息
	function get_currnet_invite(id) {
		$.ajax({
			url : "${APP_PATH}/inviter/findById/"+id,
			type : "GET",
			success : function(data) {
				if(data) {
					console.log("++++++++++++");
					console.log(data);
					var entity = data.map.list;
					//把信息填充到表单
					$("#update_name_id").val(entity.name);
					$("#update_jobPosition_id").val([entity.jobPosition]);
					$("#update_salary_id").val([entity.salary]);
					$("#update_welfare_id").val(entity.welfare);
					$("#update_address_id").val(entity.address);
					$("#update_require_id").val(entity.requires);
				}
			}
		});
	}
	
	//先拿到dept中的数据
	function geDept_data2() {
		$("#update_jobPosition_id").empty();
		$.ajax({
			url : "${APP_PATH}/deptPost/getPosts",
			type : "GET",
			success : function(data) {
				//遍历数据添加option
				var list = data.map.postList;
				$.each(list, function(index, item) {
						var optionOp = $("<option></option>").append(item.postName).attr("value", item.postName);
						optionOp.appendTo("#update_jobPosition_id");
				});
			}
		});
	}
	
	//点击更新确认按钮
	$("#update_modal_btn_sure").click(function() {
		console.log($(this).attr("invite_id"))
		$.ajax({
			url : "${APP_PATH}/inviter/updateInvite/"+$(this).attr("invite_id"),
			type : "POST",
			data : $("#update_invite_form").serialize(),
			success : function(data) {
				if(data) {
					alert("更新成功！");
					//关闭模态框
					$("#update_invite_modal").modal('hide');
					to_page(currentPage);
				}
			}
		});
	});
	
	//=====================================模糊查询=========================================================
	function search_invite() {
		to_page(1);
	}
		
		
		
	</script>
</html>