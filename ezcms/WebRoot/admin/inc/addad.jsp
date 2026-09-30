<%@ page language="java" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("Admin_Login") == null){ response.sendRedirect("../login.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加广告 - EZCMS</title>
<link href="../static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1>添加广告（占位）</h1>
    <div class="card">
        <p>广告模块尚未接入数据库，以下表单为 UI 占位，提交不会落库。</p>
        <form onsubmit="alert('广告模块待接入数据库'); return false;">
            <div class="form-group"><label>广告标题</label><input type="text" class="form-control" /></div>
            <div class="form-group"><label>图片地址</label><input type="text" class="form-control" /></div>
            <div class="form-group"><label>链接地址</label><input type="text" class="form-control" /></div>
            <div class="form-group"><label>排序</label><input type="text" class="form-control" value="9" /></div>
            <div class="text-center"><button type="submit" class="btn" style="width:auto; padding:12px 40px;">保存（占位）</button></div>
        </form>
    </div>
</div>
</body>
</html>
