<%@ page language="java" pageEncoding="GBK"
	import="java.util.*,ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%
	request.setCharacterEncoding("GBK"); // 设置字符集
	UserDao userDao = new UserDaoImpl(); // 得到用户Dao的实例
%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>浏览会员信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<Link rel="stylesheet" type="text/css" href="style/style.css" />
	</head>
	<body style="width: 1000px">
		<DIV>&nbsp;<IMG src="image/logo.gif"></DIV>
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
			<A href="myinfo.jsp"><%=loginUser.getUName()%></A>
			&nbsp;| &nbsp;
			<A href="manage/doLogout.jsp">登出</A> |
		</DIV>
		<%
			}
		%>

		<!--      导航        -->
		<br />
		<DIV>
			&gt;&gt;
			<B><a href="index.jsp">论坛首页</a> </B>&gt;&gt;浏览会员信息
		</DIV>
		<br />
		<DIV class="t">
			<TABLE cellSpacing="0" cellPadding="0" border="0" width="98%">
				<TR>
					<TH style="WIDTH: 97%; font-size: 18px; height: 15px" colSpan="6">
						<SPAN>所有用户信息</SPAN>
					</TH>
				</TR>
				<TR class="tr2">
					<TD style="WIDTH: 10%" align="center">用户ID编号</TD>
					<TD style="WIDTH: 20%" align="center">用户名</TD>
					<TD style="WIDTH: 10%" align="center">性别</TD>
					<TD style="WIDTH: 30%" align="center">注册时间</TD>
					<TD style="WIDTH: 30%" align="center">会员头像</TD>
				</TR>
				<!--         用 户 列 表        -->
				<%
					List listUser = userDao.findListUser();
					for (int i = 0; i < listUser.size(); i++) {
						User user = (User) listUser.get(i);
				%>

				<TR class="tr3" style="FONT-SIZE: 15px">
					<TD align="center"><%=user.getUId()%></TD>
					<TD align="center"><a href="userinfo.jsp?uname=<%=user.getUName() %>"><%=user.getUName() %></a></TD>
					<TD align="center">
						<%
							if (user.getGender() == 1)
									out.println("女");
								else
									out.println("男");
						%>
					</TD>
					<TD align="center"><%=user.getRegTime()%></TD>
					<TD align="center"><img src="image/head/<%=user.getHead()%>" /></TD>
					<%
						}
					%>
				</TR>
			</TABLE>
		</DIV>

		<!--             声 明          -->
		<BR />
		<center class="gray">
			2011 <a href="http://023sc.info" target="_blank">爱源码网</a> &copy;版权所有
		</center>

	</body>
</html>
