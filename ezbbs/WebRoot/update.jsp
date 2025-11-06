<%@ page language="java" pageEncoding="GBK"
	import="ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%
	request.setCharacterEncoding("GBK"); // 设置字符集

	BoardDao boardDao = new BoardDaoImpl(); // 得到版块Dao的实例
	TopicDao topicDao = new TopicDaoImpl(); // 得到主题Dao的实例
	UserDao userDao = new UserDaoImpl(); // 得到用户Dao的实例
	ReplyDao replyDao = new ReplyDaoImpl();
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

		<title>论坛--修改帖子</title>

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


		<!--      主体        -->
		<%
			String boardId = request.getParameter("bid");
			int BoardId = Integer.parseInt(boardId);
			Board boardName = boardDao.findBoard(BoardId);
			System.out.println(BoardId);

			String topicId = request.getParameter("tid");
			int TopicId = Integer.parseInt(topicId);
			Topic topicTitle = topicDao.findTopic(TopicId);
			System.out.println(TopicId);

			String replyId = request.getParameter("rid");
			Reply reply = new Reply();
			int ReplyId = Integer.parseInt(replyId);
			Reply content = replyDao.findReply(ReplyId);
			System.out.println(ReplyId);
			User user = new User();
			user = userDao.findUser(reply.getUid());
		%>
		<DIV>
			<BR />
			<!--      导航        -->
			<DIV>
				&gt;&gt;
				<B><a href="index.jsp">论坛首页</a> </B>&gt;&gt;
				<B><a href="list.jsp?bid=<%=BoardId%>"><%=boardName.getBoardName()%></a>
				</B> &gt;&gt;
				<B><A
					href="detail.jsp?bid=<%=BoardId%>&tid=<%=TopicId%>"><%=topicTitle.getTitle()%></A>
				</B>&gt;&gt;
				<b>修改回复帖子<A
					href="update.jsp?bid=<%=BoardId%>&tid=<%=TopicId%>&rid=<%=ReplyId%>"></A>
				</b>
			</DIV>
			<BR />
			<DIV>
				<FORM name="postForm" onSubmit="return check()"
					action="manage/doUpdateReply.jsp" method="POST">
					<INPUT type="hidden" name="bid" value="<%=BoardId%>" />
					<INPUT type="hidden" name="tid" value="<%=TopicId%>" />
					<INPUT type="hidden" name="rid" value="<%=ReplyId%>" />
					<INPUT type="hidden" name="rid" value="<%=ReplyId%>" />
					<DIV class="t">
						<TABLE cellSpacing="0" cellPadding="0" align="center">
							<TR>
								<TD class="h" colSpan="3">
									<B>修改帖子</B>
								</TD>
							</TR>

							<TR class="tr3">
								<TH vAlign=top>
									<DIV>
										<B>内容</B>
									</DIV>
								</TH>
								<TH colSpan=2>
									<DIV>
										<span><textarea class="input"  class="xheditor-mini {skin:'nostyle'}"  style="WIDTH: 500px;" tabIndex="1" rows="20" cols="90" tabIndex="2" name="content"><%=content.getContent()%></textarea>
										</span>
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

		<!--      声明        -->
		<BR />
		<%@ include file="static/bottom.jsp" %>
	</BODY>
</HTML>