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
					    	<h1 class="col-md-5">奖惩信息</h1>
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
									<th>类型</th>
									<th>金额</th>
									<th>原因</th>
									<th>创建时间</th>
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
				url : "${APP_PATH}/rap/getUserRecords",
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
				var typeTd = $("<td></td>").append(item.type);
				var moneyTd = $("<td></td>").append(item.money);
				var reasonTd = $("<td></td>").append(item.reason);
				var createTimeTd = $("<td></td>").append(item.createTime);
				
				
				/* 加到表格下的<tbody>里面  */
				$("<tr></tr>").append(rapIdTd).append(yearsTd).append(monthsTd)
				.append(typeTd).append(moneyTd)
				.append(reasonTd).append(createTimeTd)
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
				url : "${APP_PATH}/rap/getDateRecords/"+pn,
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
				var typeTd = $("<td></td>").append(item.type);
				var moneyTd = $("<td></td>").append(item.money);
				var reasonTd = $("<td></td>").append(item.reason);
				var createTimeTd = $("<td></td>").append(item.createTime);
				
				
				/* 加到表格下的<tbody>里面  */
				$("<tr></tr>").append(rapIdTd).append(yearsTd).append(monthsTd)
				.append(typeTd).append(moneyTd)
				.append(reasonTd).append(createTimeTd)
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
		
		
		
		
		
		
		
		
	</script>
</html>