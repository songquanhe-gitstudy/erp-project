<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>我的消息</title>
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
	<!-- 面试消息提示框 -->
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
					    	<h1 class="col-md-5">消息中心</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" action="/admin/selectCourse" id="form1" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入查找" name="findByName">
									<span class="input-group-addon btn" onclick="document.getElementById('form1').submit" id="sub">搜索</span>
								</div>
							</form>

						</div>
				    </div>
				    <table class="table table-bordered" id="table_id">
					        <thead>
					            <tr>
					            	<th>序号</th>
									<th>消息类型</th>
									<th>发送人</th>
									<th>消息内容</th>
									<th>消息时间</th>
									<th>操作时间</th>
									<th>消息状态</th>
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
		 message_handle();
			/*  //传值给menu页面显示消息数量
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
		        });  */
		 to_page(1);
		 
	 });
	 //消息处理
	 function message_handle() {
		 var InterViewMessage = ${InterViewMessage}
		 if(InterViewMessage > 0) {
			 //填充提示信息
			 var message = $("<h4></h4>")
				.append("您有"+InterViewMessage+"条面试消息!")
				.appendTo("#modal_train_id")
			 //弹出模态框
			 $("#message_modal").modal({
				 backdrop : "static"
			 });
		 }
	 }
	 
	 	//分页跳到第几页
		function to_page(pn) {
			$.ajax({
				url : "${APP_PATH}/newMessage/getNewMessageData/"+pn,
				type : "GET",
				success : function(e) {
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
				var messageIdTd = $("<td></td>").append(item.messageId);
				var typeTd = $("<td></td>").append(item.type);
				var senderTd = $("<td></td>").append(item.sender);
				var contentTd = $("<td></td>").append(item.content);
				var createTimeTd = $("<td></td>").append(item.createTime);
				var appointedtimeTd = $("<td></td>").append("面试时间："+item.appointedtime);
				if(item.messageState == 0) {
					var messageStateTd = $("<td></td>").append("已查看");
				}else {
					var messageStateTd = $("<td></td>").append("最新");
				}
				
				
				/* 加到表格下的<tbody>里面  */
				$("<tr></tr>").append(messageIdTd).append(typeTd).append(senderTd).append(contentTd)
				.append(createTimeTd).append(appointedtimeTd).append(messageStateTd)
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