<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="ezbbs.dao.impl.*" %>
<%@ page import="ezbbs.dao.*" %>
<%@ page import="ezbbs.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setCharacterEncoding("GBK");
	MessageDao mDao= new MessageDaoImpl();
	Message msg = null ;
	int mid =0;
	if(request.getParameter("mid") == null){
	%>
		<script type="text/javascript">
	<!--
			alert("指令错误，请返回！");
			location.href="javascript:history.back(-1)";
	//-->
	</script>>	
	<%
	}else{
	mid = Integer.parseInt(request.getParameter("mid"));
	}
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>" />
    <title>阅读短消息</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<Link rel="stylesheet" type="text/css" href="style/style.css" />
	<script type="text/javascript" language="javascript">
		function tip(){
			alert("消息阅读错误，请返回");
			location.href="javascript:history.back(-1)";
		}
	</script>
  </head>
  <body>
  <%@ include file="static/top.jsp" %>
  <%
  	if(session.getAttribute("user") == null){
  			%><br />
	<div class="t" style="padding: 20px 0;margin:0 10% ">
		<center> 现在就去 <a href="login.jsp">登录</a> ！</center>
	</div> <br />
	<%
  	}else{
   %><br />
  <span style="margin:0 0 0 15%;font-size:14px;">阅读短消息</span>
  <div id="content" class="t" style="height:200px;width:60%;padding:2% 5%;">
	<%
		if(mid == 0){
	 %>  
	 <script>tip()</script>
	 <%
	 	}else{
	 	msg = new Message();
	 	msg = mDao.findMsg(mid);
	 	mDao.readMsg(msg);
	 	if(msg != null){
	 		if(msg.getNote().length() > 60){
	 			msg.setNote(msg.getNote().substring(0,60)+"<br />"+msg.getNote().substring(60));
	 		}
	  %>
   <table align="left" style="text-align: center;">
   		<tr class="h">
   			<td align="center" width="80px;">来自：</td>
   			<td width="600px;">
   				<div style="margin:1px auto auto 1px;"><%=msg.getSendUname() %>&nbsp;&nbsp;&nbsp;&nbsp;<%=msg.getPostTime() %></div>
   			</td>
   		</tr>
   		<tr class="h">
   			<td align="center">内容：</td>
   			<td height="150px"><%=msg.getNote() %></td>
   		</tr>
   		<tr class="h">
   			<td>&nbsp;</td>
   			<td>[ <a href="msg.jsp?mod=send&uname=<%=msg.getSendUname() %>">回复</a> ]&nbsp;&nbsp;[ <a href="manage/doMsg.jsp?mod=del&mid=<%=mid %>">删除</a> ]&nbsp;&nbsp; [ <a href="javascript:history.back(-1)">返回</a> ]</td>
   		</tr>
   </table>
   <%
   		 	}else{
   		 	%>
   		 		<script>tip()</script>	
   		 	<%
   		 	}
   	}
   	}
    %>
   </div>
   <%@ include file="static/bottom.jsp" %>
  </body>
</html>
