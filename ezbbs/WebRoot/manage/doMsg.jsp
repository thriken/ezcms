<%@ page language="java" import="java.util.*,java.text.*,java.sql.*" pageEncoding="GBK"%>
<%@ page import="ezbbs.dao.impl.*" %>
<%@ page import="ezbbs.dao.*" %>
<%@ page import="ezbbs.entity.*" %>
<jsp:directive.page import="javax.servlet.jsp.tagext.TryCatchFinally"/>
<%
	request.setCharacterEncoding("GBK");
	MessageDao msgDao = new MessageDaoImpl();   //获取Dao类
	Message msg = null;     //封装Message
	
	//获取当前时间
	java.util.Date now = new java.util.Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String pTime = sdf.format(now);  //发送时间
	String toUname = null ;   //发送给uName
	String note = null ;	//消息内容
	String pUname = null;	//发信人

	int mid = 0;			//要删除的消息ID
	int rows = 0 ;
	User loginUser = (User)session.getAttribute("user");  //获取登录用户
	if(loginUser != null){
		if(request.getParameter("mod") == null){
			if(request.getParameter("note") == null){
		%>
		<html><body>
			<div id="tips">
				<script type="text/javascript">
				<!--
					alert("指令错误，请返回！");
					location.href="javascript:history.back(-1)";
				//-->
				</script>
			</div>
		</body></html>
		<%
			}else{
				note = request.getParameter("note");
				pUname = request.getParameter("pUname");
				toUname = request.getParameter("toUname");
				if(!loginUser.getUName().equals(pUname)){
					%><html><body>
						<script type="text/javascript">
						<!--
							alert("发送错误，请返回！");
							location.href="javascript:history.back(-1)";
						//-->
						</script></body></html>
					<%
				}else if(toUname.equals(pUname)){
				%>
					<html><body>
						<script type="text/javascript">
						<!--
							alert("发信人不能与收信人为同一用户，请返回！");
							location.href="javascript:history.back(-1)";
						//-->
						</script></body></html>
				<%
				}else if(note.length()>250){
				%>
					<html><body>
						<script type="text/javascript">
						<!--
							alert("消息长度超过限制，请返回！");
							location.href="javascript:history.back(-1)";
						//-->
						</script></body></html>
				<%
				}else{
					msg = new Message();
					msg.setNote(note.toString());
					msg.setReceiveUname(toUname);
					msg.setSendUname(pUname);
					msg.setPostTime(pTime);
					try{
						rows = msgDao.saveMsg(msg);
					} catch(Exception e){
						e.printStackTrace();
						System.out.println(e);
					} 
					if(rows!=0){
				%><html><body>
					<script type="text/javascript">
					<!--
						alert("发送成功！");
					//-->
					</script></body></html>
				<%
					}else {
				%><html><body>
					<script type="text/javascript">
					<!--
						alert("发送失败，请返回！");
					//-->
					</script></body></html>
				<%
					}
				response.sendRedirect("../msg.jsp");
				}
			}
		}else{
		//-------获得指令--------
			//删除指令
			if(request.getParameter("mod").equals("del")){
				mid = Integer.parseInt(request.getParameter("mid"));
				if(mid != 0){
					rows = msgDao.deleteMsg(mid);
					if(rows != 0){
					%><html><body>
						<script type="text/javascript">
						<!--
							alert("删除成功,返回收件箱。");
						//-->
						</script>
					<%
						response.sendRedirect("../msg.jsp");
					}
				}
			}
		}
	}else{
		%>
			<script type="text/javascript">
			<!--
				alert("请先登录！");
			//-->
			</script>
		<%
		response.sendRedirect("../login.jsp");
	}
%>