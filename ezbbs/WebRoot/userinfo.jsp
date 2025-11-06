<%@ page language="java" pageEncoding="UTF-8" import="ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	request.setCharacterEncoding("GBK"); // 设置字符集
	UserDao userDao = new UserDaoImpl(); // 得到用户Dao的实例
	String uname = null ;
	if(request.getParameter("uname")!= null){
		uname = request.getParameter("uname");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>论坛 &gt; &gt; 用户信息  &gt; &gt; <%=uname %></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
</head>
<body>
	<div>&nbsp;<IMG src="image/logo.gif"></div>
	<!--      用户信息、登录、注册        -->
	<%
			if (session.getAttribute("user") == null) {
		%>
		<script> alert("你还没有登录!"); </script>
		<div class="h">您尚未<a href="login.jsp">登录</a> &nbsp;| &nbsp;<A href="reg.jsp">注册</A> |</div>
		<%
			} else {
				User loginUser = (User) session.getAttribute("user");
		%>
		<div class="h">
			您好：<A href="myinfo.jsp"><%=loginUser.getUName()%></A>&nbsp;| &nbsp;<A href="manage/doLogout.jsp">登出</A> |
		</div>
		<%
			}
	%>

	<!--      导航        --><br />
	<div>&gt;&gt;<B><a href="index.jsp">论坛首页</a> </B>&gt;&gt;浏览个人信息</div><br />
	<!--         个 人 信 息 列 表        -->
	<%
		if (session.getAttribute("user") == null) {
		%>
		<br /><div class="t" style="padding: 20px 0;margin:0 10% "><center> 现在就去 <a href="login.jsp">登录</a> ！</center></div> <br />
		<%
		}else{
			if(request.getParameter("uname") != null){
				User findUser = userDao.findUser(uname);
				if(findUser != null ){
					int uId = findUser.getUId();
					User user = userDao.findUser(uId);
		%>
		<div class="t">
			<TABLE cellSpacing="0" cellPadding="0" border="0">
				<tr>
					<td class="tabccc"><div style="font-size: 18px; height: 15px" align="center"><b>&nbsp;</b></div></td>
					<td class="tabccc"><div style="font-size: 18px; height: 15px" align="center"><b>会员资料</b></div></td>
				</tr>
				<tr>
					<td class="tabccc">
						<div align="center"><a href="index.jsp">进入论坛首页</a></div><br/>
						<div align="center"><a href="msg.jsp?mod=send&uname=<%=user.getUName() %>">发送消息</a></div>
					</td>
					<td class="tabccc">
						<TABLE cellSpacing="0" cellPadding="0" border="0" style="color: #cccccc">
							<TR class="tr2">
								<TD align="center">ID编号</TD>
								<TD class="black" id="tabccc-left"><%=user.getUId()%></TD>
							</TR>
							<tr class="tr2">
								<TD align="center">用&nbsp;户&nbsp;名</td>
								<TD class="black" id="tabccc-left"><%=user.getUName()%></TD>
							</tr>
							<tr class="tr2">
								<TD align="center">性&nbsp;&nbsp;&nbsp;&nbsp;别</td>
								<TD class="black" id="tabccc-left">
									<%
										if (user.getGender() == 1)
											out.println("女");
										else
											out.println("男");
									%>
								</TD>
							</tr>
							<tr class="tr2">
								<TD align="center">注册时间</td>
								<TD class="black" id="tabccc-left"><%=user.getRegTime()%></TD>
							</tr>
							<tr class="tr2">
								<TD align="center">个人头像</td>
								<TD id="tabccc-left"><img src="image/head/<%=user.getHead()%>" /></TD>
							</tr>
							<tr class="tr2">
								<TD align="center">等级</td>
								<TD class="black" id="tabccc-left"><%=user.getUlevel()%></TD>
							</tr>
							<tr class="tr2">
								<TD align="center">论坛职务</td>
								<TD class="black" id="tabccc-left">
								<%
									if(user.getUmanage()==null){
										user.setUmanage("无");
									}
								 %>
								<%=user.getUmanage()%>
								</TD>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<% 
				}else{
				%>
				<div align="center" class="t" style="padding:10px;margin:0 5%;">
					查不到用户 [ <%=uname %> ] ，请<a href="javascript:history.back(-1)">返回</a>！
				</div>
				<%
				}
			}else{
				%>
				<script type="text/javascript">
					alert("错误指令，立刻返回！");
					location.href="javascript:history.back(-1)";
				</script>
				<%
			}
		}
		 %>
<!--             声 明          --><BR />
<%@ include file="static/bottom.jsp" %>
</body>
</html>
