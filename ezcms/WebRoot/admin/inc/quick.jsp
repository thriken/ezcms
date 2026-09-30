<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="ezcms.dao.impl.*, ezcms.entity.*, java.util.*"%>
<%
if(session.getAttribute("Admin_Login") == null){ response.sendRedirect("../login.jsp"); return; }
request.setCharacterEncoding("UTF-8");
int newsCount = 0, noticeCount = 0, classCount = 0, adminCount = 0;
try { newsCount = new NewsDaoImpl().listNews().size(); } catch(Exception e){}
try { noticeCount = new NoticeDaoImpl().listNotice().size(); } catch(Exception e){}
try { classCount = new NewsClassDaoImpl().listAllClass().size(); } catch(Exception e){}
try { adminCount = new AdminDaoImpl().listAdmin().size(); } catch(Exception e){}
String admin = (String)session.getAttribute("Admin_Login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>控制台 - EZCMS</title>
<link href="../static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1>控制台</h1>
    <p>欢迎回来，<strong style="color:#3498db"><%= admin %></strong>！以下是站点概况。</p>

    <div style="display:grid; grid-template-columns:repeat(auto-fit,minmax(180px,1fr)); gap:15px; margin:20px 0;">
        <div class="card" style="text-align:center;">
            <div style="font-size:32px; font-weight:bold; color:#3498db;"><%= newsCount %></div>
            <div class="card-title">新闻总数</div>
        </div>
        <div class="card" style="text-align:center;">
            <div style="font-size:32px; font-weight:bold; color:#2ecc71;"><%= noticeCount %></div>
            <div class="card-title">公告总数</div>
        </div>
        <div class="card" style="text-align:center;">
            <div style="font-size:32px; font-weight:bold; color:#e67e22;"><%= classCount %></div>
            <div class="card-title">新闻栏目</div>
        </div>
        <div class="card" style="text-align:center;">
            <div style="font-size:32px; font-weight:bold; color:#e74c3c;"><%= adminCount %></div>
            <div class="card-title">管理员</div>
        </div>
    </div>

    <div class="card">
        <div class="card-header"><h2 class="card-title">快捷入口</h2></div>
        <ul style="list-style:none; padding:0; display:grid; grid-template-columns:repeat(auto-fit,minmax(200px,1fr)); gap:12px;">
            <li><a class="btn" href="javascript:void(0)" onclick="window.navigateTo('inc/addnews.jsp')">发布新闻</a></li>
            <li><a class="btn btn-secondary" href="javascript:void(0)" onclick="window.navigateTo('inc/addnotice.jsp')">发布公告</a></li>
            <li><a class="btn btn-secondary" href="javascript:void(0)" onclick="window.navigateTo('inc/newsclass.jsp')">管理栏目</a></li>
            <li><a class="btn btn-secondary" href="javascript:void(0)" onclick="window.navigateTo('inc/users.jsp')">管理员</a></li>
        </ul>
    </div>
</div>
</body>
</html>
