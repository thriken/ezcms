<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page  import="ezcms.dao.impl.*,ezcms.dao.*,ezcms.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("GBK");
String nid = request.getParameter("nid");
int id = 0;
if(nid != null){
	id = Integer.parseInt(nid);
}
NoticeDao nDao = new NoticeDaoImpl();
NewsClassDao ncDao = new NewsClassDaoImpl();

List<Notice> list = null;   //公告列表
list = new ArrayList<Notice>();
list = (ArrayList<Notice>)nDao.listNotice();

NewsClass nc = new NewsClass();
List<NewsClass> nclist = new ArrayList<NewsClass>();

Notice notice = null;    //最新公告
if(nDao.getNewestNotice() == null){
	notice.setTitle("暂无公告");
	notice.setNotice("暂无公告");
	notice.setTitle("");
}else{
	if(id != 0){
		notice = nDao.getNoticeById(id);
	}else{
		notice =nDao.getNewestNotice();
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=notice.getTitle() %> - EZCMS</title>
<link href="static/css/style.css"  rel="stylesheet" type="text/css" />
</head>
<body>
<div class="wrap">
<%@ include file="static/html/top_logo.jsp" %>
    <div id="menu">
        <ul id="language">
        	<li><a href="#"  class="bold">1</a><span style="margin:0 5px;">|</span><a href="#" >2</a><span style="margin:0 5px;">|</span><a href="#"  id="change_language" class="lang">3</a></li>
        </ul>
        
        <ul id="nav">
       	<li><a href="index.jsp" ><span>首 页</span></a></li>
        <li><a class="current" href="release_notice.jsp" ><span>公告</span></a></li>
		        <%
        	nclist = (ArrayList<NewsClass>)ncDao.listAllClass();
        	if(nclist != null){
        		for(Iterator it = nclist.iterator();it.hasNext();){
					nc =new NewsClass();
					nc = (NewsClass)it.next(); 
					if(nc.getType() == 0){     		
         		%>
        			<li><a href="class.jsp?id=<%=nc.getClassId() %>" ><span><%=nc.getName() %></span></a></li>
        		<%
       		 	}else{
       		 	%>
       		 	<li><a href="<%=nc.getUrl() %>" target="_blank" ><span><%=nc.getName() %></span></a></li>
       		 	<%
       		 	}
       		 }
        }
         %>
        </ul>
    </div><!--/ menu-->
    
    <div id="content">
        <div class="box-rc1"></div>
        <div class="box-rc2"></div>
        <div class="box-rc3"></div>
        <div class="box">
            <div id="relate-download" class="box-bd m3c2">
            	<h2 class="tit">公告：<%=notice.getTitle() %></h2>
            	<p>内容：<br />&nbsp;&nbsp;&nbsp;&nbsp;<%=notice.getNotice() %></p><br /><br />
				<p>　　你的支持是我们最大的动力。<br /><br /></p>
				<p align="right"><%=notice.getPostTime() %>&nbsp;&nbsp;&nbsp;&nbsp;</p>
				<strong>其他公告：</strong><br />
				<%
					if(list != null){
						for(Iterator it = list.iterator();it.hasNext();){
							Notice n = (Notice)it.next();
							if(n.getId() != notice.getId()){
						%>
							&nbsp;&nbsp;&nbsp;&nbsp;<a href="release_notice.jsp?nid=<%=n.getId() %>"><%=n.getTitle() %></a> <br /> 
						<%
						}}
					}else{
				 %>
							&nbsp;&nbsp;&nbsp;&nbsp;<a href="release_notice.jsp?nid=<%=notice.getId() %>"><%=notice.getTitle() %></a>  
				<%
					} 
				%>             
            </div><!--/ box-bd-->
        </div><!--/ .box-->
        <div class="box-rc3"></div>
        <div class="box-rc2"></div>
        <div class="box-rc1"></div>
    </div><!--/ content--> 
    
    
<%@ include file="static/html/footer.jsp" %>
</div><!--/ wrap-->
<%@ include file="static/html/tj.jsp" %>
</body>
</html>
