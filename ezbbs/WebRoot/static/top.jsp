<%@ page language="java" pageEncoding="GBK" import="java.util.*,ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%@page import="ezbbs.dao.ParentDao"%>
<%
	request.setCharacterEncoding("GBK"); // 设置字符集
%>
		<DIV id="logo">
			<table border=0 cellpadding="0" cellspacing="0">
			<tr>
				<td><IMG src="image/logo.gif" width="123" height="45"></td>
				<td><div style=" margin:0 20px 0 120px;" align="right">广告招商</div></td>
			</tr>
			</table>
		</DIV>
		<!--      用户信息、登录、注册        -->
		<%
			if (session.getAttribute("user") == null) {
		%>
		<DIV class="h">
			您尚未
			<a href="login.jsp">登录</a> &nbsp;| &nbsp;
			<A href="reg.jsp">注册</A> |
		</DIV>
		<%
			} else {
				User loginUser = (User) session.getAttribute("user");
		%>
		<DIV class="h">
			您好：
			<A href="myinfo.jsp"><%=loginUser.getUName()%></A> &nbsp;| &nbsp;<A href="manage/doLogout.jsp">登出</A> ‖ <a href="msg.jsp">短信息</a> &nbsp; <a href="users.jsp">查看会员信息</a> &nbsp;&nbsp;<a href="myinfo.jsp">浏览个人信息</a> &nbsp;&nbsp;<a href="updateuser.jsp">修改个人信息</a> &nbsp;&nbsp;<a href="updatepassword.jsp">修改密码</a>
		</DIV>
		<%
			}
		%>
		<div class="h">
			现在时间是：
			<%
			//定义日期的格式
			java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat(
					"yyyy年MM月dd日 HH:mm:ss");
			//产生日期并格式化
			String strCurrentTime = formater.format(new java.util.Date());
			// 输出日期、时间
			out.println(strCurrentTime);
		%>
		</div>
		<DIV>
		