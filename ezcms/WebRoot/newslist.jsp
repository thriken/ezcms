<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page  import="ezcms.dao.impl.*,ezcms.dao.*,ezcms.entity.*"%>
<%
request.setCharacterEncoding("GBK");

NewsClassDao ncDao = new NewsClassDaoImpl();
List<NewsClass> nclist = new ArrayList<NewsClass>();
NewsClass nc = new NewsClass();
; 

NewsDao nDao = new NewsDaoImpl();
News n = new News();
List<News> nlist = new ArrayList<News>();

nlist = (ArrayList<News>)nDao.listNews();
if(nlist != null){
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>所有文章</title>
<link href="static/css/style.css"  rel="stylesheet" type="text/css" />
</head>

<body>
<div class="wrap">
	<%@ include file="static/html/top_logo.jsp" %>
    <div id="menu">
        <ul id="language">
        	<li><a href="#"  class="bold">简体中文</a><span style="margin:0 5px;">|</span><a href="#" >繁体中文</a><span style="margin:0 5px;">|</span><a href="#"  id="change_language" class="lang">English</a></li>
        </ul>
        <ul id="nav">
       	<li><a href="index.jsp" ><span>首 页</span></a></li>
       	<li><a href="release_notice.jsp" ><span>公告</span></a></li>
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

    </div>
    
    <div id="content">
        <div class="box-rc1"></div>
        <div class="box-rc2"></div>
        <div class="box-rc3"></div>
        <div class="box">
            <div id="theme-download" class="box-bd">
            	<h2 class="tit"><span class="theme">所有文章</span></h2>
                <%
                		for(Iterator it = nlist.iterator(); it.hasNext();){
							n = new News();
							n = (News)it.next();   
							nc = ncDao.getClassById(n.getClassId());             		
                 %>
                 <div class="theme-item">
                    <dl>
                    	<dt style="background:url(static/images/icons.gif) repeat-y ;background-position:0px 557px;height:20px; width:600px;padding:0px 0px 0px 20px;">
                    		<span style="font-size:14px; color:#333333;margin:0 20px 0 0px;"><%=nc.getName() %>:</span><a href="news.jsp?id=<%=n.getNid() %>"><%=n.getTitle() %> [ <%=n.getPostTime() %> ]</a> 
                    	</dt>
                        <dd><%=n.getDescription() %></dd>
                    </dl>
                </div>
                <%	
                		}
                	if(nlist == null){
                	%>
                 	<div class="theme-item">
                    	<dl>
                    		<dt>暂无文章</dt>
                    	</dl>
               		 </div>
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
<%
}
 %>
</html>


