<%@ page language="java"  pageEncoding="GBK"%>
<%
if(session.getAttribute("Admin_Login") == null){
	response.sendRedirect("../login.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title> -  - EZCMS</title>
<link href="css/style.css"  rel="stylesheet" type="text/css" />
</head>
<body>
<div class="wrap">
    <div id="content">
        <div class="box-rc1"></div>
        <div class="box-rc2"></div>
        <div class="box-rc3"></div>
        <div class="box">
            <div id="sys-download" class="box-bd m3c2">
            	<div class="main">
	            	<h2 class="tit"><span class="down">下载</span></h2>
	                <p>EZ CMS  是一款免费 快速 安全 稳定 扩展性强的文章管理系统！</p>
	                <p>EZ CMS  采用Jsp + SQL Server 开发</p>
	                <p>EZ CMS  接下来准备采用 JSP + MYSQL 数据库</p>
					<p><strong>我们的目标：</strong> 开发最适合广大网友使用的JSP文章管理系统。</p>
	                <p>请选择适合您的下载地址:</p>
	                <div class="line"></div> 
	                <div id="download_buttons">
		                <div style="padding:5px; background:#FFFFE8; border:dashed 1px #ccc;">  
			                <p class="blue"><strong>EZ CMS v1.01 beta</strong></p>
			                <p>MD5: </p>
							<p>SHA1: </p>
			                <ul class="mirrors">
			                	<li>暂无下载</li>
			                </ul>
						</div>
		                <div style="margin:80px 0 5px;font-size:14px;color:#c00;"><strong>历史版本</strong></div>
		                <div><strong>以下版本的安装请参考下载RAR文件中的 readme.txt</strong></div>
		               	<div class="line"></div>
	                	<br />
	                </div>          
				</div>
                <div class="sidebar">
                <h2><span class="intrd">EZ CMS特性</span></h2>
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
</div><!--/ wrap-->
</body>
</html>