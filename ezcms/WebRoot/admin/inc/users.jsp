<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="ezcms.dao.impl.*, ezcms.entity.*, java.util.*"%>
<%
if(session.getAttribute("Admin_Login") == null){ response.sendRedirect("../login.jsp"); return; }
request.setCharacterEncoding("UTF-8");
String op = request.getParameter("op");
if("del".equals(op)){
    try { new AdminDaoImpl().delAdmin(Integer.parseInt(request.getParameter("id"))); } catch(Exception e){}
}
List<Admin> list = new ArrayList<Admin>();
try { list = new AdminDaoImpl().listAdmin(); } catch(Exception e){
    out.print("<div style='color:#e74c3c;padding:10px;'>读取管理员失败：" + e.getMessage() + "</div>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表 - EZCMS</title>
<link href="../static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1>管理员列表</h1>
    <a class="btn" style="width:auto; padding:10px 24px; margin-bottom:15px;" href="javascript:void(0)" onclick="window.navigateTo('inc/adduser.jsp')">+ 添加管理员</a>
    <table class="data-table">
        <thead><tr><th>ID</th><th>账号</th><th>操作</th></tr></thead>
        <tbody>
        <% if(list.isEmpty()){ %><tr><td colspan="3" style="text-align:center;color:#999;">暂无管理员</td></tr><% } %>
        <% for(Admin a : list){ %>
            <tr>
                <td><%= a.getId() %></td>
                <td><%= a.getAdmin() %></td>
                <td>
                    <a href="javascript:void(0)" onclick="window.delItem('inc/users.jsp?op=del&id=<%= a.getId() %>','inc/users.jsp')">删除</a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
