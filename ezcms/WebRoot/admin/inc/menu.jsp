<%@ page language="java" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("Admin_Login") == null){ response.sendRedirect("../login.jsp"); return; }
String op = request.getParameter("op");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>菜单管理 - EZCMS</title>
<link href="../static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1>菜单管理</h1>

    <% if("addmain".equals(op)){ %>
    <div class="card">
        <div class="card-header"><h2 class="card-title">添加主菜单（占位）</h2></div>
        <p>主菜单结构对应 <code>ezcms.entity.MainMenu</code> / <code>ManageMenu</code>，相关 DAO 实现已存在（LeftMenuDaoImpl / ManageMenuDaoImpl）。</p>
        <form onsubmit="alert('菜单保存功能待接入'); return false;">
            <div class="form-group"><label>菜单名称</label><input type="text" class="form-control" /></div>
            <div class="form-group"><label>排序</label><input type="text" class="form-control" value="9" /></div>
            <div class="text-center"><button type="submit" class="btn" style="width:auto; padding:10px 30px;">保存（占位）</button></div>
        </form>
    </div>
    <% } else if("addsub".equals(op)){ %>
    <div class="card">
        <div class="card-header"><h2 class="card-title">添加子菜单（占位）</h2></div>
        <form onsubmit="alert('子菜单保存功能待接入'); return false;">
            <div class="form-group"><label>所属主菜单</label><input type="text" class="form-control" /></div>
            <div class="form-group"><label>子菜单名称</label><input type="text" class="form-control" /></div>
            <div class="form-group"><label>链接地址</label><input type="text" class="form-control" /></div>
            <div class="text-center"><button type="submit" class="btn" style="width:auto; padding:10px 30px;">保存（占位）</button></div>
        </form>
    </div>
    <% } else { %>
    <div class="card">
        <div class="card-header"><h2 class="card-title">后台导航结构</h2></div>
        <p>当前后台导航由 <code>static/left.jsp</code> 渲染，结构如下（功能均已接数据或占位）：</p>
        <ul style="line-height:2;">
            <li><strong>首页</strong>：快捷选项（控制台）、欢迎页</li>
            <li><strong>公告</strong>：公告列表、添加公告</li>
            <li><strong>新闻</strong>：新闻列表、新闻栏目、添加新闻</li>
            <li><strong>用户</strong>：用户列表、添加用户</li>
            <li><strong>广告</strong>：广告列表（占位）、添加广告（占位）</li>
            <li><strong>菜单管理</strong>：本页（占位）</li>
        </ul>
    </div>
    <% } %>
</div>
</body>
</html>
