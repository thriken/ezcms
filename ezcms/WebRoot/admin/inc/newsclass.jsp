<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="ezcms.dao.impl.*, ezcms.entity.*, java.util.*"%>
<%
if(session.getAttribute("Admin_Login") == null){ response.sendRedirect("../login.jsp"); return; }
request.setCharacterEncoding("UTF-8");
String op = request.getParameter("op");
String cidStr = request.getParameter("cid");
NewsClass edit = null;

if("POST".equalsIgnoreCase(request.getMethod()) && "save".equals(op)){
    try {
        NewsClassDaoImpl dao = new NewsClassDaoImpl();
        NewsClass c = new NewsClass(request.getParameter("name"),
                Integer.parseInt(request.getParameter("sort")),
                Integer.parseInt(request.getParameter("type")),
                request.getParameter("url"));
        if(cidStr != null && !cidStr.trim().isEmpty()){
            c.setClassId(Integer.parseInt(cidStr));
            dao.updateClass(c);
        } else {
            dao.addClass(c);
        }
        out.print("保存成功");
        return;
    } catch(Exception e){ out.print("保存失败：" + e.getMessage()); return; }
}
if("del".equals(op) && cidStr != null){
    try { new NewsClassDaoImpl().delClass(Integer.parseInt(cidStr)); } catch(Exception e){}
}
if(cidStr != null && !cidStr.trim().isEmpty()){
    try { edit = new NewsClassDaoImpl().getClassById(Integer.parseInt(cidStr)); } catch(Exception e){}
}

List<NewsClass> list = new ArrayList<NewsClass>();
try { list = new NewsClassDaoImpl().listAllClass(); } catch(Exception e){
    out.print("<div style='color:#e74c3c;padding:10px;'>读取栏目失败：" + e.getMessage() + "</div>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻栏目 - EZCMS</title>
<link href="../static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1>新闻栏目</h1>

    <div class="card">
        <div class="card-header"><h2 class="card-title"><%= edit!=null?"编辑栏目":"添加栏目" %></h2></div>
        <form method="post" action="inc/newsclass.jsp" onsubmit="return window.doSubmit(this,'inc/newsclass.jsp')">
            <input type="hidden" name="op" value="save" />
            <input type="hidden" name="cid" value="<%= cidStr!=null?cidStr:"" %>" />
            <div class="form-group">
                <label>栏目名称</label>
                <input type="text" name="name" class="form-control" required value="<%= edit!=null?edit.getName():"" %>" />
            </div>
            <div class="form-group">
                <label>排序</label>
                <input type="text" name="sort" class="form-control" value="<%= edit!=null?edit.getSort():9 %>" />
            </div>
            <div class="form-group">
                <label>类型（0=普通 1=外部链接）</label>
                <input type="text" name="type" class="form-control" value="<%= edit!=null?edit.getType():0 %>" />
            </div>
            <div class="form-group">
                <label>链接地址（type=1 时填写）</label>
                <input type="text" name="url" class="form-control" value="<%= edit!=null && edit.getUrl()!=null?edit.getUrl():"" %>" />
            </div>
            <div class="text-center">
                <button type="submit" class="btn" style="width:auto; padding:10px 30px;">保存</button>
                <% if(edit!=null){ %><a class="btn btn-secondary" style="width:auto; padding:10px 30px;" href="javascript:void(0)" onclick="window.navigateTo('inc/newsclass.jsp')">取消</a><% } %>
            </div>
        </form>
    </div>

    <h2>已有栏目</h2>
    <table class="data-table">
        <thead><tr><th>ID</th><th>名称</th><th>排序</th><th>类型</th><th>链接</th><th>操作</th></tr></thead>
        <tbody>
        <% if(list.isEmpty()){ %><tr><td colspan="6" style="text-align:center;color:#999;">暂无栏目</td></tr><% } %>
        <% for(NewsClass c : list){ %>
            <tr>
                <td><%= c.getClassId() %></td>
                <td><%= c.getName() %></td>
                <td><%= c.getSort() %></td>
                <td><%= c.getType()==1?"外部链接":"普通" %></td>
                <td><%= c.getUrl()!=null?c.getUrl():"" %></td>
                <td>
                    <a href="javascript:void(0)" onclick="window.navigateTo('inc/newsclass.jsp?cid=<%= c.getClassId() %>')">编辑</a>
                    &nbsp;|&nbsp;
                    <a href="javascript:void(0)" onclick="window.delItem('inc/newsclass.jsp?op=del&cid=<%= c.getClassId() %>','inc/newsclass.jsp')">删除</a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
