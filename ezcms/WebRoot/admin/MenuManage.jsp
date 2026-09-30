<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
if(session.getAttribute("Admin_Login") == null){
    response.sendRedirect("login.jsp");
    return;
}
String m = request.getParameter("m");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>    
    <title>菜单管理 - EZCMS</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
  
<body>
<div class="admin-main-content slide-in-left">
    <h1>菜单管理</h1>
    <div class="card">
        <p>菜单管理已整合进后台统一框架（见左侧「菜单管理」）。</p>
        <p>本页为独立入口占位，推荐通过 <a href="index.jsp">后台首页</a> 进入左侧菜单进行操作。</p>
        <table class="data-table">
            <thead><tr><th>层级</th><th>说明</th></tr></thead>
            <tbody>
                <tr><td>主菜单</td><td>顶部主导航：首页 / 公告 / 新闻 / 用户 / 广告 / 菜单管理</td></tr>
                <tr><td>子菜单</td><td>由 static/left.jsp 按主菜单动态渲染，指向各功能页</td></tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
