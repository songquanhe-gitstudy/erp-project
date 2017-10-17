<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>培训信息</title>
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
					    	<h1 class="col-md-5">培训信息</h1>
							<form class="bs-example bs-example-form col-md-5" role="form" style="margin: 20px 0 10px 0;" id="train_form" method="post">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="请输入培训名称查找" name="findByName">
									<span class="input-group-addon btn" onclick="search_train()" id="sub">搜索</span>
								</div>
							</form>
						</div>
				    </div>
				    <table class="table table-bordered" id="table_id">
					        <thead>
					            <tr>
				            	  <th>序号</th>
								  <th>培训名称</th>
								  <th>培训部门</th>
								  <th>培训人</th>
								  <th>培训时间</th>
								  <th>培训内容</th>
								  <th>培训状态</th>
								  <th>培训考试</th>
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
	//当前页
	var currentPage;
	 $(function() {
		 //取培训表中的数据
		 to_page(1);
	 });
	 
	 function to_page(pn) {
		 $.ajax({
			 url : "${APP_PATH}/train/empTrainManage/"+pn,
			 tape : "GET",
			 success :function(data) {
				 $("#table_id tbody").empty();
				 if(data) {
					 console.log("----data----")
					 console.log(data)
					 var list = data.map.pageInfo.list;
					 console.log(list)
					 $.each(list, function(index, item) {
						 var trainIdTd = $("<td></td>").append(item.trainId);
						 var trainNameTd = $("<td></td>").append(item.trainName);
						 var trainDeptTd = $("<td></td>").append(get_dept_name(item.deptId));
						 var nameEmpTd = $("<td></td>").append(get_emp_name(item.uid));
						 
						 var trainTimeTd = $("<td></td>").append(item.trainTime);
						 var trainContentTd = $("<td></td>").append(item.trainContent);
						 if(get_train_state(item.trainTime) == "培训未开始") {
						 	var trainstateTd = $("<td></td>")
						 	.append(get_train_state(item.trainTime))
						 	.css('background-color', '#F4CCB2') ;
						 	//培训考试按钮
							 var examBtn = $("<button></button>").addClass("btn btn-default btn-sm")
									.append($("<span></span>").addClass("glyphicon glyphicon-list-alt")).append("未开始");
									 examBtn.attr("train_id", item.trainId).attr("train_name",item.trainName).attr("disabled", true);
									var examTd = $("<td></td>").append(examBtn);
						 }else if(get_train_state(item.trainTime) == '培训进行中') {
							 var trainstateTd = $("<td></td>")
							 	.append(get_train_state(item.trainTime))
							 	.css('background-color', '#FB304F') ;
							//培训考试按钮
							 var examBtn = $("<button></button>").addClass("btn btn-info btn-sm btn_exam_send")
									.append($("<span></span>").addClass("glyphicon glyphicon-list-alt")).append("发试卷");
									 examBtn.attr("train_id", item.trainId).attr("train_name",item.trainName);
									var examTd = $("<td></td>").append(examBtn);
						 }else if (get_train_state(item.trainTime) == '培训已结束') {
							 var trainstateTd = $("<td></td>")
							 	.append(get_train_state(item.trainTime))
							 	.css('background-color', '#CAC5C5') ;
							//培训考试按钮
							 var examBtn = $("<button></button>").addClass("btn btn-default btn-sm")
									.append($("<span></span>").addClass("glyphicon glyphicon-list-alt")).append("已结束");
									 examBtn.attr("train_id", item.trainId).attr("train_name",item.trainName).attr("disabled", true);
									var examTd = $("<td></td>").append(examBtn);
						 }
						 
						 //放入tbody中
						 var tTr = $("<tr></tr>").append(trainIdTd).append(trainNameTd)
						 						.append(trainDeptTd).append(nameEmpTd)
						 						.append(trainTimeTd).append(trainContentTd)
						 						.append(trainstateTd).append(examTd)
						 						.appendTo("#table_id tbody");
					 });
				 }
				//填充分页信息
				pager_data(data.map.pageInfo);
				//填充分页导航信息
				nav_data(data.map.pageInfo);
			 }
		 });
	 }
	 
	 //获取培训状态
	 function get_train_state(time) {
		 var date = new Date();
		 var month = date.getMonth()+1;
		 var myDate=date.getFullYear()+"-"+month+"-"+date.getDate()+"";
		 //myDate = new Date(Date.parse(myDate.replace(/-/g, "/")));
		 
		 var toDateTime = Date.parse(new Date(myDate));
		 var trainTime = Date.parse(new Date(time));
		 if(toDateTime < trainTime) {
			 return "培训未开始";
		 }else if(toDateTime == trainTime) {
			 return "培训进行中";
		 }else if(toDateTime > trainTime){
			 return "培训已结束";
		 }
		 
	 }
	 
	 //获取培训人名称
	 function get_emp_name(uid) {
		 var name = '';
		 $.ajax({
			 url : "${APP_PATH}/user/getEmpNameById/"+uid,
			 async : false,
			 success : function(data) {
				 if(data) {
					 var entity = data.map.entity;
					 name = entity.userName;
				 }
			 }
		 });
		 return name;
	 }
	 
	 //获取部门名称
	 function get_dept_name(id) {
		 var deptName='';
		if(id != 0 && id != null) {
			$.ajax({
				url : "${APP_PATH}/deptPost/getDeptBydID/"+id,
				type : "GET",
				async:false,
				success : function(data) {
					deptName = data.map.list.deptName;
				}
			});
		}
		return deptName;
	 }
	 
	 /* 填充分页信息 */
		function pager_data(e) {
			//清空分页信息
			$("#page_id").empty();
			$("#page_id").append($("<strong></strong>")
			  .append("当前是第"+e.pageNum+"页,共"+e.pages
					  +"页,共"+e.total+"条记录"));
			totalPage = e.total+1;
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
	
	
	//=====================================模糊查询=========================================================
	function search_train() {
		to_page(1);
	}
	
	//=======================================发试卷======================================================
	$(document).on("click", ".btn_exam_send", function() {
		//判断该培训的试题是否发放
		var count = '';
		console.log("==");
		console.log($(this).attr("train_id"));
		$.ajax({
			url : "${APP_PATH}/trainExam/ifSendExam/"+$(this).attr("train_id"),
			async : false,
			success : function(data) {
				if(data) {
					count = data.code;
					console.log(data)
					if(data.code == 100) {
						alert("试题已经发放！");
					}
				}
			}
		});
		
		if(count == 100) {
			return false;
		}
		
		//请求发试卷
		if(confirm("确认下发试题吗？")) {
			$.ajax({
				url : "${APP_PATH}/trainExam/sendTrainExam",
				data : "trainId="+ $(this).attr("train_id"),
				success : function(data) {
					var count = data.map.teCount;
					if(count == 5) {
						alert("试题发放成功！");
					}else {
						alert("试题不够，请去数据库t_train_exam表添加试题");
					}
					to_page(currentPage);
				}
			});
		}
		
	});
	
	
	
	 
	</script>
</html>