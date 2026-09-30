<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="ezcms.dao.impl.*, ezcms.entity.*, java.util.*"%>
<%
if(session.getAttribute("Admin_Login") == null){ response.sendRedirect("../login.jsp"); return; }
request.setCharacterEncoding("UTF-8");
String op = request.getParameter("op");
String kw = request.getParameter("kw");
if("del".equals(op)){
    try { new NewsDaoImpl().delNews(Integer.parseInt(request.getParameter("nid"))); } catch(Exception e){}
}
List<News> list = new ArrayList<News>();
Map<Integer,String> clsMap = new HashMap<Integer,String>();
try {
    for(NewsClass c : new NewsClassDaoImpl().listAllClass()) clsMap.put(c.getClassId(), c.getName());
} catch(Exception e){}
try {
    NewsDaoImpl dao = new NewsDaoImpl();
    list = (kw != null && !kw.trim().isEmpty()) ? dao.searchNewsByTitleKeyword(kw.trim()) : dao.listNews();
} catch(Exception e){
    out.print("<div style='color:#e74c3c;padding:10px;'>读取新闻失败：" + e.getMessage() + "</div>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新闻列表 - EZCMS</title>
<link href="../static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1>新闻列表</h1>

    <form onsubmit="window.navigateTo('inc/news.jsp?kw=' + encodeURIComponent(this.kw.value)); return false;" style="margin-bottom:15px;">
        <input type="text" name="kw" class="form-control" style="width:280px; display:inline-block;" placeholder="按标题搜索" value="<%= kw!=null?kw:"" %>" />
        <button type="submit" class="btn btn-secondary" style="width:auto; padding:10px 20px;">搜索</button>
        <a class="btn" style="width:auto; padding:10px 20px;" href="javascript:void(0)" onclick="window.navigateTo('inc/addnews.jsp')">+ 添加新闻</a>
    </form>

    <table class="data-table">
        <thead>
            <tr><th>ID</th><th>标题</th><th>栏目</th><th>作者ID</th><th>发布时间</th><th>操作</th></tr>
        </thead>
        <tbody>
        <% if(list.isEmpty()){ %>
            <tr><td colspan="6" style="text-align:center; color:#999;">暂无新闻</td></tr>
        <% } for(News n : list){ %>
            <tr>
                <td><%= n.getNid() %></td>
                <td><%= n.getTitle()!=null?n.getTitle():"" %></td>
                <td><%= clsMap.get(n.getClassId())!=null?clsMap.get(n.getClassId()):("["+n.getClassId()+"]") %></td>
                <td><%= n.getAuthorId() %></td>
                <td><%= n.getPostTime()!=null?n.getPostTime():"" %></td>
                <td>
                    <a href="javascript:void(0)" onclick="window.navigateTo('inc/addnews.jsp?nid=<%= n.getNid() %>')">编辑</a>
                    &nbsp;|&nbsp;
                    <a href="javascript:void(0)" onclick="window.delItem('inc/news.jsp?op=del&nid=<%= n.getNid() %>','inc/news.jsp')">删除</a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
