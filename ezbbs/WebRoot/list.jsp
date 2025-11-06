<%@ page language="java" pageEncoding="GBK"
	import="java.util.*,ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%
	request.setCharacterEncoding("GBK"); // 设置字符集

	ReplyDao replyDao = new ReplyDaoImpl();
	BoardDao boardDao = new BoardDaoImpl(); // 得到版块Dao的实例
	TopicDao topicDao = new TopicDaoImpl(); // 得到主题Dao的实例
	UserDao userDao = new UserDaoImpl(); // 得到用户Dao的实例
%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String boardId = request.getParameter("bid");
	int BoardId = Integer.parseInt(boardId);
	Board boardName = boardDao.findBoard(BoardId);
	System.out.println("list.jsp 板块ID"+BoardId);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>简单JSP论坛 >> <%=boardName.getBoardName() %> >> 帖子列表</title>

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
		<!--      主体        -->
		<%
			Topic topic = new Topic();
			int topicId = topic.getTopicId();
			int count = topicDao.findCountTopic(BoardId);
		%>
		<DIV>
			<!--      导航        -->
			<br />
			<DIV>
				&gt;&gt;
				<B><a href="index.jsp">论坛首页</a> </B>&gt;&gt;

				<B><A href="list.jsp?bid=<%=BoardId%>"><%=boardName.getBoardName()%></A>
				</B>
			</DIV>
			<br />
			<!--      新帖        -->
			<DIV>
				<A href="post.jsp?bid=<%=BoardId%>"><IMG
						src="image/post.gif" name="td_post" border="0" id=td_post> </A>
			</DIV>
			<br/>
			<!--         翻 页         -->
			<%
				//------得到当前页码数------
				int diPage = 1;//默认将当前页码数设为1
				String pages = request.getParameter("diPage");
				if (pages == null || pages.length() == 0)
					pages = "1";
				try {
					diPage = Integer.parseInt(pages);
				} catch (Exception e) {
					diPage = 1;
				}

				int pageSize = 10;//每页显示的记录条数

				//------得到分页情况相关信息------
				int recordCount = count;
				int pageCount = 0;
				if (recordCount % pageSize == 0) {
					pageCount = recordCount / pageSize;
					System.out.println("一共有：" + pageCount + "页");
				} else {
					pageCount = recordCount / pageSize + 1;
					System.out.println("一共是：" + pageCount + "页");
				}
			%>
			<div>
				<%
					if (diPage != 1) {
				%>
				<a
					href="list.jsp?&bid=<%=BoardId%>&tid=<%=topicId%>&diPage=1">首页</a>&nbsp;
				<a
					href="list.jsp?&bid=<%=BoardId%>&tid=<%=topicId%>&diPage=<%=(diPage - 1)%>">上一页</a>&nbsp;
				<%
					}
				%>
				<%
					if (diPage != pageCount) {
				%>
				<a
					href="list.jsp?&bid=<%=BoardId%>&tid=<%=topicId%>&diPage=<%=(diPage + 1)%>">下一页</a>&nbsp;
				<a
					href="list.jsp?&bid=<%=BoardId%>&tid=<%=topicId%>&diPage=<%=pageCount%>">尾页</a>&nbsp;
				<%
					}
				%>
				<%=diPage%>/<%=pageCount%>页
			</DIV>

			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" border="0" width="100%">
					<TR>
						<TH class="h" style="WIDTH: 100%; font-size: 18px; height: 15px" colSpan="5">
							<SPAN  style="font-size: 13px;">主题列表</SPAN>
						</TH>
							<td class="h" ><span  style="font-size: 13px;">主题数:</span><%=recordCount %></td>
					</TR>
					<!--       表 头           -->
					<TR class="tr2">
						<TD width="2%">
							&nbsp;
						</TD>
						<TD style="WIDTH: 10%" align="center"  style="font-size: 12px;">
							编号
						</TD>
						<TD style="WIDTH: 45%" align="center"  style="font-size: 12px;">
							文章
						</TD>
						<TD style="WIDTH: 25%" align="center" style="font-size: 12px;">
							发表时间
						</TD>
						<TD style="WIDTH: 10%" align="center" style="font-size: 12px;">
							作者
						</TD>
						<TD style="WIDTH: 10%" align="center" style="font-size: 12px;">
							回复
						</TD>
					</TR>
					<!--         主 题 列 表        -->

					<%
						List listTopic = topicDao.findListTopic(diPage, BoardId);
						for (int i = 0; i < listTopic.size(); i++) {
							topic = (Topic) listTopic.get(i);
							topicId = topic.getTopicId();
							User user = new User();
							count = replyDao.findCountReply(topicId);
							user = userDao.findUser(topic.getUid());
					%>

					<TR class="tr3" style="FONT-SIZE: 15px">
						<TD>
							<IMG src="image/topic.gif" border=0>
						</TD>
						<TD align="center">
							<%=topicId%>
						</TD>
						<TD>
							<A href="detail.jsp?bid=<%=BoardId%>&tid=<%=topicId%>"><%=topic.getTitle()%></A>
						</TD>
						<TD align="center">
							<%=topic.getPublishTime()%>
						</TD>
						<TD align="center">
							<%=user.getUName()%>
						</TD>
						<TD align="center">
							<%=count%>
						</TD>
					</TR>

					<%
						}
					%>
				</TABLE>
			</DIV>
			<!--         翻 页         -->


			<div>
				<%
					if (diPage != 1) {
				%>
				<a
					href="list.jsp?&bid=<%=BoardId%>&tid=<%=topicId%>&diPage=1">首页</a>&nbsp;
				<a
					href="list.jsp?&bid=<%=BoardId%>&tid=<%=topicId%>&diPage=<%=(diPage - 1)%>">上一页</a>&nbsp;
				<%
					}
				%>
				<%
					if (diPage != pageCount) {
				%>
				<a
					href="list.jsp?&bid=<%=BoardId%>&tid=<%=topicId%>&diPage=<%=(diPage + 1)%>">下一页</a>&nbsp;
				<a
					href="list.jsp?&bid=<%=BoardId%>&tid=<%=topicId%>&diPage=<%=pageCount%>">尾页</a>&nbsp;
				<%
					}
				%>
				<%=diPage%>/<%=pageCount%>页
			</DIV>
			<!--             声 明          -->
			<BR />
		<%@ include file="static/bottom.jsp" %>
	</BODY>
</HTML>
