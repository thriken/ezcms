<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="ezcms.dao.impl.*, ezcms.entity.*, java.util.*"%>
<%
if(session.getAttribute("Admin_Login") == null){ response.sendRedirect("../login.jsp"); return; }
request.setCharacterEncoding("UTF-8");
String nidStr = request.getParameter("nid");
News n = null;
List<NewsClass> classes = new ArrayList<NewsClass>();
try { classes = new NewsClassDaoImpl().listAllClass(); } catch(Exception e){}

if("POST".equalsIgnoreCase(request.getMethod())){
    try {
        NewsDaoImpl dao = new NewsDaoImpl();
        int classId = Integer.parseInt(request.getParameter("classId"));
        String title = request.getParameter("title");
        String content = request.getParameter("newsContent");
        String desc = request.getParameter("description");
        String postTime = request.getParameter("postTime");
        if(postTime == null || postTime.trim().isEmpty())
            postTime = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
        int authorId = 1;
        try { authorId = Integer.parseInt(request.getParameter("authorId")); } catch(Exception e){}
        if(nidStr != null && !nidStr.trim().isEmpty()){
            News e2 = new News(classId, title, content, desc, postTime, authorId);
            e2.setNid(Integer.parseInt(nidStr));
            dao.updateNews(e2);
        } else {
            dao.addNews(new News(classId, title, content, desc, postTime, authorId));
        }
        out.print("保存成功");
        return;
    } catch(Exception e){
        out.print("保存失败：" + e.getMessage());
        return;
    }
}
if(nidStr != null && !nidStr.trim().isEmpty()){
    try { n = new NewsDaoImpl().getNewsById(Integer.parseInt(nidStr)); } catch(Exception e){}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= n!=null?"编辑新闻":"添加新闻" %> - EZCMS</title>
<link href="../static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1><%= n!=null?"编辑新闻":"添加新闻" %></h1>
    <form method="post" action="inc/addnews.jsp" onsubmit="return window.doSubmit(this,'inc/news.jsp')">
        <input type="hidden" name="nid" value="<%= nidStr!=null?nidStr:"" %>" />
        <div class="form-group">
            <label>所属栏目</label>
            <select name="classId" class="form-control">
                <% for(NewsClass c : classes){ %>
                <option value="<%= c.getClassId() %>" <%= (n!=null && n.getClassId()==c.getClassId())?"selected":"" %>><%= c.getName() %></option>
                <% } %>
            </select>
        </div>
        <div class="form-group">
            <label>标题</label>
            <input type="text" name="title" class="form-control" required value="<%= n!=null && n.getTitle()!=null?n.getTitle():"" %>" />
        </div>
        <div class="form-group">
            <label>简介/描述</label>
            <input type="text" name="description" class="form-control" value="<%= n!=null && n.getDescription()!=null?n.getDescription():"" %>" />
        </div>
        <div class="form-group">
            <label>发布时间</label>
            <input type="text" name="postTime" class="form-control" placeholder="留空则使用当前时间" value="<%= n!=null && n.getPostTime()!=null?n.getPostTime():"" %>" />
        </div>
        <div class="form-group">
            <label>作者ID</label>
            <input type="text" name="authorId" class="form-control" value="<%= n!=null?n.getAuthorId():1 %>" />
        </div>
        <div class="form-group">
            <label>正文内容</label>
            <textarea name="newsContent" class="form-control" rows="10"><%= n!=null && n.getNewsContent()!=null?n.getNewsContent():"" %></textarea>
        </div>
        <div class="form-group text-center">
            <button type="submit" class="btn" style="width:auto; padding:12px 40px;">保存</button>
            <a class="btn btn-secondary" style="width:auto; padding:12px 40px;" href="javascript:void(0)" onclick="window.navigateTo('inc/news.jsp')">返回列表</a>
        </div>
    </form>
</div>
</body>
</html>
