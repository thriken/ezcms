<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<% /****** 菜单管理 ******/ %>
<%
request.setCharacterEncoding("GBK");
String m = request.getParameter("m");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>    
    <title>菜单管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
</head>
  
<body>
<table border="1">
	<tr>
		<td>
			<div style="height:500px;width:80px;">
				主菜单
			</div>	
		</td>
		<td>
			<div style="height:500px;width:600px;">
				子菜单
			</div>	
		</td>
	</tr>
</table>
</body>
</html>
