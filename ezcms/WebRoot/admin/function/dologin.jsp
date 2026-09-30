<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="ezcms.dao.impl.AdminDaoImpl, ezcms.entity.Admin, ezcms.utils.MD5"%>
<%
request.setCharacterEncoding("UTF-8");
String username = request.getParameter("u");
String pass = request.getParameter("p");
String msg = "用户名或密码错误";
boolean ok = false;
if(username != null && pass != null && !username.trim().isEmpty()){
    try{
        AdminDaoImpl dao = new AdminDaoImpl();
        Admin a = dao.getAdminByName(username.trim());
        if(a != null){
            String pwd = a.getPassword();
            // 兼容明文存储与 MD5 存储两种密码
            if(pwd.equals(pass) || pwd.equals(MD5.MD5(pass))){
                session.setAttribute("Admin_Login", username.trim());
                ok = true;
            }
        }
    }catch(Exception e){
        msg = "数据库错误：" + e.getMessage();
    }
}
if(ok){
    response.sendRedirect("index.jsp");
}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录失败 - EZCMS</title>
<link href="static/css/admin-main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="login-container">
    <div class="login-form fade-in">
        <div class="login-header">
            <h2>登录失败</h2>
            <p><%= msg %></p>
        </div>
        <div class="text-center">
            <a class="btn" href="javascript:history.back()">返回登录</a>
        </div>
    </div>
</div>
</body>
</html>
<%
}
%>
