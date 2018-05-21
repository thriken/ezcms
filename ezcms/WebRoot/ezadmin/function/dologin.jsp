<%@ page language="java" pageEncoding="GBK"%>
<%
request.setCharacterEncoding("GBK");
String username = request.getParameter("user");
String pass = request.getParameter("pwd");
out.print(username+pass);
session.setAttribute("Admin_Login",username);
%>
<html>
<body>
<div>
	<script type="text/javascript">
		window.location.reload();
	</script>
</div>
</body>
</html>
<% 
	response.sendRedirect("../main.html");
%>