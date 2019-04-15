<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page  import="ezcms.dao.impl.*,ezcms.dao.*,ezcms.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	NoticeDao noDao = new NoticeDaoImpl();
	Notice not = new Notice(); 
	
	NewsClassDao ncDao = new NewsClassDaoImpl();
	NewsClass nc = new NewsClass();
	List<NewsClass> nclist = new ArrayList<NewsClass>();
	
	NewsDao nDao = new NewsDaoImpl();
	News n = new News();
	List<News> nlist = new ArrayList<News>();
	
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title>首页 - EZCMS</title>
    <base href="<%=basePath %>" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<link href="/static/css/style.css"  rel="stylesheet" type="text/css" />
  </head>
<body>
  <div class="wrap">
   	<%@ include file="static/html/top_logo.jsp" %><!--/ logo-->
	<div id="menu">
        <ul id="language">
        	<li><a href="#"  class="bold">1</a><span style="margin:0 5px;">|</span><a href="#" >2</a><span style="margin:0 5px;">|</span><a href="#"  id="change_language" class="lang">3</a></li>
        </ul> 
        <ul id="nav">
       	<li><a class="current" href="index.jsp" ><span>首 页</span></a></li>
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
    </div><!--/ menu-->
	
	 <div id="content">
        <div id="board" style="background-image:url(static/images/banner.jpg)">
            <dl>
	            <dt>EZCMS 1.01 BETA版 发布</dt>
	            <dd>程序界面源自YLMF OS站点</dd>
				<dd>采用Jsp + SQL Server 2005 开发</dd>
				<dd>集成编程，音视频编辑等专业软件</dd>
				<dd>采用精仿 Windows XP主题</dd>
				<dd style="margin-bottom:15px;">全新的安装方式，多语言自动配置</dd>
	            <dd><a href="#" >安装截图预览</a></dd>
	            <dd><a href="about.html" >关于我们 &raquo;</a></dd>
            </dl>
        	<a href="javascript:alert('暂无下载!');"  id="download_button"><em>立即下载</em></a>
        </div><!--/ board-->
        <%
        	not = noDao.getNewestNotice();
        	if(not.getTitle() == null){
        		not.setTitle("暂无公告");
        	}
         %>
    	<div id="notice">
        	<p>最新公告:<a href="release_notice.jsp"   target="_blank"><%=not.getTitle() %></a></p>
        </div><!--/ notice-->

		<div id="info" class="clearfix">
        	<div id="recent-update" class="box-item">
	        	<div class="box-rc1"></div>
	            <div class="box-rc2"></div>
	            <div class="box">
	                <dl class="box-bd">
	                    <dt class="tit">了解 EZ CMS:
	                    <span><a href="about.jsp" >更多 &raquo;</a></span>
	                    </dt>
	                    <dd >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ylmf OS —— 雨林木风开源操作系统，采用精仿的 Windows 主题，以国人的使用习惯为制作理念，精选常用软件，操作系统具有速度快，安全，稳定，界面操作简洁明快等特点。</dd>
	                    <dd >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;民族软件业崛起需要我们共同的努力，我们坚信，经过大家的努力，Linux 也可以做得和 Windows 那样出色，给广大用户多一个选择。</dd>
	                </dl>
	            </div>
	            <div class="box-rc2"></div>
	            <div class="box-rc1"></div>
        	 </div>


	         <div id="about-ylmf-os" class="box-item">
	        	<div class="box-rc1"></div>
	            <div class="box-rc2"></div>
	            <div class="box">
		            <dl class="box-bd">
		                <dt class="tit">环境需求:
		                <span><a href="about.jsp" >更多 &raquo;</a></span>
		                </dt>
		                <dd>
		                	<dd><strong>基本配置</strong> </dd>
		                    <dd> Tomcat + SQL Server</dd>
		                    <dd>不少于20 MB 硬盘空间</dd>
		                    <dd> 800 x 600 分辨率</dd><br />
		               		<dd><strong>推荐配置</strong> </dd>
		                    <dd>Tomcat + SQL Server</dd>
		                    <dd> 1024x768 分辨率</dd>
							<dd>100 MB 硬盘空间</dd>
						<dd>&nbsp;</dd>
		            </dl>
	            </div>
	            <div class="box-rc2"></div>
	            <div class="box-rc1"></div>
	         </div>
         
	         <div id="faq-item" class="box-item">
	        	<div class="box-rc1"></div>
	            <div class="box-rc2"></div>
	            <div class="box">
	            <dl class="box-bd">
	                <dt class="tit">最新文章:
	                <span><a href="newslist.jsp" >更多 &raquo;</a></span>
	                </dt>
	               <%
	                	nlist =(ArrayList<News>)nDao.listNews();
	                	if(nlist !=null ){
	                	for(Iterator it = nlist.iterator();it.hasNext();){
							n =new News();
							n = (News)it.next();
	                 %>
	                <dd><a href="news.jsp?id=<%=n.getNid() %>" ><%=n.getTitle() %></a></dd>
	                <%
						}
					}
					%>
	            </dl>
	            </div>
	            <div class="box-rc2"></div>
	            <div class="box-rc1"></div>
	         </div>
         </div><!--/ info-->
    </div><!--/ content--> 
	
   	<%@ include file="static/html/footer.jsp" %><!--/ footer-->
  </div><!--/ wrap-->
  	<%@ include file="static/html/tj.jsp" %>
</body>
</html>
