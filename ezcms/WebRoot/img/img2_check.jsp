<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>认证码验证页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache"> 
<META HTTP-EQUIV="Expires" CONTENT="0"> 
</head>

<body>
<%
		String rand = (String) session.getAttribute("randnum");
		String input = request.getParameter("randnum");
%>	
		生成的认证码是：
		<%=rand%><br>
		您输入的认证码为：
		<%=input%><br>
		<br>
		<%
			if (rand.equals(input)) {
		%>
		<font color=green>输入相同，认证成功！</font>
		<%
			} else {
		%>
		<font color=red>输入不同，认证失败！</font>
		<%
			}
		%>
	</body>
</html>