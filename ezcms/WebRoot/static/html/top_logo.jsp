<%@ page language="java"  pageEncoding="GBK"%>
<div id="header" class="clearfix">
	<h1 id="logo"><a href="index.jsp">EZCSM - ��JSPCMS</a></h1>
	<div class="desc">
		<p>�Ⱥ򻷾���������ҵ��ȫ�����Ŷ��ֵ��ˣ�����Զ����ɹ���</p>
		<p>[�������������ϼ���˭��������������]</p>
	</div>
	<div id="s115" class="clearfix">
		<form name="search" id="search" action="search.jsp" method="get" target="_top" onsubmit="cheackInput()">
			<div id="s115_input">
				<input type="text" name="q" class="int" onfocus="this.parentNode.className='focus'" onblur="if(this.value=='')this.parentNode.className=''" />
			</div>
			<input type="submit" value="�� ��" class="btn" />
		</form>
	</div> <!--/ search-->
</div>
