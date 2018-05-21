<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="ezcms.dao.impl.*,ezcms.dao.*,ezcms.entity.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setCharacterEncoding("GBK");
String nid= request.getParameter("id");
int cid = 0;
NewsClassDao ncDao = new NewsClassDaoImpl();
List<NewsClass> nclist = new ArrayList<NewsClass>();
NewsClass nc = new NewsClass();

NewsDao nDao = new NewsDaoImpl();
News n = new News();
List<News> nlist = new ArrayList<News>();

AuthorDao aDao = new AuthorDaoImpl();
Author au = new Author();
int id = 0;
if(nid !=null){
	id = Integer.parseInt(nid);
	n = nDao.getNewsById(id);
	if(n != null){
		nc = ncDao.getClassById(n.getClassId());
		cid = nc.getClassId();
	}else{
		System.out.println(id);
	}
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title><%=n.getTitle() %> - <%=nc.getName() %> - EZCMS</title>
<link href="static/css/style.css"  rel="stylesheet" type="text/css" />
</head>
<body>

<div class="wrap">
<%@ include file="static/html/top_logo.jsp" %>
    <div id="menu">
        <ul id="language">
        	<li><a href="#" class="bold">简体中文</a><span style="margin:0 5px;">|</span><a href="#" >繁体中文</a><span style="margin:0 5px;">|</span><a href="#"  id="change_language" class="lang">English</a></li>
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
						if(cid == nc.getClassId()){
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
    </div><!--/ menu-->
    
    <div id="content">
        <div class="box-rc1"></div>
        <div class="box-rc2"></div>
        <div class="box-rc3"></div>
        <div class="box">
            <div id="sys-download" class="box-bd m3c2">
            	<div class="main">
            		<h2 class="tit"><span class="down"><%=n.getTitle() %>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="copyCode('EZCMS，共享开源的力量，一律免费！\n支持开源软件产业，一起来下载测试： <%=basePath %>');">(复制此网址分享给好友)</a> <span style=" color:#090;display:none;" id="copy_success_msg">已经成功复制到粘贴板！</span></h2>
                	<p><%=n.getNewsContent() %></p>

	                <div id="download_buttons" style="display:none">
		                <div style="padding:5px; background:#FFFFE8; border:dashed 1px #ccc;">  
		                 	<p class="blue"><strong>Ylmf OS 3.0 正式版</strong></p>
			                <p>MD5: 919794E3D9B035A5A895C3E1D1818F95</p>
							<p>SHA1: 6E672A667155E442A612F69CCBA1BF6C44752D8D</p>
			                <ul class="mirrors">
			                	<li><a href="http://down.ylmf.org/Ylmf_OS_3.0.iso"  target="_blank">下载地址一</a></li>
			                	<li><a href="http://xiazai.xiazaiba.com/Soft/Y/Ylmf_OS_3.0.iso" target="_blank">下载地址二</a></li>
			                </ul>
						</div>
	                </div><!--/ download_buttons-->
						<br />
					<div class="line"></div>	
					<%
						au = aDao.getAuthorById(n.getAuthorId());
					 %>
					<div align="right"><%=n.getPostTime() %> by <%=au.getName() %></div>
	                	
				</div> <!--/ main-->

				<div class="sidebar">
                <h2><span class="intrd">其他文章</span></h2>
                <ul>
                <%
                	nlist = (ArrayList<News>)nDao.listNewsByClassId(n.getClassId());
                	if(nlist != null){
                	for(Iterator it = nlist.iterator();it.hasNext();){
                		n = new News();
                		n = (News)it.next();
                		if(n.getNid() != id){
                 %>
					<li><a href="?id=<%=n.getNid() %>"><%=n.getTitle() %></a></li> 
				<%
						}else{
						%>
						<li>暂无</li>
						<%
							}
						}
					}
				 %>
                </ul>
                </div><!--/ sidebar-->
                
            </div><!--/ box-bd-->
        </div><!--/ .box-->
        <div class="box-rc3"></div>
        <div class="box-rc2"></div>
        <div class="box-rc1"></div>
    </div><!--/ content--> 

	<%@ include file="static/html/footer.jsp" %>
</div><!--/ wrap-->

<script type="text/javascript" src="static/js/common.js" ></script>
<script type="text/javascript">
function copyCode(txt){
	var testCode= txt;
	var timer;
	if(copy2Clipboard(testCode)!=false){
		document.getElementById("copy_success_msg").style.display = "inline";
		if(timer){
			window.clearTimeout(timer);
		}
		
		timer = setTimeout(function(){
			document.getElementById("copy_success_msg").style.display = "none";
		},2200)
		alert("已经复制到粘贴板，你可以使用Ctrl+V 贴到需要的地方去了哦！  ");
	}
}

var copy2Clipboard=function(txt){
	if(window.clipboardData){
		window.clipboardData.clearData();
		window.clipboardData.setData("Text",txt);
	}
	else if(navigator.userAgent.indexOf("Opera")!=-1){
		window.location=txt;
	}
	else if(window.netscape){
		try{
			netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
		}
		catch(e){
			alert("您的firefox安全限制限制您进行剪贴板操作，请打开’about:config’将signed.applets.codebase_principal_support’设置为true’之后重试，相对路径为firefox根目录/greprefs/all.js");
			return false;
		}
		var clip=Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
		if(!clip)return;
		var trans=Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
		if(!trans)return;
		trans.addDataFlavor('text/unicode');
		var str=new Object();
		var len=new Object();
		var str=Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
		var copytext=txt;str.data=copytext;
		trans.setTransferData("text/unicode",str,copytext.length*2);
		var clipid=Components.interfaces.nsIClipboard;
		if(!clip)return false;
		clip.setData(trans,null,clipid.kGlobalClipboard);
	}
}

var countImg = document.createElement("img");
var downsBtns = document.getElementById("download_buttons").getElementsByTagName("a");
for(var i=0,len = downsBtns.length; i<len; i++){
	downsBtns[i].onclick = function(){
		countImg.src = 'http://stat.114la.com/down_ylmfos.php?url='+this.href+'&rd='+new Date().getTime();
	}
}
</script>
<%@ include file="static/html/tj.jsp" %>

</body>
</html>