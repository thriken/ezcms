<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page  import="ezcms.dao.impl.*,ezcms.dao.*,ezcms.entity.*"%>
<%
	NewsClassDao ncDao = new NewsClassDaoImpl();
	NewsClass nc = new NewsClass();
	List<NewsClass> nclist = new ArrayList<NewsClass>();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>关于我们 - EZCMS</title>
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
        	nclist =(ArrayList<NewsClass>) ncDao.listAllClass();
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
            <div id="sys-download" class="box-bd m3c2">
            	<div class="main">
	            	<h2 class="tit"><span class="down">系统下载</span></h2>
	                <p>Ylmf OS  是一款免费 快速 安全 稳定 扩展性强的Linux操作系统！</p>
	                <p>Ylmf OS  沿承Windows使用习惯，极具实用性，是您学习、办公、上网及娱乐的理想选择。</p>
					<p><strong>我们的使命：</strong> 开发最适合国人使用的中文Linux操作系统。</p>
	                <p>请选择适合您的下载地址: <a href="javascript:void(0)" onclick="copyCode('Ylmf OS操作系统，共享开源的力量，一律免费！\n支持民族软件产业，一起来下载测试： http://www.xp.com');">(复制此网址分享给好友)</a> <span style=" color:#090;display:none;" id="copy_success_msg">已经成功复制到粘贴板！</span></p>
	                
	                <div class="line"></div> 
	                            
	                <div id="download_buttons">
		                <div style="padding:5px; background:#FFFFE8; border:dashed 1px #ccc;">  
			                <p class="blue"><strong>Ylmf OS 3.0 正式版</strong></p>
			                <p>MD5: 919794E3D9B035A5A895C3E1D1818F95</p>
							<p>SHA1: 6E672A667155E442A612F69CCBA1BF6C44752D8D</p>
			                <ul class="mirrors">
			                	<li><a href=" javascript:window.location='http://down.ylmf.org/Ylmf_OS_3.0.iso'"  target="_blank">下载地址一</a></li>
			                	<li><a href="http://xiazai.xiazaiba.com/Soft/Y/Ylmf_OS_3.0.iso" target="_blank">下载地址二</a></li>
			                </ul>
						</div>
               		</div>
				</div>
                
                <div class="sidebar">
	                <h2><span class="intrd">Ylmf OS系统特性</span></h2>
	                <ul>
					<li>最大程度模拟 Windows XP 界面及操作习惯，让您快速入手Linux</li> 
					<li>将所有的软件和库更新到5月28日，安装时不需拨掉网线，也不需长久等待</li>
					<li>集成FireFox 增强插件、即时通信客户端、方便您用户上网冲浪 </li>
					<li>集成功能强大界面友好的 SMPlayer、Audacious 等媒体播放器，方便用户享受影音娱乐生活 </li>
					<li>集成 CompizConfig 桌面特效管理器，几乎可以实现所有的视觉特效，满足您的视觉需求</li>
					<li>集成了编程，音视频编辑等专业软件。</li>
					<li>集成 Wine 模拟器平台，让您的 Linux 也能运行Windows程序 </li>
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
		//alert("已经复制到粘贴板，你可以使用Ctrl+V 贴到需要的地方去了哦！  ");
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