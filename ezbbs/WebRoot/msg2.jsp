<%@ page language="java" pageEncoding="GBK" import="java.text.*,ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<jsp:directive.page import="javax.servlet.jsp.tagext.TryCatchFinally"/>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%
	request.setCharacterEncoding("GBK"); 	// 设置字符集
	UserDao userDao = new UserDaoImpl(); 	// 得到用户Dao的实例
	MessageDao mDao = new MessageDaoImpl(); 	// 得到短信息Dao的实例
	
	String mode = null;     //操作类型  
	User loginUser = null;		//登录用户
	List msgList = new ArrayList();   //消息列表
	int mId = 0 ;					//消息ID
	String toUname = null;       //发送给Uname
	String shortNote = null ;

	if( request.getParameter("mod") == null){
		mode = request.getParameter("mod");
	}else{
		mode = request.getParameter("mod");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<base href="<%=basePath%>" />
	<title>论坛--短消息</title>
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<META http-equiv=Content-Type content="text/html; charset=gbk" />
	<Link rel="stylesheet" type="text/css" href="style/style.css" />
</head>

<body>
	<DIV id="logo">
		<table border=0 cellpadding="0" cellspacing="0">
		<tr>
			<td><IMG src="image/logo.gif" width="123" height="45"></td>
			<td><div style=" margin:0 20px 0 120px;" align="right">广告招商</div></td>
		</tr>
		</table>
	</DIV>
	<!--      用户信息、登录、注册        -->
	<%
		if (session.getAttribute("user") == null) {
	%>
	<DIV class="h">
		您尚未<a href="login.jsp">登录</a> &nbsp;| &nbsp;	<A href="reg.jsp">注册</A> |
	</DIV>
	<%
		} else {
			loginUser = (User) session.getAttribute("user");
	%>
	<DIV class="h">
		您好：<A href="myinfo.jsp"><%=loginUser.getUName()%></A> &nbsp;| &nbsp;<A href="manage/doLogout.jsp">登出</A> ‖ <a href="msg.jsp">收件箱</a> &nbsp;&nbsp;<a href="msg.jsp?mod=send">发消息</a> 
	</DIV>
	<%
		}
	%>
	<div class="h">
		现在时间是：
		<%
		//定义日期的格式
		java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		//产生日期并格式化
		String strCurrentTime = formater.format(new java.util.Date());
		// 输出日期、时间
		out.println(strCurrentTime);
		%>
	</div>
	<!--      导航        -->
	<br />
	<DIV>
		&gt;&gt;
		<B><a href="index.jsp">论坛首页</a> </B>&gt;&gt;<B><A href="msg.jsp">短消息</A></B>
	</DIV><br />
	<!--         登录提示        -->
	<%
		if (session.getAttribute("user") == null) {
	%><br />
	<div class="t" style="padding: 20px 0;margin:0 10% ">
		<center> 现在就去 <a href="login.jsp">登录</a> ！</center>
	</div> <br />
	<%
	 }else{
	 %>
			 
	<!--        主   体        -->
<span style="margin:0px 5%;font-size: 14px;" >短消息</span>
<div class="t" style="margin:0px 5%;padding:3px 5px;" >
	<div id="msg" style="pading:15px;margin:0px 50px;border-bottom: 1px dash #cccccc" align="left" >	
		<!-- 消息 START -->
			<!-- 短信息列表 -->
			 <%
				if(request.getParameter("mod") == null ){
					msgList = mDao.listByReceivedUname(loginUser.getUName());
					if(msgList.size() == 0){
				%>
					<td width=90%>暂无消息</td>
				<%
				}else{
					for(int i = 0;i<msgList.size();i++){
					Message m =(Message)msgList.get(i);	
					if(m.getNote().length() > 20){
						shortNote = m.getNote().substring(0,20)+"....";
					}else{
						shortNote = m.getNote();
					}
				%>	
				<table>		
					<tr>
						<td width=88%>
							<img src="image/msg<%=m.getReadSign() %>.gif" />来自[<a href="userinfo.jsp?uname=<%=m.getSendUname() %>"><%=m.getSendUname() %></a>]: <a href="#" ><%=shortNote %></a>
						</td>
						<td>[ <a href="readmsg.jsp?mid=<%=m.getMid() %>">查看</a> ]   [ <a href="manage/doMsg.jsp?mod=del&mid=<%=m.getMid() %>">删除</a> ]</td>
					</tr>
		 		</table>
					<%
						}
					}
				}
				else{ 
					if(request.getParameter("mod").equals("send")){
						if(request.getParameter("uname") == null){
							toUname = "";
						}else{
							toUname = request.getParameter("uname");
							}
						%>
						<form name="postMsg" method="post" action="manage/doMsg.jsp">
							<table class="h">		
								<tr>
									<td colspan="2"><h2 class="h">发送短消息</h2></td>
								</tr>
								<input type="hidden" name="pUname" value="<%=loginUser.getUName() %>" />
								<tr>
									<td width=5%>发送给：</td>
									<td class="h"><input class="t" type="text" name="toUname" value="<%=toUname %>" /></td>
								</tr>
								<tr>
									<td>内容：</td>
									<td class="h">
										<textarea cols="60" rows="8" type="text" name="note" ></textarea>
										<div style="display:block">发送消息不超过250字</div>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td class="h">
										<input type="submit" value="发送" />&nbsp;&nbsp;&nbsp;
										<input type="reset" name="reset" value="清空" />
									</td>
								</tr>
							</table>
						</form>
						<%
					}
				}
			}
		 %>
		 <!-- 消息 END -->
	</div>
</div>
	<!--             声 明          -->
		<BR /><%@ include file="static/bottom.jsp" %>
	</BODY>
</HTML>
