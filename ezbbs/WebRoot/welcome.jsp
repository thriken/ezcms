<%@ page language="java" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎访问我的网站</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	欢迎访问我的网站<BR/>
  	现在时间是：
<%
    //定义日期的格式
    java.text.SimpleDateFormat formater = new   java.text.SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
    //产生日期并格式化
    String strCurrentTime = formater.format( new java.util.Date( ) ); 
    // 输出日期、时间
    out.println(strCurrentTime); 
%>
		<CENTER class="gray">
			2011 <a href="http://023sc.info" target="_blank">爱源码网</a> &copy;版权所有
		</CENTER>
  </body>
</html>
