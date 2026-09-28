<%@ page language="java"  pageEncoding="UTF-8"%>
<%
if(session.getAttribute("Admin_Login") != null){
	session.removeAttribute("Admin_Login");
	response.sendRedirect("../login.jsp");
}
%>
