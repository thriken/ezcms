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
    <title>��ҳ - EZCMS</title>
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
       	<li><a class="current" href="index.jsp" ><span>�� ҳ</span></a></li>
        <li><a href="release_notice.jsp" ><span>����</span></a></li>
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
	            <dt>EZCMS 1.01 BETA�� ����</dt>
	            <dd>�������Դ��YLMF OSվ��</dd>
				<dd>����Jsp + SQL Server 2005 ����</dd>
				<dd>���ɱ�̣�����Ƶ�༭��רҵ���</dd>
				<dd>���þ��� Windows XP����</dd>
				<dd style="margin-bottom:15px;">ȫ�µİ�װ��ʽ���������Զ�����</dd>
	            <dd><a href="#" >��װ��ͼԤ��</a></dd>
	            <dd><a href="about.html" >�������� &raquo;</a></dd>
            </dl>
        	<a href="javascript:alert('��������!');"  id="download_button"><em>��������</em></a>
        </div><!--/ board-->
        <%
        	not = noDao.getNewestNotice();
        	if(not.getTitle() == null){
        		not.setTitle("���޹���");
        	}
         %>
    	<div id="notice">
        	<p>���¹���:<a href="release_notice.jsp"   target="_blank"><%=not.getTitle() %></a></p>
        </div><!--/ notice-->

		<div id="info" class="clearfix">
        	<div id="recent-update" class="box-item">
	        	<div class="box-rc1"></div>
	            <div class="box-rc2"></div>
	            <div class="box">
	                <dl class="box-bd">
	                    <dt class="tit">�˽� EZ CMS:
	                    <span><a href="about.jsp" >���� &raquo;</a></span>
	                    </dt>
	                    <dd >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ylmf OS ���� ����ľ�翪Դ����ϵͳ�����þ��µ� Windows ���⣬�Թ��˵�ʹ��ϰ��Ϊ���������ѡ�������������ϵͳ�����ٶȿ죬��ȫ���ȶ�������������������ص㡣</dd>
	                    <dd >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ҵ������Ҫ���ǹ�ͬ��Ŭ�������Ǽ��ţ�������ҵ�Ŭ����Linux Ҳ�������ú� Windows ������ɫ��������û���һ��ѡ��</dd>
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
		                <dt class="tit">��������:
		                <span><a href="about.jsp" >���� &raquo;</a></span>
		                </dt>
		                <dd>
		                	<dd><strong>��������</strong> </dd>
		                    <dd> Tomcat + SQL Server</dd>
		                    <dd>������20 MB Ӳ�̿ռ�</dd>
		                    <dd> 800 x 600 �ֱ���</dd><br />
		               		<dd><strong>�Ƽ�����</strong> </dd>
		                    <dd>Tomcat + SQL Server</dd>
		                    <dd> 1024x768 �ֱ���</dd>
							<dd>100 MB Ӳ�̿ռ�</dd>
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
	                <dt class="tit">��������:
	                <span><a href="newslist.jsp" >���� &raquo;</a></span>
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
