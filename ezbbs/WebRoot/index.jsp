<%@ page language="java" pageEncoding="GBK"
	import="java.util.*,ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%@page import="ezbbs.dao.ParentDao"%>
<%
	request.setCharacterEncoding("GBK"); // 设置字符集

	BoardDao boardDao = new BoardDaoImpl(); // 得到版块Dao的实例
	TopicDao topicDao = new TopicDaoImpl(); // 得到主题Dao的实例
	UserDao userDao = new UserDaoImpl(); // 得到用户Dao的实例
	ParentDao parentDao = new ParentDaoImpl();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
	<HEAD>
		<TITLE>欢迎访问简单JSP论坛</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<Link rel="stylesheet" type="text/css" href="style/style.css" />
	</HEAD>

	<BODY>
<%@ include file="static/top.jsp" %>
			<!--      主体        -->
			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" width="100%">
					<TR class="tr2" align="center">
						<TD colSpan="2" style="WIDTH: 60%">
							论坛
						</TD>
						<TD style="WIDTH: 5%">
							主题
						</TD>
						<TD style="WIDTH: 25%">
							最后发表
						</TD>
					</TR>
					<!--       主版块       -->

					<%
						List listParent = parentDao.findParentList();
						for (int i = 0; i < listParent.size(); i++) {
							Parent parent = (Parent) listParent.get(i); // 主题对象
					%>
					<TR class="tr3">
						<TD colspan="4"><%=parent.getParentName()%></TD>
					</TR>
					<!--       子版块       -->

					<%
						int parentId = parent.getParentId();
							List listBoard = boardDao.findBoardList(parentId);
							for (int j = 0; j < listBoard.size(); j++) {
								Board sonBoard = (Board) listBoard.get(j);
								int boardId = sonBoard.getBoardId();
								sonBoard = boardDao.findBoard(boardId);
								Topic topic = new Topic();
								Reply reply = new Reply();
								User user = new User();
								List listTopic = topicDao.findTopicList(boardId); // 取得该板块主题列表
								int count = topicDao.findCountTopic(boardId);
								if (listTopic != null && listTopic.size() > 0) {
									topic = (Topic) listTopic.get(count - 1); // 取得最后发表的帖子
									user = userDao.findUser(topic.getUid());
								}
					%>

					<TR class="tr3">
						<TD width="5%">
							<img src="image/board/<%=sonBoard.getBoardIcon() %>.gif" width="100" height="45">
						</TD>
						<TH align="left">
							<IMG src="image/board.gif">
							<A href="list.jsp?bid=<%=boardId%>"><%=sonBoard.getBoardName()%></A>
						</TH>
						<TD align="center"><%=topicDao.findCountTopic(boardId)%></TD>
						<TH>
							<%
								if (topic.getTitle() == null && user.getUName() == null
												&& topic.getPublishTime() == null) {
											out.println("还没有人发表话题!");
										} else {
							%>
							<SPAN> <A href="detail.jsp?diPage=1&bid=<%=boardId%>&tid=<%=topic.getTopicId()%>&rid=<%=reply.getReplyId()%>"><%=topic.getTitle()%></A>
							</SPAN>
							<BR />
							<SPAN><%=user.getUName()%></SPAN>
							<SPAN class="gray">[ <%=topic.getPublishTime()%> ]</SPAN>
						</TH>
					</TR>
					<%
						}
							}
						}
					%>
				</TABLE>
			</DIV>
		<BR />
		<%--
		 <%@ include file="static/footer_ad.jsp" %> 
		--%>
		<%@ include file="static/bottom.jsp" %>
	</BODY>
</HTML>