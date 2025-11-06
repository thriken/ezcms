<%@ page language="java" pageEncoding="GBK"
	import="java.util.*,ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*,java.sql.*"%>
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
<%
	User user = (User) session.getAttribute("user");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script language="javascript">
function check() {
 if(document.modifyForm.olduPass.value!=user.getUPass()){
    alert("旧密码不对");
    return false;
 }
 if(document.modifyForm.uPass.value==""){
    alert("密码不能为空");
    return false;
 }
 if(document.modifyForm.uPass.value != document.modifyForm.uPass1.value){
    alert("2次密码不一样");
    return false;
 }
}
</script>
		<base href="<%=basePath%>">

		<title>用户修改密码</title>

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
				<B><a href="index.jsp">论坛首页</a> </B>&gt;&gt;修改密码
			</DIV>
			<br />

			<!--      用户修改        -->
			<%
				User loginUser = (User) session.getAttribute("user");
			%>
			<DIV class="t" style="MARGIN-TOP: 15px" align="center">
				<FORM name="modifyForm" onSubmit="return check()"
					action="manage/doUpdatePassword.jsp" method="post">
					<br />
					用&nbsp;户&nbsp;名 &nbsp;
					<%=loginUser.getUName()%>
					<br />
					旧&nbsp;密&nbsp;码 &nbsp;
					<INPUT class="input" tabIndex="1" type="password" maxLength="20"
						size="40" name="olduPass">
					<br />
					新&nbsp;密&nbsp;码 &nbsp;
					<INPUT class="input" tabIndex="2" type="password" maxLength="20"
						size="40" name="uPass">
					<br />
					确认密码 &nbsp;
					<INPUT class="input" tabIndex="3" type="password" maxLength="20"
						size="40" name="uPass1">

					<br />
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

