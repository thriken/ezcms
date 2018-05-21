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
		window.location.reload();
	</script>
</div>
</body>
</html>
<% 
	response.sendRedirect("../static/main.jsp");
%>