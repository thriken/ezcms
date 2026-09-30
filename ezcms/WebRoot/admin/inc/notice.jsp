<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="ezcms.dao.impl.*, ezcms.entity.*, java.util.*"%>
<%
if(session.getAttribute("Admin_Login") == null){ response.sendRedirect("../login.jsp"); return; }
request.setCharacterEncoding("UTF-8");
String op = request.getParameter("op");
if("del".equals(op)){
    try { new NoticeDaoImpl().delNotice(Integer.parseInt(request.getParameter("id"))); } catch(Exception e){}
}
List<Notice> list = new ArrayList<Notice>();
try { list = new NoticeDaoImpl().listNotice(); } catch(Exception e){
    out.print("<div style='color:#e74c3c;padding:10px;'>读取公告失败：" + e.getMessage() + "</div>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>公告列表 - EZCMS</title>
<link href="../static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1>公告列表</h1>
    <a class="btn" style="width:auto; padding:10px 24px; margin-bottom:15px;" href="javascript:void(0)" onclick="window.navigateTo('inc/addnotice.jsp')">+ 添加公告</a>
    <table class="data-table">
        <thead><tr><th>ID</th><th>标题</th><th>内容</th><th>发布时间</th><th>操作</th></tr></thead>
        <tbody>
        <% if(list.isEmpty()){ %><tr><td colspan="5" style="text-align:center;color:#999;">暂无公告</td></tr><% } %>
        <% for(Notice t : list){ %>
            <tr>
                <td><%= t.getId() %></td>
                <td><%= t.getTitle()!=null?t.getTitle():"" %></td>
                <td style="max-width:420px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;"><%= t.getNotice()!=null?t.getNotice():"" %></td>
                <td><%= t.getPostTime()!=null?t.getPostTime():"" %></td>
                <td>
                    <a href="javascript:void(0)" onclick="window.navigateTo('inc/addnotice.jsp?id=<%= t.getId() %>')">编辑</a>
                    &nbsp;|&nbsp;
                    <a href="javascript:void(0)" onclick="window.delItem('inc/notice.jsp?op=del&id=<%= t.getId() %>','inc/notice.jsp')">删除</a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
