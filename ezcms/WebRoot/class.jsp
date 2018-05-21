<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page  import="ezcms.dao.impl.*,ezcms.dao.*,ezcms.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("GBK");
String cid= request.getParameter("id");

NewsClassDao ncDao = new NewsClassDaoImpl();
List<NewsClass> nclist = new ArrayList<NewsClass>();
NewsClass nc = new NewsClass();
NewsClass nc2 = new NewsClass();; 

NewsDao nDao = new NewsDaoImpl();
News n = new News();
List<News> nlist = new ArrayList<News>();
String ncname = null;
int id = 0;
if(cid != null && cid != "" ){
	id= Integer.parseInt(cid);
	nc2 = ncDao.getClassById(id);
	}else{
	nc2.setName("无");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>文章分类：<%=nc2.getName() %></title>
<link href="static/css/style.css"  rel="stylesheet" type="text/css" />
<%
if(cid != "" && cid != null  ){
	id= Integer.parseInt(cid);
	nc2 = ncDao.getClassById(id);
	}else{
	nc2.setName("无");
	%>
		<script type="text/javascript" language="javascript">
			alert("错误操作,返回首页!");
			location.href="<%=basePath %>/index.jsp";
		</script>
		</head>
		<body style="text-align: center;margin:200px;font-size:16px;">
		错误操作,<a href="index.jsp" target="_top">返回首页</a>!
		</body></html>
	<%
}
	if(cid != "" && cid != null){
		id= Integer.parseInt(cid);
 %>
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
						if(id == nc.getClassId()){
							ncname = nc.getName();
						%>
						<li><a class="current" href="class.jsp?id=<%=nc.getClassId() %>" ><span><%=nc.getName() %></span></a></li>
						<%
						}else{     		
         %>
        	<li><a href="class.jsp?id=<%=nc.getClassId() %>" ><span><%=nc.getName() %></span></a></li>
        <%
       		 		}
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
            	<h2 class="tit"><span class="theme"><%=ncname %></span></h2>
                <%
                	nlist = (ArrayList<News>)nDao.listNewsByClassId(id);
                	if(nlist!=null){
                		for(Iterator it = nlist.iterator(); it.hasNext();){
							n = new News();
							n = (News)it.next();                		
                 %>
                 <div class="theme-item">
                    <dl>
                    	<dt style="background:url(static/images/icons.gif) repeat-y ;background-position:0px 557px;height:20px; width:600px;padding:0px 0px 0px 20px;">
                    		<a href="news.jsp?id=<%=n.getNid() %>"><%=n.getTitle() %> [ <%=n.getPostTime() %> ] </a>
                    	</dt>
                        <dd><%=n.getDescription() %></dd>
                    </dl>
                </div>
                <%	
                		}
                	}
                	if(nlist.size()<1){
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


