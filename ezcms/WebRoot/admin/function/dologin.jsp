<%@ page language="java" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String username = request.getParameter("u");
String pass = request.getParameter("p");
session.setAttribute("Admin_Login",username);
%>
<html>
<body>
<div>
<script type="text/javascript">
    // 跳转顶层窗口到登录页面
    top.location.href = "../index.jsp";
</script>
</div>
</body>
</html>
