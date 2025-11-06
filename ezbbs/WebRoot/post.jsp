<%@ page language="java" pageEncoding="GBK"
	import="ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%
	request.setCharacterEncoding("GBK"); // 设置字符集

	BoardDao boardDao = new BoardDaoImpl(); // 得到版块Dao的实例
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
		<title>论坛--发表话题</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<script type="text/javascript" src="static/jquery/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="static/xheditor-1.1.6-zh-cn.min.js"></script>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<Link rel="stylesheet" type="text/css" href="style/style.css" />

		<script type="text/javascript">
function check(){
	if(document.postForm.title.value=="") {
		alert("标题不能为空");
		return false;
	}
	if(document.postForm.content.value=="") {
		alert("内容不能为空");
		return false;
	}
	if(document.postForm.content.value.length>1000) {
		alert("长度不能大于1000");
		return false;
	}
}
</script>
	</head>
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
		<br />
		<div class="t" style="text-align: center;padding:20px 20px;margin:0 20px;height:50px;">
			请先<a href="login.jsp">登录</a>！
		</div>
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



		<!--      主体        -->
		<%
			String boardId = request.getParameter("bid");
			int BoardId = Integer.parseInt(boardId);
			Board boardName = boardDao.findBoard(BoardId);
			System.out.println(BoardId);
		%>
		<DIV>
			<BR />
			<!--      导航        -->
			<DIV>
				&gt;&gt;
				<B><a href="index.jsp">论坛首页</a> </B>&gt;&gt;
				<B><A href="list.jsp?bid=<%=BoardId%>"><%=boardName.getBoardName()%></A>
				</B>
			</DIV>
			<BR />
			<DIV>
				<FORM name="postForm" onSubmit="return check()"
					action="manage/doPost.jsp" method="POST">
					<INPUT type="hidden" name="bid" value="<%=BoardId%>" />
					<INPUT type="hidden" name="tid" value="" />
					<DIV class="t">
						<TABLE cellSpacing="0" cellPadding="0" align="center">
							<TR>
								<TD class="h" colSpan="3">
									<B>发表帖子</B>
								</TD>
							</TR>

							<TR class="tr3">
								<TH width="20%">
									<B>标题</B>
								</TH>
								<TH>
									<INPUT class="input"
										style="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1"
										size="60" name="title">
								</TH>
							</TR>

							<TR class="tr3">
								<TH vAlign=top>
									<DIV>
										<B>内容</B>
									</DIV>
								</TH>
								<TH colSpan=2>
									<DIV>
										<span><textarea class="xheditor-mini {skin:'nostyle'}" style="WIDTH: 500px;" name="content"
												rows="20" cols="90" tabIndex="2"></textarea> </span>
									</DIV>
									(不能大于:
									<FONT color="blue">1000</FONT>字)
								</TH>
							</TR>
						</TABLE>
					</DIV>

					<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
						<INPUT class="btn" tabIndex="3" type="submit" value="提 交">
						<INPUT class="btn" tabIndex="4" type="reset" value="重 置">
					</DIV>
				</FORM>
			</DIV>
		</DIV>
		<%
			}
		%>
		<!--      声明        -->
		<BR />
		<%@ include file="static/bottom.jsp" %>
	</BODY>
</HTML>