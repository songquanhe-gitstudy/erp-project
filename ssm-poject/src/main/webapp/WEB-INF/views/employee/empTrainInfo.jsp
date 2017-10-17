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

	<!-- 考试模态框 -->
	<div class="modal fade" id="train_exam_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="span_state">考试</h4>
	      </div>
	      <div class="modal-body">
	        <table class="table table-bordered" id="table_flow_id">
		        <thead>
		            <tr>
	            	  <th>题号</th>
					  <th>内容</th>
					  <th>A选项</th>
					  <th>B选项</th>
				      <th>C选项</th>
				      <th>D选项</th>
				      <th>答案</th>
		            </tr>
		        </thead>
		        <tbody>
		        </tbody>
		    </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary modal_btn_sure" >提交</button>
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
								  <th>考试成绩</th>
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
			 url : "${APP_PATH}/train/empTrainInfo/"+pn,
			 async: false,
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
								 var examBtn = $("<button></button>").addClass("btn btn-info btn-sm btn_exam_write")
										.append($("<span></span>").addClass("glyphicon glyphicon-list-alt")).append("考试");
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
						 if(item.trainGradeEntity == null) {
							 var gradeTd = $("<td></td>").append("无");
						 }else {
							 var gradeTd = $("<td></td>").append(item.trainGradeEntity.grade+"分");
							//培训考试按钮
							 var examBtn = $("<button></button>").addClass("btn btn-info btn-sm btn_exam_write")
									.append($("<span></span>").addClass("glyphicon glyphicon-list-alt")).append("已考");
									 examBtn.attr("train_id", item.trainId).attr("train_name",item.trainName).attr("disabled", true);
									var examTd = $("<td></td>").append(examBtn);
							var trainstateTd = $("<td></td>")
						 	.append("培训已完成")
						 	.css('background-color', '#F5AFAF') ;
						 }
						 
						 //放入tbody中
						 var tTr = $("<tr></tr>").append(trainIdTd).append(trainNameTd)
						 						.append(trainDeptTd).append(nameEmpTd)
						 						.append(trainTimeTd).append(trainContentTd)
						 						.append(trainstateTd).append(gradeTd).append(examTd)
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
	
	//=======================================考试========================================================
	$(document).on("click", ".btn_exam_write", function() {
		//判断试卷是否发放,如果发放填充试题数据
		$(".modal_btn_sure").attr("train_id", $(this).attr("train_id"));
		var count = '';
		$("#table_flow_id tbody").empty();
		$.ajax({
			url : "${APP_PATH}/trainExam/ifSendExam/"+$(this).attr("train_id"),
			async : false,
			success : function(data) {
				if(data) {
					count = data.code;
					console.log(data)
					if(data.code == 200) {
						alert("试题还未发放！");
						return false;
					}
					var list = data.map.teList;
					$.each(list, function(index, item) {
						var indexTd = $("<td></td>").append(index+1);
						var examTitleTd = $("<td></td>").append(item.examTitle);
						var aOptionTd = $("<td></td>").append(item.aOption);
						var bOptionTd = $("<td></td>").append(item.bOption);
						var cOptionTd = $("<td></td>").append(item.cOption);
						var dOptionTd = $("<td></td>").append(item.dOption);
						var selectTd = $("<td></td>").append($("<select></select>")
								.append($("<option></option>").append("A").attr("value","A"))
								.append($("<option></option>").append("B").attr("value","B"))
								.append($("<option></option>").append("C").attr("value","C"))
								.append($("<option></option>").append("D").attr("value","D"))
								.attr("id", "option" + index));
						var trueOptionTd = $("<td></td>").append(item.trueOption).attr("style","display:none").attr("id", "td"+index);
						$("<tr></tr>").append(indexTd).append(examTitleTd).append(aOptionTd)
									  .append(bOptionTd).append(cOptionTd).append(dOptionTd)
									  .append(selectTd).append(trueOptionTd)
									  .appendTo("#table_flow_id tbody");
					});
				}
			}
		});
		if(count == 100) {
			//弹出模态框
			$("#train_exam_modal").modal({
				backdrop : 'static'
			});
			
		}
	});
	
	//点击确认按钮
	$(".modal_btn_sure").click(function() {
		console.log("---==");
		var grade = 0;
		
		for(var i = 0; i < 5; i++) {
			if($("#option"+i).val() == $("#td"+i).text()) {
				grade+=20;	
			}
		}
		if(confirm("确认提交吗？一旦提交不可更改！")) {
			//请求数据把成绩传到后台
			$.ajax({
				url : "${APP_PATH}/trainExam/updateTrainGrade/"+$(this).attr("train_id"),
				data : {
					'grade' : grade
				},
				success : function(data) {
					if(data) {
						alert("提交成功！")
						//关闭模态框
						$("#train_exam_modal").modal('hide');
						to_page(1);
					}
				}
			});
		}
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
	</script>
</html>