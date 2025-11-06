<%@ page language="java" pageEncoding="GB18030"%>
<%
request.setCharacterEncoding("GBK");
String username = request.getParameter("u");
String pass = request.getParameter("p");
out.print(username+pass);
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
