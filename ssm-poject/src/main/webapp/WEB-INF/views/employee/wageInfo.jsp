<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>薪资信息</title>
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
	<div class="modal fade" id="wage_state_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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

	<!-- 复议模态框 -->
	<div class="modal fade" id="add_reConsider_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">复议</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" method="post" id="update_wage_form">
			  <div class="form-group">
			   <label for="inputEmail3" class="col-sm-2 control-label">复议内容</label>
			   <div class="col-sm-6">
				   <textarea type="text" class="form-control" name="descript"  id="reason_add_id"></textarea>
				</div>
			  </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default " data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" id="add_reConsider_sure">确定</button>
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
					    	<h1 class="col-md-5">薪资信息</h1>
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
				    </div>
				    <table class="table table-bordered" id="table_id">
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
									<th>流程状态</th>
									<th>薪资复议</th>
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
				url : "${APP_PATH}/wage/getUserWage/"+pn,
				type : "GET",
				success : function(e) {
					if(e) {
						var e = e.map.pageInfo;
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
					//复议按钮
					var reConsiderBtn = $("<button></button>").addClass("btn btn-danger btn-sm btn_wage_reConsider")
					.append($("<span></span>").addClass("glyphicon glyphicon-tags")).append(" ").append("薪资复议");
					reConsiderBtn.attr("wage_id", item.wageId);
					var considerTd = $("<td></td>").append(reConsiderBtn);
				}else if(item.state == 1) {
					var stateTd = $("<td></td>").append("申请复议中");
					//复议按钮
					var reConsiderBtn = $("<button></button>").addClass("btn btn-danger btn-sm btn_wage_reConsider")
					.append($("<span></span>").addClass("glyphicon glyphicon-tags")).append(" ").append("薪资复议");
					reConsiderBtn.attr("wage_id", item.wageId).attr("disabled", true);
					var considerTd = $("<td></td>").append(reConsiderBtn);
				}else if(item.state == 2) {
					var stateTd = $("<td></td>").append("复议完成");
					//复议按钮
					var reConsiderBtn = $("<button></button>").addClass("btn btn-danger btn-sm btn_wage_reConsider")
					.append($("<span></span>").addClass("glyphicon glyphicon-tags")).append(" ").append("薪资复议");
					reConsiderBtn.attr("wage_id", item.wageId);
					var considerTd = $("<td></td>").append(reConsiderBtn);
				}
				//状态按钮
				var stateBtn = $("<button></button>").addClass("btn btn-warning btn-sm btn_state_job")
				.append($("<span></span>").addClass("glyphicon glyphicon-stats")).append("状态");
				stateBtn.attr("wage_id", item.wageId);
				var chanstate = $("<td></td>").append(stateBtn);
				
				/* 加到表格下的<tbody>里面  */
				$("<tr></tr>").append(wageIdTd).append(yearsTd).append(monthsTd)
				.append(baseWageTd).append(perfWageTd)
				.append(ovWageTd).append(rapWageTd).append(jinpoWageTd)
				.append(totalWageTd).append(stateTd).append(chanstate).append(considerTd)
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
		
		//点击复议按钮
		$(document).on("click", ".btn_wage_reConsider", function() {
			//给复议确认按钮添加id
			$("#add_reConsider_sure").attr("wage_id", $(this).attr("wage_id"));
			//弹出复议模态框
			$("#add_reConsider_modal").modal({
				backdrop : 'static'
			});
		});
		
		//点击复议模态框中的确认按钮
		$("#add_reConsider_sure").click(function() {
			if($("#reason_add_id").val() == '') {
				alert("请填写复议内容");
				return false;
			}
			$.ajax({
				url : "${APP_PATH}/wage/updateUserWage/"+$(this).attr("wage_id"),
				data : $("#update_wage_form").serialize(),
				type : "post",
				success : function(data) {
					if(data) {
						alert("提交成功！");
						//关闭模态框
						$("#add_reConsider_modal").modal('hide');
						//跳到当前页面
						to_page(currentPage);
					}
				}
			});
		});
		
		//======================================流程状态==========================================================
		$(document).on("click", ".btn_state_job", function() {
			//状态数据填充
			fill_state_info($(this).attr("wage_id"));
			//弹出模态框
			$("#wage_state_modal").modal({
				backdrop : "static"
			});
		});
	
		//填充数据
		function fill_state_info(wage_id) {
			$("#table_flow_id tbody").empty();
			$.ajax({
				url : "${APP_PATH}/wageFlow/getFlowData/"+wage_id,
				type : "GET",
				success : function(data) {
					if(data) {
						console.log(data);
						var list = data.map.wfList;
						$.each(list, function(index, item) {
							var stateTd = $("<td></td>").append(item.flowId);
							var resumeIdTd = $("<td></td>").append(item.wageId);
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
		
		
		
		
		
	</script>
</html>