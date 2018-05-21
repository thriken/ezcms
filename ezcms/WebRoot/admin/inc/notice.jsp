<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="ezcms.dao.*,ezcms.dao.impl.*,ezcms.entity.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
NoticeDao ndao = new NoticeDaoImpl();
List<Notice> nlist = (ArrayList<Notice>)ndao.listNotice();
Notice n = null;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>noticelist</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />    
<style>
a{text-decoration: none;}
</style>
</head>
<body bgcolor="#f8fcfc"><br />
<table border="1" cellpadding="0" cellspacing="0" style="border: 1px solid #000000;">
	<tr bgcolor="darkgreen" style="color:#fff;font-size:13px;padding:5px 2px;" >
		<th width="30" >ID</th>
		<th width="120" >标题</th>
		<th width="400" >内容</th>
		<th width="120" >发布时间</th>
		<th width="80" >操作</th>
	</tr>
	<%
		for(Iterator it = nlist.iterator();it.hasNext();){
			n = (Notice)it.next();
	%>
	<tr bgcolor="#eeeeee" style="color:#000000;font-size:12px;padding:5px;">
		<td align="center"><%=n.getId() %></td>
		<td><%=n.getTitle() %></td>
		<td><%=n.getNotice().length()>40 ? (n.getNotice().substring(0,40) + "........."):n.getNotice() %></td>
		<td align="center"><%=n.getPostTime().length() ==0 ? "无" :(n.getPostTime().length()>10 ?n.getPostTime().substring(0,10):n.getPostTime()) %></td>
		<td align="center"><a href="">修改</a> <a href="">删除</a></td>
	</tr>
	<%		
		}
	 %>
</table>
</body>
</html>
