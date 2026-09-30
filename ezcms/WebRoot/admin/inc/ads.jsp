<%@ page language="java" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("Admin_Login") == null){ response.sendRedirect("../login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>广告列表 - EZCMS</title>
<link href="../static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1>广告列表</h1>
    <div class="card">
        <div class="card-header"><h2 class="card-title">功能占位</h2></div>
        <p>广告模块后端尚未建表（数据库暂无广告数据表），此页面为占位。</p>
        <p>如需启用，请先创建广告表（如 <code>ez_Ad(id, title, pic, url, sort)</code>），并在
           <code>ezcms.dao</code> 下补充对应的 DAO 实现，再接入本页面。</p>
        <p style="color:#999;">当前数据库已有数据表：ez_Admin / ez_Author / ez_News / ez_NewsClass / ez_Notice / ez_SiteInfo。</p>
        <a class="btn" style="width:auto; padding:10px 24px;" href="javascript:void(0)" onclick="window.navigateTo('inc/addad.jsp')">+ 添加广告（占位）</a>
    </div>
</div>
</body>
</html>
