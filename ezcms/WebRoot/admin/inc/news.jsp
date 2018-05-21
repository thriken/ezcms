<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="ezcms.dao.*,ezcms.dao.impl.*,ezcms.entity.*" %>
<%
NewsDao newsDao = new NewsDaoImpl();
NewsClassDao ncDao = new NewsClassDaoImpl();
AuthorDao aDao = new AuthorDaoImpl();
List<News> nlist = new ArrayList<News>();

News n = new News();
NewsClass nc = new NewsClass();
Author au = new Author();
nlist = (ArrayList<News>)newsDao.listNews();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>newslist</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
</head>
<body bgcolor="#f8fcfc">
<br />
<table border="1" cellpadding="0" cellspacing="0" style="border: 1px solid #000000;">
	<tr bgcolor="darkgreen" style="color:#fff;font-size:13px;padding:5px 2px;" >
		<th width="30">ID
		<th width="100">栏目
		<th width="350">标题
		<th width="80">作者
		<th width="120">发布时间
		<th width="80">操作
	</tr>
	<%
		for(Iterator it = nlist.iterator();it.hasNext();){
			n = (News)it.next();
			nc = ncDao.getClassById(n.getClassId());
			au = aDao.getAuthorById(n.getAuthorId());
	%>
	<tr bgcolor="#eeeeee" style="color:#000000;font-size:12px;padding:5px;">
		<td align="center"><%=n.getNid() %></td>
		<td align="center"><%=nc.getName() %></td>
		<td><%=n.getTitle() %></td>
		<td align="center"><%=au.getName() %></td>
		<td align="center"><%=n.getPostTime().length() ==0 ? "无" :(n.getPostTime().length()>10 ?n.getPostTime().substring(0,10):n.getPostTime()) %></td>
		<td align="center"><a href="">修改</a> <a href="">删除</a></td>
	</tr>
	<%		
		}
	 %>
</table>
</body>
</html>
