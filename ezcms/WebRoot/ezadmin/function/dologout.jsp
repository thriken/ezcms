<%@ page language="java"  pageEncoding="GB18030"%>
<%
if(session.getAttribute("Admin_Login") != null){
	session.removeAttribute("Admin_Login");
	response.sendRedirect("../index.html");
}
%>
