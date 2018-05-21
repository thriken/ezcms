<%@ page language="java"  pageEncoding="GBK"%>
<div id="header" class="clearfix">
	<h1 id="logo"><a href="index.jsp">EZCSM - 简单JSPCMS</a></h1>
	<div class="desc">
		<p>等候环境对他的事业完全有利才动手的人，将永远不会成功。</p>
		<p>[在温室中想象南极，谁都可以做到！！]</p>
	</div>
	<div id="s115" class="clearfix">
		<form name="search" id="search" action="search.jsp" method="get" target="_top" onsubmit="cheackInput()">
			<div id="s115_input">
				<input type="text" name="q" class="int" onfocus="this.parentNode.className='focus'" onblur="if(this.value=='')this.parentNode.className=''" />
			</div>
			<input type="submit" value="搜 索" class="btn" />
		</form>
	</div> <!--/ search-->
</div>
