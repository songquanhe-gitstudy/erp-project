<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<% 
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav">
        <li><a href="./showViMessageInfo">我的消息<span class="badge pull-right">8</span></a></li>
        <li><a href="./showInviterInfo">招聘信息<span class="badge pull-right">23</span></a></li>
        <li><a href="./inviterWrite">简历管理<span class="badge pull-right">5</span></a></li>
        <li><a href="${APP_PATH}/login.jsp">退出系统<sapn class="glyphicon glyphicon-log-out pull-right" /></a></li>
        <li class="disabled"><a href="##">^-^</a></li>
    </ul>
</div>