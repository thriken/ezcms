<%@ page language="java"  pageEncoding="GBK"%>
<%@ include file="function/checkLogin.jsp" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>后台管理 - EZCMS</title>
</head>
<frameset rows="40,*" cols="1024" frameborder="no" border="0" framespacing="0">
  <frame src="static/top.jsp" name="top" scrolling="no" noresize="noresize" id="top" title="topFrame" />
  <frameset cols="160,*" frameborder="no" border="0" framespacing="0">
    <frame src="static/left.jsp?m=index" name="left" scrolling="no" noresize="noresize" id="left" title="leftFrame"  />
    <frame src="static/main.jsp" name="main" id="main" title="mainFrame" />
  </frameset>
</frameset>
<noframes>
<body>
</body>
</noframes></html>

