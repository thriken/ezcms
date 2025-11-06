<%@ page language="java" pageEncoding="GBK"
	import="ezbbs.entity.*"%>
<%
	request.setCharacterEncoding("GBK"); // 设置字符集
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

		<title>论坛--看贴</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<Link rel="stylesheet" type="text/css" href="style/style.css" />
	</head>

	<BODY>
		<div>
			<DIV>
				<IMG src="image/logo.gif">
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
				<B><a href="index.jsp">论坛首页</a> </B>&gt;&gt;修改个人信息
			</DIV>
			<br />
			<%
				User loginUser = (User) session.getAttribute("user");
			%>
			<!--      用户修改        -->
			<DIV class="t" style="MARGIN-TOP: 15px" align="center">
				<FORM name="regForm" action="manage/doUpdateuser.jsp" method="post">
					<br />
					<div>
						用&nbsp;户&nbsp;ID编号 &nbsp;
						<%=loginUser.getUId()%>
					</div>
					<br />
					用&nbsp;户&nbsp;名 &nbsp;
					<INPUT class="input" tabIndex="1" type="text" maxLength="20"
						size="35" name="uName" value="<%=loginUser.getUName()%>">
					<br />
					性别 &nbsp; 女
					<input type="radio" name="gender" value="1">
					男
					<input type="radio" name="gender" value="2" checked="checked" />
					<br />
				请选择头像
				<br />
				<img src="image/head/1.gif" />
				<input type="radio" name="head" value="1.gif" checked="checked">
				<img src="image/head/2.gif" />
				<input type="radio" name="head" value="2.gif">
				<img src="image/head/3.gif" />
				<input type="radio" name="head" value="3.gif">
				<img src="image/head/4.gif" />
				<input type="radio" name="head" value="4.gif">
				<img src="image/head/5.gif" />
				<input type="radio" name="head" value="5.gif">
				<BR />
				<img src="image/head/6.gif" />
				<input type="radio" name="head" value="6.gif">
				<img src="image/head/7.gif" />
				<input type="radio" name="head" value="7.gif">
				<img src="image/head/8.gif" />
				<input type="radio" name="head" value="8.gif">
				<img src="image/head/9.gif" />
				<input type="radio" name="head" value="9.gif">
				<img src="image/head/10.gif" />
				<input type="radio" name="head" value="10.gif">
				<BR />
				<img src="image/head/11.gif" />
				<input type="radio" name="head" value="11.gif">
				<img src="image/head/12.gif" />
				<input type="radio" name="head" value="12.gif">
				<img src="image/head/13.gif" />
				<input type="radio" name="head" value="13.gif">
				<img src="image/head/14.gif" />
				<input type="radio" name="head" value="14.gif">
				<img src="image/head/15.gif" />
				<input type="radio" name="head" value="15.gif">
				<br />
					<p />
					<INPUT class="btn" tabIndex="4" type="submit" value="修 改">
					<INPUT class="btn" tabIndex="4" type="reset" value="重 置">
				</FORM>
			</DIV>
			<!--      声明        -->
			<BR />
		<CENTER class="gray">
			2011 <a href="http://023sc.info" target="_blank">爱源码网</a> &copy;版权所有
		</CENTER>
	</BODY>
</HTML>

