<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="ezcms.dao.*,ezcms.dao.impl.*,ezcms.entity.*" %>
<% /****** 菜单管理 ******/ %>
<%
request.setCharacterEncoding("GBK");
String mname = request.getParameter("mid");
int mid = 1;
if(mname!=null){
	mid = Integer.parseInt(mname);
}
ManageMenuDao mmDao = new ManageMenuDaoImpl();
LeftMenuDaoImpl lmDao = new LeftMenuDaoImpl();
List mmlist = mmDao.getMianMenu();
List lmlist = null;
MainMenu mm = null; 
LeftMenu lm = null;
%>

<html>
<head>    
    <title>菜单管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<style>
	.inputsolid{border:1px solid;}
	.buttonsolid{border:1px solid;background-color: #9999ff;cursor:hand;}
	</style>   
</head>
<body bgcolor="#f8fcfc" style="font-size:13px;">
<table border="0" style="border:3px solid green;padding:3px;" cellpadding="0" cellspacing="0">
	<tr>
		<td style="border-right: 3px solid green;">
			<div style="height:500px;width:100px;font-weight: +1;font-size:13px;font:Verdana, Arial, Helvetica, sans-serif;" align="center">
			&gt;&gt;主菜单项&lt;&lt;<br />
	<%
		for(Iterator it = mmlist.iterator();it.hasNext();){
		mm = (MainMenu)it.next();
		if(mm.getIsUrl()==0){
	%>
				<hr  style="border-bottom:3px solid green;width:100% " />
				<a href="?mid=<%=mm.getId() %>" target="_self" style="text-decoration: none;padding:3px 1px;"><%=mm.getMname().length()<4 ? "&nbsp;&nbsp;"+mm.getMname()+"&nbsp;&nbsp;": mm.getMname()%>&nbsp;<img src="../static/images/<%=(mid == mm.getId())?"open.gif": "close.gif"%>" border=0 height="16" width="16" /></a><br />
			<%
				} 
			}
			%>
			</div>	
		</td>
		<td>
			<div style="height:500px;width:750px;text-align: center;font-size:14px;">
				&gt;&gt;子菜单&lt;&lt;<br /><hr  style="border-bottom:3px solid green;width:100% " />
				<table border=1 cellpadding="0" cellspacing="0" style="border:1px solid green;">
				<tr bgcolor="green" style="color:#fcfcfc;font-size:13px;padding:5px 0px 3px 0px;">
					<th width="70">显示顺序</th><th width="140">菜单名称</th><th width="80">类型</th><th width="250">参数</th><th width="140px;">操作</th>
				</tr>
			<%
				lmlist = lmDao.getLeftMenu(mid);
				for(Iterator it2 = lmlist.iterator();it2.hasNext();){
					lm = (LeftMenu)it2.next();
			%>
					<tr style="font-size:13px;padding-top:2px;" >
					  <form name="main<%=mid %>" action="" method="post" >
						<input type="hidden" name="id" value="<%=lm.getCid() %>" >
						<input type="hidden" name="mid" value="<%=lm.getMid() %>" >
						<td align="center"><input class="inputsolid" name="sort" value="<%=lm.getSort() %>" style="width:18px;"></td>
						<td>&nbsp;<input class="inputsolid" name="cname" value="<%=lm.getCname() %>" style="width:130px;"></td>
						<td align="center">
						<%
							if(lm.getIsUrl()==0){
						 %>
						<input type="radio" name="isUrl" value="0" checked="checked">别名<input type="radio" name="isUrl" value="1">链接
						<%
						}else{
						 %>
						<input type="radio" name="isUrl" value="0">别名<input type="radio" name="isUrl" value="1" checked="checked">链接
						<%
							}
						 %>
						</td>
						<td align="center"><input class="inputsolid" name="text" value="<%=lm.getText() %>" style="width:230px;" /></td>
						<td align="center"><input class="buttonsolid" type="submit" value="提交" style="width:50px;">&nbsp;&nbsp;<input class="buttonsolid" type="button" value="删除" style="width:50px;"></td>
					  </form>
					</tr>
		<%
			}
	%>			
				</table>
				<div style="margin:5px 25px;" align="left">共有<%=lmlist.size() %>个子菜单。<span style="color:red">&lt;别名文件位于amdin/inc目录下,链接文件位于amdin目录下。</span>&gt;</div>
			</div>	
		</td>
	</tr>
</table>
</body>
</html>
