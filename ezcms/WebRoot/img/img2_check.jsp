<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>��֤����֤ҳ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache"> 
<META HTTP-EQUIV="Expires" CONTENT="0"> 
</head>

<body>
<%
		String rand = (String) session.getAttribute("randnum");
		String input = request.getParameter("randnum");
%>	
		���ɵ���֤���ǣ�
		<%=rand%><br>
		���������֤��Ϊ��
		<%=input%><br>
		<br>
		<%
			if (rand.equals(input)) {
		%>
		<font color=green>������ͬ����֤�ɹ���</font>
		<%
			} else {
		%>
		<font color=red>���벻ͬ����֤ʧ�ܣ�</font>
		<%
			}
		%>
	</body>
</html>