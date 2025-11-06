<%@ page language="java" pageEncoding="GBK" import="ezbbs.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";

	request.setCharacterEncoding("GBK");
	String url = "index.jsp";
	if(request.getParameter("ref") != null){
		url = request.getQueryString().replaceAll(basePath,"");
		url = url.replaceAll("ref=","");
	}
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
<div><IMG src="image/logo.gif"></div>
<!--      用户信息、登录、注册        -->
<%
	if (session.getAttribute("user") == null) {
	%>
	<div class="h">您尚未<a href="login.jsp">登录</a> &nbsp;| &nbsp;<A href="reg.jsp">注册</A> |</div>
	<%
		} else {
			User loginUser = (User) session.getAttribute("user");
			if(loginUser != null){
	%>
	<script type="text/javascript">
		alert("你已登陆，无需再次登陆！");
		location.href="index.jsp";
	</script>
	<%
		}
	%>
		<div class="h">您好：<A href="myinfo.jsp"><%=loginUser.getUName()%></A>&nbsp;| &nbsp;<A href="manage/doLogout.jsp">登出</A> 		</div>
	<%
		}
		%>

		<BR />
<!--      导航        -->
		<div>&gt;&gt;<B><a href="index.jsp">论坛首页</a> </B></div>
		<!--      用户登录表单        -->
		<div class="t" style="MARGIN-TOP: 15px" align="center">
			<FORM name="loginForm" onSubmit="return check()" action="manage/doLogin2.jsp" method="post">
				<INPUT name="ref" type="hidden" value="<%=url %>">
				<div>
					<span>用户名&nbsp;</span><input class="input" tabIndex="1" type="text" maxLength="20" name="uName" /><br/>
				</div>
				<div><span>密&nbsp;&nbsp;码&nbsp;</span><input class="input" tabIndex="2" type="password" maxLength="20" name="uPass" /></div>
				<div><input class="btn" tabIndex="6" type="submit" value="登 录"></div>
			</FORM>
		</div>
		<!--      声明        -->
		<BR />
<%@ include file="static/bottom.jsp" %>
	</BODY>
</HTML>
