<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import="ezcms.dao.*,ezcms.dao.impl.*,ezcms.entity.*" %>
<%
AuthorDao auDao = new AuthorDaoImpl();
List<Author> aulist = (ArrayList<Author>)auDao.listAuthor();
Author au = null;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>AuthorList</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
  </head>
<body bgcolor="#f8fcfc"><br />
<%
if(aulist == null){
	%>
	<div align="center">暂无用户</div>
	<%
	}else{
 %>
<table border="1" cellpadding="0" cellspacing="0" style="border: 1px solid #000000;">
	<tr bgcolor="darkgreen" style="color:#fff;font-size:13px;padding:5px 2px;" >
		<th width="30">ID
		<th width="100">登录名
		<th width="120">密码
		<th width="30">性别
		<th width="120">生日
		<th width="120">注册时间
		<th width="80">操作
	</tr>
	<%	
		for(Iterator it = aulist.iterator();it.hasNext();){
			au = (Author)it.next();
	%>
	<tr bgcolor="#eeeeee" style="color:#000000;font-size:12px;padding:5px;">
		<td align="center"><%=au.getAuthorId() %></td>
		<td align="center"><%=au.getName() %></td>
		<td><%=au.getPassword() %></td>
		<td align="center"><%=au.getSex()==0?"男":"女" %></td>
		<td align="center"><%=au.getBirthday().length() ==0 ? "无" :au.getBirthday() %></td>
		<td align="center"><%=au.getRegTime().length() ==0 ? "无" :au.getRegTime() %></td>
		<td align="center"><a href="">修改</a> <a href="">删除</a></td>
	</tr>
	<%		
			}
		}
	 %>
</table>

</body>
</html>
