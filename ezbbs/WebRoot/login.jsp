<%@ page language="java" pageEncoding="GBK" import="ezbbs.entity.*"%>
<%
	request.setCharacterEncoding("GBK");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
	<HEAD>
		<TITLE>论坛--登录</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<Link rel="stylesheet" type="text/css" href="style/style.css" />
		<script language="javascript">
function check() {
 if(document.loginForm.uName.value==""){
    alert("用户名不能为空");
    return false;
 }
 if(document.loginForm.uPass.value==""){
    alert("密码不能为空");
    return false;
 }
}
</script>
	</HEAD>

	<BODY>
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

		<BR />
		<!--      导航        -->
		<DIV>
			&gt;&gt;
			<B><a href="index.jsp">论坛首页</a> </B>
		</DIV>
		<!--      用户登录表单        -->
		<DIV class="t" style="MARGIN-TOP: 15px" align="center">
			<FORM name="loginForm" onSubmit="return check()"
				action="manage/doLogin.jsp" method="post">
				<br />
				用户名&nbsp;
				<INPUT class="input" tabIndex="1" type="text" maxLength="20"
					size="35" name="uName" />
				<br />
				密&nbsp;&nbsp;码&nbsp;
				<INPUT class="input" tabIndex="2" type="password" maxLength="20"
					size="40" name="uPass" />
				<br />
				<INPUT class="btn" tabIndex="6" type="submit" value="登 录">
			</FORM>
		</DIV>
		<!--      声明        -->
		<BR />
		<CENTER class="gray">
			Powered By <a href="http://023sc.info" target="_blank">爱源码网</a> &copy; 版权所有 2011
		</CENTER>
	</BODY>
</HTML>
