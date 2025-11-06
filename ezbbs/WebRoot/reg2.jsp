<%@ page language="java" pageEncoding="GBK" import="ezbbs.entity.*"%>
<%
	request.setCharacterEncoding("GBK");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
	<HEAD>
		<TITLE>论坛--新用户注册</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<Link rel="stylesheet" type="text/css" href="style/style.css" />
		<script language="javascript">
function check() {
 if(document.regForm.uName.value==""){
    alert("用户名不能为空");
    return false;
 }
 if(document.regForm.uPass.value==""){
    alert("密码不能为空");
    return false;
 }
 if(document.regForm.uPass.value != document.regForm.uPass1.value){
    alert("2次密码不一样");
    return false;
 }
}
</script>
	</HEAD>
	<BODY>
		<DIV>
			<IMG src="image/logo.gif">
		</DIV>
		<!--      用户信息、登录、注册        -->
		<%
			if (session.getAttribute("user") == null) {
		%>
		<DIV class="h">
			您尚未
			<a href="login.jsp">登录</a> &nbsp;| &nbsp;
			<A href="reg.jsp">注册</A> |
		</DIV>
		<%
			} else {
				User loginUser = (User) session.getAttribute("user");
		%>
		<DIV class="h">
			您好：
			<A href="myinfo.jsp"><%=loginUser.getUName()%></A> &nbsp;| &nbsp;
			<A href="manage/doLogout.jsp">登出</A> |
		</DIV>

		<%
			}
		%>

		<BR />
		<!--      导航        -->
		<DIV>
			&gt;&gt;
			<B><a href="index.jsp">论坛首页</a> </B>&gt;&gt;注册
		</DIV>
		<!--      用户注册表单        -->
		<DIV class="t" style="MARGIN-TOP: 15px" align="center">
			<FORM name="regForm" onSubmit="return check()" action="manage/doReg.jsp" method="post">
				<br />
				用&nbsp;户&nbsp;名 &nbsp;
				<INPUT class="input" tabIndex="1" tryp="text" maxLength="20" size="35" name="uName">
				<br />
				密&nbsp;&nbsp;&nbsp;&nbsp;码 &nbsp;
				<INPUT class="input" tabIndex="2" type="password" maxLength="20" size="40" name="uPass">
				<br />
				重复密码 &nbsp;
				<INPUT class="input" tabIndex="3" type="password" maxLength="20" size="40" name="uPass1">
				<br />
				性别 &nbsp; 女
				<input type="radio" name="gender" value="1">
				男
				<input type="radio" name="gender" value="2" checked="checked" />
				<br />
				请选择头像
					<select name=icon size=1 onChange="document.images['avatar'].src=options[selectedIndex].title;"  style="BACKGROUND-COLOR: #FFFFFF; BORDER-BOTTOM: 1px double; BORDER-LEFT: 1px double; BORDER-RIGHT: 1px double; BORDER-TOP: 1px double; COLOR: #000000">      
                              <option value='1.gif' title="image/head/1.gif">1.gif</option>
                              <option value='2.gif' title="image/head/2.gif">2.gif</option>
                              <option value='3.gif' title="image/head/3.gif">3.gif</option>
                              <option value='4.gif' title="image/head/4.gif">4.gif</option>
                              <option value='5.gif' title="image/head/5.gif">5.gif</option>
                              <option value='6.gif' title="image/head/6.gif">6.gif</option>
                              <option value='7.gif' title="image/head/7.gif">7.gif</option>
                              <option value='8.gif' title="image/head/8.gif">8.gif</option>
                              <option value='9.gif' title="image/head/9.gif">9.gif</option>
                              <option value='10.gif' title="image/head/10.gif">10.gif</option>
                              <option value='11.gif' title="image/head/11.gif">11.gif</option>
                              <option value='12.gif' title="image/head/12.gif">12.gif</option>
                              <option value='13.gif' title="image/head/13.gif">13.gif</option>
                              <option value='14.gif' title="image/head/14.gif">14.gif</option>
                              <option value='15.gif' title="image/head/15.gif">15.gif</option>     
                      </select>
				<br />
                          <td width=180 height=32>&nbsp;&nbsp;<img id=avatar src="image/head/1.gif" alt=个人形象代表 width="70" height="70">&nbsp;选择自己满意的头像</td>   
				
				
				<!-- 
				<img src="image/head/1.gif" />
				<input type="radio" name="head" value="1.gif" checked="checked">
				<img src="image/head/2.gif" />
				<input type="radio" name="head" value="2.gif">
				<img src="image/head/3.gif" />
				<input type="radio" name="head" value="3.gif">
				<img src="image/head/4.gif" />
				<input type="radio" name="head" value="4.gif">
				<img src="image/head/5.gif" />
				<input type="radio" name="head" value="5.gif">
				<BR />
				<img src="image/head/6.gif" />
				<input type="radio" name="head" value="6.gif">
				<img src="image/head/7.gif" />
				<input type="radio" name="head" value="7.gif">
				<img src="image/head/8.gif" />
				<input type="radio" name="head" value="8.gif">
				<img src="image/head/9.gif" />
				<input type="radio" name="head" value="9.gif">
				<img src="image/head/10.gif" />
				<input type="radio" name="head" value="10.gif">
				<BR />
				<img src="image/head/11.gif" />
				<input type="radio" name="head" value="11.gif">
				<img src="image/head/12.gif" />
				<input type="radio" name="head" value="12.gif">
				<img src="image/head/13.gif" />
				<input type="radio" name="head" value="13.gif">
				<img src="image/head/14.gif" />
				<input type="radio" name="head" value="14.gif">
				<img src="image/head/15.gif" />
				<input type="radio" name="head" value="15.gif">
				-->
				<br />
				<INPUT class="btn" tabIndex="4" type="submit" value="注 册">
			</FORM>
		</DIV>
		<!--      声明        -->
		<BR>
		<CENTER class="gray">
			2011 <a href="http://023sc.info" target="_blank">爱源码网</a> &copy;版权所有
		</CENTER>
	</BODY>
</HTML>
