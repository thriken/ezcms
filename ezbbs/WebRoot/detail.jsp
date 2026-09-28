<%@ page language="java" pageEncoding="UTF-8" import="java.util.*,ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*,java.sql.*" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
	String curPath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+request.getRequestURI()+"?"+request.getQueryString();

	request.setCharacterEncoding("UTF-8"); // 设置字符集

	ReplyDao replyDao = new ReplyDaoImpl();
	BoardDao boardDao = new BoardDaoImpl(); // 得到版块Dao的实例
	TopicDao topicDao = new TopicDaoImpl(); // 得到主题Dao的实例
	UserDao userDao = new UserDaoImpl(); // 得到用户Dao的实例

	String boardId = request.getParameter("bid");
	int BoardId = Integer.parseInt(boardId);
	Board boardName = boardDao.findBoard(BoardId);
	System.out.println(BoardId);

	String topicId = request.getParameter("tid");
	int TopicId = Integer.parseInt(topicId);
	Topic topicTitle = topicDao.findTopic(TopicId);
	Topic topicContent = topicDao.findTopic(TopicId);
	Topic tpubTime = topicDao.findTopic(TopicId);
	Topic tmodTime = topicDao.findTopic(TopicId);
	System.out.println(TopicId);

	Topic topic = new Topic();
	User user = new User();
	int count = replyDao.findCountReply(TopicId);
	user = userDao.findUser(topic.getUid());
	//发帖人信息
	User postUser = userDao.findUser(topicTitle.getUid());
	String puName = postUser.getUName();
	String puHead = postUser.getHead();
	String puregt = postUser.getRegTime();
	int puLevel = postUser.getUlevel();
	System.out.println("等级"+puLevel);
	String puManage = postUser.getUmanage();
	
	int puId = postUser.getUId();
	int loguserId = 0 ;
	int ruId = 0;
	int ruLevel = 0 ;
	String	ruManage;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>简单JSP论坛  >> <%=boardName.getBoardName()%> >> <%=topicTitle.getTitle()%></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<Link rel="stylesheet" type="text/css" href="style/style.css" />
	</head>

	<BODY>
		<div>
			<DIV>
				<IMG src="image/logo.gif" />
			</DIV>
			<!--      用户信息、登录、注册        -->
			<%
				if (session.getAttribute("user") == null) {
			%>
			<DIV class="h">
				您尚未 <a href="denglu.jsp?ref=<%=curPath %>">登录</a> &nbsp;| &nbsp;<A href="reg.jsp">注册</A> |
			</DIV>
			<%
				} else {
					User loginUser = (User) session.getAttribute("user");
					loguserId = loginUser.getUId();
			%>
			<DIV class="h">
				您好：<A href="myinfo.jsp"><%=loginUser.getUName()%></A> &nbsp;| &nbsp; <A href="manage/doLogout.jsp">登出</A> |
			</DIV>
			<%
				}
			%>


			<!--      主体        -->

			<DIV>
				<br />
				<!--      导航        -->
				<DIV>
					&gt;&gt;
					<B><a href="index.jsp">论坛首页</a> </B>&gt;&gt;
					<B><a href="list.jsp?bid=<%=BoardId%>"><%=boardName.getBoardName()%></a>
					</B> &gt;&gt;
					<B><A href="detail.jsp?bid=<%=BoardId%>&tid=<%=TopicId%>"><%=topicTitle.getTitle()%></A>
					</B>
				</DIV>
			</DIV>
			<br />
			<!--      回复、新帖        -->
			<DIV>
				<A href="post.jsp?bid=<%=BoardId%>"><IMG src="image/post.gif" name="td_post" border="0" id=td_post> </A>
				<A href="reply.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>"><IMG src="image/reply.gif" name="td_post" border="0" id=td_post></A>
			</DIV>
			<br />
			<!--         翻 页         -->

			<%
				Reply reply = new Reply();
				int replyId = reply.getReplyId();

				//------得到当前页码数------
				int diPage = 1;//默认将当前页码数设为1
				String pages = request.getParameter("diPage");
				if (pages == null || pages.length() == 0)
					pages = "1";
				try {
					diPage = Integer.parseInt(pages);
					System.out.println("这是第：" + diPage + "页");
				} catch (Exception e) {
					diPage = 1;
				}

				int pageSize = 20;//每页显示的记录条数

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
				<a href="detail.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>&rid=<%=replyId%>&diPage=1">首页</a>&nbsp;
				<a href="detail.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>&rid=<%=replyId%>&diPage=<%=(diPage - 1)%>">上一页</a>&nbsp;
				<%
					}
				%>
				<%
					if (diPage != pageCount) {
				%>
				<a
					href="detail.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>&rid=<%=replyId%>&diPage=<%=(diPage + 1)%>">下一页</a>&nbsp;
				<a
					href="detail.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>&rid=<%=replyId%>&diPage=<%=pageCount%>">尾页</a>&nbsp;
				<%
					}
				%>
				当前<%=diPage%>/<%=pageCount%>页
			</div>
			<!--      本页主题的标题        -->
			<DIV>
				<TABLE cellSpacing="0" cellPadding="0" border="0" width="100%">
					<TR class="tr1">
						<td class="h" width="16%" style="border-right:1px solid #cccc00;font-size:12px">作者</td>
						<td class="h" style="font-size: 18px">
							<b>本页主题:</b>
							<%=topicTitle.getTitle()%>
						</td>
						<td class="h1" style="font-size: 14px">
							<b>回复数：</b><%=count%>
						</td>
					</TR>
					<!--      主题        -->
					<TR class="tr2">
						<TD rowSpan="2" width="16%" style="border-right:1px solid #cccc00" align="left">
							<font color="#000000">
							<div style="font-size: 14px;margin:3px auto auto 3px;" >
								<b><a href="userinfo.jsp?uname=<%=puName %>"><%=puName %></a></b>
							</div>
							<div style="height:80px;">
								<img src="image/head/<%=puHead %>" />
							</div> 
							<%
								if(puManage == null)
								{
							 %>
								<div id="usergif"></div>
							<%
								} else{
								 if(puManage.equals("管理员")){
									puManage = "admin";
								} 
								if(puManage.equals("超级版主")){
									puManage = "smaster";
								} 
								if(puManage.equals("版主")){
									puManage = "master";
								} 
								if(puManage.equals("实习版主")){
									puManage = "expmaster";
									}
							 %>
							 <div id="usergif" style="background-image:url(image/manage/<%=puManage %>.gif)">	
							 </div>
							 <%
							 }
							  %>
							<div id="usergif" style="background-image:url(image/level/<%=puLevel %>.gif)">	
							</div><br />
							<div style="font-size: 12px">
								注册时间:<%=puregt.substring(0,19) %></div></font>
						</TD>
						<TD>
							<b>话题内容：</b>
						</TD>
						<TD align="right">
							<b>楼主</b>
						</TD>
					</tr>
					<tr>
						<TD colSpan="2" class="tr2" style="font-size: 16px;height:150px;" >
							<div style="height:135px;">
							<%=topicContent.getContent()%>
							</div>
							
							<DIV class="tipad" style="padding-top: 5px;height:20px;">发表时间：
								<SPAN class="gray">[ <%=tpubTime.getPublishTime().substring(0,19) %> ]</SPAN> 最后修改:
								<SPAN class="gray">[ <%=tmodTime.getModifyTime().substring(0,19) %> ]</SPAN>
								<%
								if (loguserId == puId){
								%>
								 <div id="editPost" style="display: inline; height:20px;">
								 <%
								 }else{
								  %>
								 <div id="editPost" style="display: none">
								 <%
								}
								%>
								<A href="manage/doDeleteReply.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>"><IMG src="image/delete.gif" border="0"> </A>
								<A href="update.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>"><IMG src="image/edit.gif" border="0"> </A>
								</div>
							</DIV>
							
						</TD>
					</TR>
				</TABLE>
			</DIV>
			<br />

			<!--      回复        -->

			<%
				int rowBegin = 0;
				if (diPage < 1) {
					diPage = 1;
				} else
					rowBegin = pageSize * (diPage - 1);
				List listReply = replyDao.findListReply(diPage, TopicId);
				for (int i = rowBegin; i <= recordCount; i++) {
					System.out.println("recordCount:" + recordCount);
					for (int j = 0; j < listReply.size(); j++) {
						System.out.println(listReply.size());
						reply = (Reply) listReply.get(j);
						replyId = reply.getReplyId();
						user = userDao.findUser(reply.getUid());
						ruId = reply.getUid();
						ruLevel = userDao.findUser(reply.getUid()).getUlevel();
						//ruLevel = user.getUlevel();
						ruManage = user.getUmanage();
						System.out.println(ruManage + ruLevel);
			%>

			<div><%=(i++) + 1%>楼
			</div>

			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" border="0" width="100%">
					<TR class="tr1">
						<TH style="WIDTH: 15%; height:200px;">
							<div style="font-size: 14px;">
								<b><a href="userinfo.jsp?uname=<%=user.getUName()%>"><%=user.getUName()%></a></b>
							</div>
							<div>
								<img src="image/head/<%=user.getHead()%>" />
							</div>
							<%
								if(ruManage == null)
								{
							 %>
								<div id="usergif"></div>
							<%
								} else{
								 if(ruManage.equals("管理员")){
									ruManage = "admin";
								} 
								if(ruManage.equals("超级版主")){
									ruManage = "smaster";
								} 
								if(ruManage.equals("版主")){
									ruManage = "master";
								} 
								if(ruManage.equals("实习版主")){
									ruManage = "expmaster";
									}
							 %>
							 <div id="usergif" style="background-image:url(image/manage/<%=ruManage %>.gif)">
							 </div>
							 <%
							 }
							  %>
							<div id="usergif" style="background-image:url(image/level/<%=ruLevel %>.gif)" >
							</div>
							  <br />
							<div style="font-size: 12px">注册:<%=user.getRegTime().substring(0,19)%></div>
						</TH>
						<TH style="WIDTH: 80%;height:200px;">
							<div style="height:120px;">
								<%=reply.getContent()%>
							</div>
							
							<DIV class="tipad">
								发表时间：<SPAN class="gray">[ <%=reply.getPublishTime().substring(0,19) %> ]</SPAN> 最后修改:<SPAN class="gray">[ <%=reply.getModifyTime().substring(0,19) %> ]</SPAN>
								<%
								if (loguserId == ruId){
								%>
								 <div id="editPost" style="display: inline;height:20px;">
								 	<div style="margin:auto auto 1px auto;">
										<A href="manage/doDeleteReply.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>&rid=<%=replyId%>"><IMG src="image/delete.gif" border="0"> </A>
										<A href="update.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>&rid=<%=replyId%>"><IMG src="image/edit.gif" border="0"> </A>
									</div>
								</div>
								 <%
								 }else{
								  %>
								 <div id="editPost" style="display: none"></div>
								 <%
								}
								%>
							</DIV>
						</TH>
					</TR>
				</TABLE>
			</div>
			<%
				}
				}
			%>
		</div>
		<!--         翻 页         -->

		<div>
			<%
				if (diPage != 1) {
			%>
			<a href="detail.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>&rid=<%=replyId%>&diPage=1">首页</a>&nbsp;
			<a href="detail.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>&rid=<%=replyId%>&diPage=<%=(diPage - 1)%>">上一页</a>&nbsp;
			<%
				}
			%>
			<%
				if (diPage != pageCount) {
			%>
			<a href="detail.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>&rid=<%=replyId%>&diPage=<%=(diPage + 1)%>">下一页</a>&nbsp;
			<a href="detail.jsp?&bid=<%=BoardId%>&tid=<%=TopicId%>&rid=<%=replyId%>&diPage=<%=pageCount%>">尾页</a>&nbsp;
			<%
				}
			%>
			当前<%=diPage%>/<%=pageCount%>页
		</div>

	<!--      声明        --><BR />
	<%@ include file="static/bottom.jsp" %>
</BODY>
</HTML>

