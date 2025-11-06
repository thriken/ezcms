<%@ page language="java" import="java.util.*,ezbbs.entity.*,ezbbs.dao.impl.*,ezbbs.dao.*" pageEncoding="GBK"%>
<%
BbsinfoDao binfoDao = new BbsinfoDaoImpl();
BbsInfo bbsinfo = new BbsInfo();
	bbsinfo = binfoDao.getInfo();
%>

	<div id="bottom" class="gray" align="right">
			 <%=bbsinfo.getName() %> Ver <%=bbsinfo.getVersion() %> &copy;&nbsp;2011 °æÈ¨ËùÓĞ<br /><%=bbsinfo.getUrl() %>
			
	</div>
