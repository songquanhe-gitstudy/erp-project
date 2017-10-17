<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>招聘信息显示</title>
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
					    	<h1 class="col-md-5">招聘信息</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" id="form1" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入查找" name="findByName">
									<span class="input-group-addon btn" id="sub">搜索</span>
								</div>
							</form>

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
		 to_page(1);
		 
	 });
	 
	 	//分页跳到第几页
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/visitor/showInviterInfoJSON",
				data : "pn="+pn,
				type : "GET",
				success : function(e) {
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
				var inviteIdTd = $("<td></td>").append(item.inviteId);
				var nameTd = $("<td></td>").append(item.name);
				var jobPositionTd = $("<td></td>").append(item.jobPosition);
				var salaryTd = $("<td></td>").append(item.salary);
				var welfareTd = $("<td></td>").append(item.welfare);
				var addressTd = $("<td></td>").append(item.address);
				var requireTd = $("<td></td>").append(item.requires);
				
				
				/* 加到表格下的<tbody>里面  */
				$("<tr></tr>").append(inviteIdTd).append(nameTd).append(jobPositionTd)
				.append(salaryTd).append(welfareTd)
				.append(addressTd).append(requireTd)
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
		
		
		
		
		
		
		
		
		
	</script>
</html>