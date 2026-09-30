<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="ezcms.dao.impl.*, ezcms.entity.*, java.util.*"%>
<%
if(session.getAttribute("Admin_Login") == null){ response.sendRedirect("../login.jsp"); return; }
request.setCharacterEncoding("UTF-8");
String idStr = request.getParameter("id");
Notice t = null;

if("POST".equalsIgnoreCase(request.getMethod())){
    try {
        NoticeDaoImpl dao = new NoticeDaoImpl();
        Notice n = new Notice(request.getParameter("title"), request.getParameter("notice"),
                new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()));
        if(idStr != null && !idStr.trim().isEmpty()){
            n.setId(Integer.parseInt(idStr));
            dao.updateNotice(n);
        } else {
            dao.addNotice(n);
        }
        out.print("保存成功");
        return;
    } catch(Exception e){ out.print("保存失败：" + e.getMessage()); return; }
}
if(idStr != null && !idStr.trim().isEmpty()){
    try { t = new NoticeDaoImpl().getNoticeById(Integer.parseInt(idStr)); } catch(Exception e){}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= t!=null?"编辑公告":"添加公告" %> - EZCMS</title>
<link href="../static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1><%= t!=null?"编辑公告":"添加公告" %></h1>
    <form method="post" action="inc/addnotice.jsp" onsubmit="return window.doSubmit(this,'inc/notice.jsp')">
        <input type="hidden" name="id" value="<%= idStr!=null?idStr:"" %>" />
        <div class="form-group">
            <label>标题</label>
            <input type="text" name="title" class="form-control" required value="<%= t!=null && t.getTitle()!=null?t.getTitle():"" %>" />
        </div>
        <div class="form-group">
            <label>公告内容</label>
            <textarea name="notice" class="form-control" rows="8" required><%= t!=null && t.getNotice()!=null?t.getNotice():"" %></textarea>
        </div>
        <div class="text-center">
            <button type="submit" class="btn" style="width:auto; padding:12px 40px;">保存</button>
            <a class="btn btn-secondary" style="width:auto; padding:12px 40px;" href="javascript:void(0)" onclick="window.navigateTo('inc/notice.jsp')">返回列表</a>
        </div>
    </form>
</div>
</body>
</html>
