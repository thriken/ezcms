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
	            	<h2 class="tit"><span class="down">����</span></h2>
	                <p>EZ CMS  ��һ����� ���� ��ȫ �ȶ� ��չ��ǿ�����¹���ϵͳ��</p>
	                <p>EZ CMS  ����Jsp + SQL Server ����</p>
	                <p>EZ CMS  ������׼������ JSP + MYSQL ���ݿ�</p>
					<p><strong>���ǵ�Ŀ�꣺</strong> �������ʺϹ������ʹ�õ�JSP���¹���ϵͳ��</p>
	                <p>��ѡ���ʺ��������ص�ַ:</p>
	                <div class="line"></div> 
	                <div id="download_buttons">
		                <div style="padding:5px; background:#FFFFE8; border:dashed 1px #ccc;">  
			                <p class="blue"><strong>EZ CMS v1.01 beta</strong></p>
			                <p>MD5: </p>
							<p>SHA1: </p>
			                <ul class="mirrors">
			                	<li>��������</li>
			                </ul>
						</div>
		                <div style="margin:80px 0 5px;font-size:14px;color:#c00;"><strong>��ʷ�汾</strong></div>
		                <div><strong>���°汾�İ�װ��ο�����RAR�ļ��е� readme.txt</strong></div>
		               	<div class="line"></div>
	                	<br />
	                </div>          
				</div>
                <div class="sidebar">
                <h2><span class="intrd">EZ CMS����</span></h2>
                <ul>
					<li>���̶�ģ�� Windows XP ���漰����ϰ�ߣ�������������Linux</li> 
					<li>�����е�����Ϳ���µ�5��28�գ���װʱ���貦�����ߣ�Ҳ���賤�õȴ�</li>
					<li>����FireFox ��ǿ�������ʱͨ�ſͻ��ˡ��������û��������� </li>
					<li>���ɹ���ǿ������Ѻõ� SMPlayer��Audacious ��ý�岥�����������û�����Ӱ���������� </li>
					<li>���� CompizConfig ������Ч����������������ʵ�����е��Ӿ���Ч�����������Ӿ�����</li>
					<li>�����˱�̣�����Ƶ�༭��רҵ�����</li>
					<li>���� Wine ģ����ƽ̨�������� Linux Ҳ������Windows���� </li>            
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