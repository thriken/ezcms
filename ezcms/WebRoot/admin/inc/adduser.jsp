<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="ezcms.dao.impl.*, ezcms.entity.*, ezcms.utils.MD5, java.util.*"%>
<%
if(session.getAttribute("Admin_Login") == null){ response.sendRedirect("../login.jsp"); return; }
request.setCharacterEncoding("UTF-8");

if("POST".equalsIgnoreCase(request.getMethod())){
    try {
        String admin = request.getParameter("admin");
        String pwd = request.getParameter("password");
        if(admin == null || admin.trim().isEmpty() || pwd == null || pwd.trim().isEmpty()){
            out.print("账号和密码不能为空"); return;
        }
        new AdminDaoImpl().addAdmin(new Admin(admin.trim(), MD5.MD5(pwd)));
        out.print("保存成功");
        return;
    } catch(Exception e){ out.print("保存失败：" + e.getMessage()); return; }
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加管理员 - EZCMS</title>
<link href="../static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1>添加管理员</h1>
    <form method="post" action="inc/adduser.jsp" onsubmit="return window.doSubmit(this,'inc/users.jsp')">
        <div class="form-group">
            <label>账号</label>
            <input type="text" name="admin" class="form-control" required maxlength="12" />
        </div>
        <div class="form-group">
            <label>密码</label>
            <input type="password" name="password" class="form-control" required />
        </div>
        <div class="text-center">
            <button type="submit" class="btn" style="width:auto; padding:12px 40px;">保存</button>
            <a class="btn btn-secondary" style="width:auto; padding:12px 40px;" href="javascript:void(0)" onclick="window.navigateTo('inc/users.jsp')">返回列表</a>
        </div>
    </form>
</div>
</body>
</html>
