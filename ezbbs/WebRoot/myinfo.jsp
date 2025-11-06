<%@ page language="java" pageEncoding="GBK" import="ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%
	request.setCharacterEncoding("GBK"); // 设置字符集
	UserDao userDao = new UserDaoImpl(); // 得到用户Dao的实例
%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>论坛--个人信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<Link rel="stylesheet" type="text/css" href="style/style.css" />
	</head>

	<body>
<%@ include file="static/top.jsp" %>

		<!--      导航        -->
		<br />
		<DIV>
			&gt;&gt;
			<B><a href="index.jsp">论坛首页</a> </B>&gt;&gt;浏览个人信息
		</DIV>
		<br />

		<!--         个 人 信 息 列 表        -->

		<%
		if(session.getAttribute("user") == null){
			%>
			<script type="text/javascript" language="javascript">
				alert("请先登录");
			</script>
			<%
			response.sendRedirect("login.jsp");
		}else{
			User loginUser = (User) session.getAttribute("user");
			
			int uId = loginUser.getUId();
			User user = userDao.findUser(uId);
		%>
		<div class="t">
			<TABLE cellSpacing="0" cellPadding="0" border="0">
				<tr>
					<td class="tabccc">
						<div style="font-size: 18px; height: 15px" align="center">
							<b>用户管理</b>
						</div>
					</td>
					<td class="tabccc">
						<div style="font-size: 18px; height: 15px" align="center">
							<b>个人资料</b>
						</div>
					</td>
				</tr>
				<tr>
					<td class="tabccc">
						<div align="center">
							<a href="index.jsp">进入论坛首页</a>
						</div>
						<p />
						<div align="center">
							<a href="updateuser.jsp">修改个人信息</a>
						</div>
						<p />
						<div align="center">
							<a href="updatepassword.jsp">修改密码</a>
						</div>
					</td>
					<td class="tabccc">
						<TABLE cellSpacing="0" cellPadding="0" border="0" style="color: #cccccc">
							<TR class="tr2">
								<TD align="center">
									您ID编号
								</TD>
								<TD class="black" id="tabccc-left">
									<%=user.getUId()%>
								</TD>
							</TR>
							<tr class="tr2">
								<TD align="center">
									用&nbsp;户&nbsp;名
								</td>

								<TD class="black" id="tabccc-left">
									<%=user.getUName()%>
								</TD>
							</tr>
							<tr class="tr2">
								<TD align="center">
									性&nbsp;&nbsp;&nbsp;&nbsp;别
								</td>
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
								<TD align="center">
									注册时间
								</td>
								<TD class="black" id="tabccc-left">
									<%=user.getRegTime()%>
								</TD>
							</tr>
							<tr class="tr2">
								<TD align="center">
									个人头像
								</td>
								<TD id="tabccc-left">
									<img src="image/head/<%=user.getHead()%>" />
								</TD>
							</tr>
							<tr class="tr2">
								<TD align="center">
									等级
								</td>
								<TD class="black" id="tabccc-left">
								<%=user.getUlevel()%>
								</TD>
							</tr>
							<tr class="tr2">
								<TD align="center">
									论坛职务
								</td>
								<TD class="black" id="tabccc-left">
								<%=user.getUmanage()==null ? "无" : user.getUmanage() %>
								</TD>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<!--             声 明          -->
		<BR />
		<%
		}
		 %>
<%@ include file="static/bottom.jsp" %>

	</BODY>
</HTML>
