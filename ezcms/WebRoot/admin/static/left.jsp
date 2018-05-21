<%@ page language="java" pageEncoding="GB18030"%>
<%
request.setCharacterEncoding("GBK");
String menu = request.getParameter("m");
String name = (String)session.getAttribute("Admin_Login");
 %>

<html>
<head>
    <title>左侧菜单</title>
	<style type="text/css" >
	ul, ol { list-style:none; }
	body{font-size:12px;}
	#menu { clear:both;background-repeat:no-repeat; margin-top:3px;margin-bottom:3px; position:relative;margin-left:-30px;width:110px;}
	li{cursor: hand;}
	li a{padding-left:15px;padding-top:9px;margin-top:3px;height:30px;width:100px;background: url(images/qqicons.gif) 0 -223px no-repeat; }
	li a:hover{padding-left:10px;padding-top:9px;margin-top:3px;height:30px;width:100px;background-position: 0 -128px;}
	span{text-align: center;}
	</style> 
	<script type="text/javascript">
		function mmclick(id){
			alert(id);
			for(var i = 0;i>-1;i++)
			document.getElementById(id).style.backgroundPosition='0 -128px';
		}
	</script>   
</head>
<body bgcolor="#f8fcfc">
<%
  if(session.getAttribute("Admin_Login") == null)
    {
	%>
	<div>请先登录！</div>
	<%
  }else{
	%>
	<div id=menutop style="border:solid 1px #eeeeee;margin:0 0 0 15px;width:85px;height:20px;font-size:14px;text-align: center">
		欢迎 <span style="color:green"><%=name %></span>
	</div><br />
	<div id=menu>
		<ul id=nav>
		<%
		if(menu.equals("menu")){
		%>
			<li><a id=1 href="../inc/menu.jsp"  target="main" onclick="mmclick('1')"><span>菜单管理</span></a></li>
			<li><a id=2 href="../inc/menu.jsp"  target="main" onclick="mmclick('2')"><span>添加主菜单</span></a></li>
			<li><a id=3 href="../inc/menu.jsp"  target="main" onclick="mmclick('3')"><span>添加子菜单</span></a></li>
		<%	
		}
		if(menu.equals("index")){
		%>
			<li><a id=1 href="../inc/quick.jsp"  target="main" onclick="mmclick('1')"><span>快捷选项</span></a></li>
			<li><a id=2 href="../static/main.jsp"  target="main" onclick="mmclick('2')"><span>欢迎页</span></a></li>
		<%		
		}
		if(menu.equals("notice")){
		%>
			<li><a id=2 href="../inc/notice.jsp"  target="main" onclick="mmclick('2')"><span>公告列表</span></a></li>
			<li><a id=1 href="../inc/addnotice.jsp"  target="main" onclick="mmclick('1')"><span>添加公告</span></a></li>
		<%		
		}
		if(menu.equals("news")){
		%>
			<li><a id=1 href="../inc/news.jsp"  target="main" onclick="mmclick('1')"><span>新闻列表</span></a></li>
			<li><a id=2 href="../inc/newsclass.jsp"  target="main" onclick="mmclick('2')"><span>新闻栏目</span></a></li>
			<li><a id=3 href="../inc/addnews.jsp"  target="main" onclick="mmclick('3')"><span>添加新闻</span></a></li>
		<%		
		}
		if(menu.equals("user")){
		%>
			<li><a id=2 href="../inc/users.jsp"  target="main" onclick="mmclick('2')"><span>用户列表</span></a></li>
			<li><a id=1 href="../inc/adduser.jsp"  target="main" onclick="mmclick('1')"><span>添加用户</span></a></li>
		<%		
		}
		if(menu.equals("ad")){
		%>
			<li><a id=2 href="../inc/ads.jsp"  target="main" onclick="mmclick('2')"><span>广告列表</span></a></li>
			<li><a id=1 href="../inc/addad.jsp"  target="main" onclick="mmclick('1')"><span>添加广告</span></a></li>
		<%		
		}
		%>
			<li><div class="line" style="width:160px;height:20px; display:inline" ></div></li>
		</ul>
	</div>
		<%
	}
 %>
  </body>
</html>
