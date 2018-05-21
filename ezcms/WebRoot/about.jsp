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
<title>�������� - EZCMS</title>
<link href="static/css/style.css"  rel="stylesheet" type="text/css" />
</head>

<body>

<div class="wrap">
<%@ include file="static/html/top_logo.jsp" %>
    <div id="menu">
        <ul id="language">
        	<li><a href="#"  class="bold">��������</a><span style="margin:0 5px;">|</span><a href="#" >��������</a><span style="margin:0 5px;">|</span><a href="#"  id="change_language" class="lang">English</a></li>
        </ul>
        
        <ul id="nav">
       	<li><a href="index.jsp" ><span>�� ҳ</span></a></li>
        <li><a href="release_notice.jsp" ><span>����</span></a></li>
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
	            	<h2 class="tit"><span class="down">ϵͳ����</span></h2>
	                <p>Ylmf OS  ��һ����� ���� ��ȫ �ȶ� ��չ��ǿ��Linux����ϵͳ��</p>
	                <p>Ylmf OS  �س�Windowsʹ��ϰ�ߣ�����ʵ���ԣ�����ѧϰ���칫�����������ֵ�����ѡ��</p>
					<p><strong>���ǵ�ʹ����</strong> �������ʺϹ���ʹ�õ�����Linux����ϵͳ��</p>
	                <p>��ѡ���ʺ��������ص�ַ: <a href="javascript:void(0)" onclick="copyCode('Ylmf OS����ϵͳ��������Դ��������һ����ѣ�\n֧������������ҵ��һ�������ز��ԣ� http://www.xp.com');">(���ƴ���ַ����������)</a> <span style=" color:#090;display:none;" id="copy_success_msg">�Ѿ��ɹ����Ƶ�ճ���壡</span></p>
	                
	                <div class="line"></div> 
	                            
	                <div id="download_buttons">
		                <div style="padding:5px; background:#FFFFE8; border:dashed 1px #ccc;">  
			                <p class="blue"><strong>Ylmf OS 3.0 ��ʽ��</strong></p>
			                <p>MD5: 919794E3D9B035A5A895C3E1D1818F95</p>
							<p>SHA1: 6E672A667155E442A612F69CCBA1BF6C44752D8D</p>
			                <ul class="mirrors">
			                	<li><a href=" javascript:window.location='http://down.ylmf.org/Ylmf_OS_3.0.iso'"  target="_blank">���ص�ַһ</a></li>
			                	<li><a href="http://xiazai.xiazaiba.com/Soft/Y/Ylmf_OS_3.0.iso" target="_blank">���ص�ַ��</a></li>
			                </ul>
						</div>
               		</div>
				</div>
                
                <div class="sidebar">
	                <h2><span class="intrd">Ylmf OSϵͳ����</span></h2>
	                <ul>
					<li>���̶�ģ�� Windows XP ���漰����ϰ�ߣ�������������Linux</li> 
					<li>�����е������Ϳ���µ�5��28�գ���װʱ���貦�����ߣ�Ҳ���賤�õȴ�</li>
					<li>����FireFox ��ǿ�������ʱͨ�ſͻ��ˡ��������û��������� </li>
					<li>���ɹ���ǿ������Ѻõ� SMPlayer��Audacious ��ý�岥�����������û�����Ӱ���������� </li>
					<li>���� CompizConfig ������Ч����������������ʵ�����е��Ӿ���Ч�����������Ӿ�����</li>
					<li>�����˱�̣�����Ƶ�༭��רҵ������</li>
					<li>���� Wine ģ����ƽ̨�������� Linux Ҳ������Windows���� </li>
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
		//alert("�Ѿ����Ƶ�ճ���壬�����ʹ��Ctrl+V ������Ҫ�ĵط�ȥ��Ŷ��  ");
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
			alert("����firefox��ȫ�������������м������������򿪡�about:config����signed.applets.codebase_principal_support������Ϊtrue��֮�����ԣ����·��Ϊfirefox��Ŀ¼/greprefs/all.js");
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