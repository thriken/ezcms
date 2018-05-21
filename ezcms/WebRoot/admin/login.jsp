<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<title>登录</title>
<META http-equiv=Content-Type content="text/html; charset=GB2312">
<STYLE type=text/css>
U {
	WHITE-SPACE: nowrap; TEXT-DECORATION: none
}
BODY {
	FONT-SIZE: 12px; BACKGROUND: #fff; MARGIN: 0px; FONT-FAMILY: Tahoma,Verdana,Arial,宋体
}
.inputstyle {
	BORDER-RIGHT: #7f9db9 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #7f9db9 1px solid; PADDING-LEFT: 5px; FONT-SIZE: 14px; PADDING-BOTTOM: 5px; MARGIN: 0px; BORDER-LEFT: #7f9db9 1px solid; WIDTH: 190px; COLOR: #808080; PADDING-TOP: 5px; BORDER-BOTTOM: #7f9db9 1px solid; HEIGHT: 14px
}
H1 {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px
}
H2 {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px
}
H3 {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px
}
H4 {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px
}
A {
	COLOR: #097fd1
}
A:link {
	COLOR: #097fd1; TEXT-DECORATION: none
}
A:visited {
	COLOR: #097fd1; TEXT-DECORATION: none
}
A:active {
	COLOR: #097fd1; TEXT-DECORATION: none
}
A:hover {
	COLOR: #000; TEXT-DECORATION: underline
}

#login {
	BORDER-RIGHT: #99c2ee 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #99c2ee 1px solid; PADDING-LEFT: 0px; FLOAT: none; PADDING-BOTTOM: 5px; MARGIN: 0px auto; BORDER-LEFT: #99c2ee 1px solid; WIDTH: 370px; PADDING-TOP: 0px; BORDER-BOTTOM: #99c2ee 1px solid
}
#login H4 {
	PADDING-RIGHT: 0px; PADDING-LEFT: 30px; FONT-WEIGHT: bold; FONT-SIZE: 12px; BACKGROUND: url(static/images/qqicons.gif) repeat 0px 0px; PADDING-BOTTOM: 0px; PADDING-TOP: 7px; BORDER-BOTTOM: #438ece 1px solid; HEIGHT: 20px
}
#login H4 .btn_close {
	BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; FLOAT: right; BORDER-BOTTOM-WIDTH: 0px; WIDTH: 17px; CURSOR: pointer; MARGIN-RIGHT: 5px; HEIGHT: 17px; BORDER-RIGHT-WIDTH: 0px
}
#login H4 .btn_help {
	BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; FLOAT: right; BORDER-BOTTOM-WIDTH: 0px; WIDTH: 17px; CURSOR: pointer; MARGIN-RIGHT: 5px; HEIGHT: 17px; BORDER-RIGHT-WIDTH: 0px
}
#login H4 .btn_close {
	MARGIN-TOP: -1px; BACKGROUND: url(static/images/qqicons.gif) no-repeat 0px -284px
}
#login H4 .btn_help {
	BACKGROUND: url(qqicons.gif) no-repeat 0px -308px
}
#login UL {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 11px; MARGIN: 0px; PADDING-TOP: 12px
}
#login UL LI {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 7px; PADDING-TOP: 7px; LIST-STYLE-TYPE: none
}
#login UL LI SPAN {
	PADDING-RIGHT: 5px; FLOAT: left; WIDTH: 83px; PADDING-TOP: 7px; TEXT-ALIGN: right
}
#login UL LI SPAN {
	FONT-SIZE: 12px; COLOR: #535353
}

#login LABEL {
	PADDING-RIGHT: 0px; MARGIN-TOP: 10px; PADDING-LEFT: 8px; PADDING-BOTTOM: 0px; COLOR: #535353; PADDING-TOP: 0px; POSITION: absolute
}
.login_button {
	PADDING-RIGHT: 0px; PADDING-LEFT: 140px; FLOAT: none; PADDING-BOTTOM: 0px; MARGIN: 0px auto; PADDING-TOP: 0px
}
.btn {
	BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: bold; BORDER-LEFT-WIDTH: 0px; FONT-SIZE: 14px; BACKGROUND: url(static/images/button.png) repeat-x; BORDER-BOTTOM-WIDTH: 0px; WIDTH: 62px; CURSOR: pointer; COLOR: #2473a2; HEIGHT: 28px; BORDER-RIGHT-WIDTH: 0px
}
.main {
	BACKGROUND-COLOR: #ffffff
}
</STYLE>
</HEAD>
<BODY style="margin:200px; 0 0 -250px;;">
<DIV class=main id=login>
	<H4><U id=label_login_title>管理员登录</U></H4>
	<DIV id=qlogin style="DISPLAY: none;height:200px;"></DIV>
	<DIV id=web_login>
		<FORM id=loginform style="MARGIN: 0px" name=loginform action="function/dologin.jsp" method=post target=_self >
			<UL id=g_list>
		  		<LI class=err_m id=err_m>
		  		<LI id=g_u>
			  		<SPAN><U id=label_uin>帐号：</U></SPAN>
			  		<INPUT class=inputstyle id=u name=u style="IME-MODE: disabled" tabIndex=1> 
			  		<label><A tabIndex=7 href="#" target=_top>注册新帐号</A></label> 
			  	</LI>
		  		<LI id=g_p>
		    		<SPAN><U id=label_pwd>密码：</U></SPAN>
		    		<INPUT class=inputstyle id=p  tabIndex=2 type=password maxLength=16 name=p> 
		    		<LABEL><A  tabIndex=8 href="#" target=_top>忘了密码？</A></LABEL> 
		    	</LI>
			</UL>
			<DIV class=login_button>
				<INPUT class="btn" id="login_button" tabIndex=5 type="submit" value="登 录" onmouseover="this.style.backgroundImage='url(static/images/button-hovered.png)'" onmousedown="this.style.backgroundImage='url(static/images/button-pressed.png)'" " onmouseout="this.style.backgroundImage='url(static/images/button.png)'"> 
			</DIV>
		</FORM>
	</DIV>
</DIV>
</BODY>
</HTML>
