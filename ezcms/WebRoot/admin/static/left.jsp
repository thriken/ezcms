<%@ page language="java" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String menu = request.getParameter("m");
String name = (String)session.getAttribute("Admin_Login");
 %>

<html>
<head>
    <title>左侧菜单</title>
	<style type="text/css">
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	body {
		font-family: 'Microsoft YaHei', Arial, sans-serif;
		font-size: 14px;
		background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
		color: #333;
		min-height: 100vh;
	}
	
	#menutop {
		background: rgba(255, 255, 255, 0.95);
		border-radius: 8px;
		margin: 15px 10px;
		padding: 12px 15px;
		text-align: center;
		font-size: 16px;
		font-weight: bold;
		color: #2c3e50;
		box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
		border: 1px solid rgba(255, 255, 255, 0.2);
	}
	
	#menutop span {
		color: #e74c3c;
		font-weight: bold;
	}
	
	#menu {
		margin: 0 10px 15px 10px;
	}
	
	#nav {
		list-style: none;
		background: rgba(255, 255, 255, 0.95);
		border-radius: 8px;
		overflow: hidden;
		box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
		border: 1px solid rgba(255, 255, 255, 0.2);
		display: block;
		margin: 0 10px 15px 10px;
		padding: 0;
	}
	
	#nav li {
		display: block;
		width: 100%;
		border-bottom: 1px solid #eef1f4;
		transition: all 0.3s ease;
	}
	
	#nav li:last-child {
		border-bottom: none;
	}
	
	#nav li:hover {
		background: rgba(52, 152, 219, 0.08);
	}
	
	#nav li a {
		display: block;
		padding: 13px 16px 13px 34px;
		text-decoration: none;
		color: #2c3e50;
		font-weight: 500;
		font-size: 15px;
		transition: all 0.3s ease;
		position: relative;
		border-left: 3px solid transparent;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	#nav li a:hover {
		color: #3498db;
		background: rgba(52, 152, 219, 0.1);
		border-left: 3px solid #3498db;
		padding-left: 38px;
	}
	
	#nav li a:before {
		content: "▶";
		position: absolute;
		left: 14px;
		color: #bdc3c7;
		font-size: 10px;
		transition: all 0.3s ease;
		top: 50%;
		transform: translateY(-50%);
	}
	
	#nav li a:hover:before {
		color: #3498db;
		transform: translateY(-50%) translateX(2px);
	}
	
	#nav li a span {
		display: inline;
		text-align: left;
	}
	
	.line {
		height: 1px;
		background: linear-gradient(to right, transparent, #bdc3c7, transparent);
		margin: 10px 0;
	}
	
	/* 不同菜单类型的特殊样式 */
	#nav li a[id="1"] { border-left-color: #e74c3c; }
	#nav li a[id="2"] { border-left-color: #3498db; }
	#nav li a[id="3"] { border-left-color: #2ecc71; }
	
	#nav li a[id="1"]:hover { border-left-color: #e74c3c; background: rgba(231, 76, 60, 0.05); }
	#nav li a[id="2"]:hover { border-left-color: #3498db; background: rgba(52, 152, 219, 0.05); }
	#nav li a[id="3"]:hover { border-left-color: #2ecc71; background: rgba(46, 204, 113, 0.05); }
	
	/* 响应式设计 */
	@media (max-width: 768px) {
		#menutop {
			margin: 10px 5px;
			padding: 10px;
			font-size: 14px;
		}
		
		#nav {
			flex-direction: column;
			align-items: stretch;
		}
		
		#nav li {
			display: block;
			width: 100%;
		}
		
		#nav li a {
			display: block;
			padding: 10px 12px;
			font-size: 13px;
			margin: 0;
			text-align: center;
		}
		
		#nav li a:before {
			display: none;
		}
	}
	</style> 
	<script type="text/javascript">
		function mmclick(id){
			// 移除原有的alert，添加平滑点击效果
			var element = document.getElementById(id);
			if(element) {
				element.style.backgroundColor = 'rgba(52, 152, 219, 0.1)';
				setTimeout(function() {
					element.style.backgroundColor = '';
				}, 300);
			}
		}
	</script>   
</head>
<body>
<%
  if(session.getAttribute("Admin_Login") == null)
    {
	%>
	<div>请先登录！</div>
	<%
  }else{
	%>
	<div id=menutop >
		欢迎 <span style="color:green"><%=name %></span>
	</div><br />
	<div id=menu>
		<ul id=nav>
		<%
		if("menu".equals(menu)){
		%>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/menu.jsp')"><span>菜单管理</span></a></li>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/menu.jsp?op=addmain')"><span>添加主菜单</span></a></li>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/menu.jsp?op=addsub')"><span>添加子菜单</span></a></li>
		<%	
		}
		if("index".equals(menu)){
		%>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/quick.jsp')"><span>快捷选项</span></a></li>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('static/main.jsp')"><span>欢迎页</span></a></li>
		<%		
		}
		if("notice".equals(menu)){
		%>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/notice.jsp')"><span>公告列表</span></a></li>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/addnotice.jsp')"><span>添加公告</span></a></li>
		<%		
		}
		if("news".equals(menu)){
		%>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/news.jsp')"><span>新闻列表</span></a></li>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/newsclass.jsp')"><span>新闻栏目</span></a></li>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/addnews.jsp')"><span>添加新闻</span></a></li>
		<%		
		}
		if("user".equals(menu)){
		%>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/users.jsp')"><span>用户列表</span></a></li>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/adduser.jsp')"><span>添加用户</span></a></li>
		<%		
		}
		if("ad".equals(menu)){
		%>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/ads.jsp')"><span>广告列表</span></a></li>
			<li><a href="javascript:void(0)" onclick="window.navigateTo('inc/addad.jsp')"><span>添加广告</span></a></li>
		<%		
		}
		%>
		</ul>
	</div>
		<%
	}
 %>
  </body>
</html>
