<%@ page language="java" import="java.util.*,ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*" pageEncoding="UTF-8"%>
<%
BbsinfoDao binfoDao = new BbsinfoDaoImpl();
BbsInfo bbsinfo = new BbsInfo();
bbsinfo = binfoDao.getInfo();

%>
	<div id="bottom" class="gray" align="right">
		<%=bbsinfo.getName() %> <%=bbsinfo.getVersion() %> &copy;&nbsp;2011 CopyRight<br /><%=bbsinfo.getUrl() %>
	</div>
