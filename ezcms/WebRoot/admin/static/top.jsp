<%@ page language="java" pageEncoding="GBK"%>
<%
request.setCharacterEncoding("GBK");
String m = request.getParameter("m");
if(m!=null){
	m="1";
}	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>��ҳ - ��̨���� - EZCMS</title>
<link href="css/style.css"  rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;text-align: left">
<div class="wrap">
	<table width="100%">
		<tr>
			<td width="160"><img src="images/logo.gif" /></td>
			<td width="1200">       
			    <div id="menu">
			      <ul id="nav">
						<li><a href="left.jsp?m=index" target="left"><span>�� ҳ</span></a></li>
					    <li><a href="left.jsp?m=notice"  target="left"><span>�� ��</span></a></li>
					    <li><a href="left.jsp?m=news"  target="left"><span>�� ��</span></a></li>
					    <li><a href="left.jsp?m=user"  target="left"><span>�� ��</span></a></li>
					    <li><a href="left.jsp?m=ad"  target="left"><span>�� ��</span></a></li>
					    <li><a href="left.jsp?m=menu"  target="left"><span>�˵�����</span></a></li>
					    <li><a href="../function/dologout.jsp"  target="_top"><span>�˳�</span></a></li>
			      </ul>
			    </div>
			</td>
		</tr>
	</table>
</div><!--/ wrap-->
</body>
</html>