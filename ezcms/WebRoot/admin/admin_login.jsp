<%@ page language="java"  pageEncoding="GB18030"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>登录 - 后台管理 - EZ CMS</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="static/css/admin-main.css"  rel="stylesheet" type="text/css" />
  </head>
<body>
<div class="login-container">
    <div class="login-form fade-in">
        <div class="login-header">
            <h2>EZ CMS 后台管理系统</h2>
            <p>请使用您的账户登录</p>
        </div>
        
        <form id="loginform" name="loginform" action="function/dologin.jsp" method="post" target="_self">
            <div class="form-group">
                <label for="u">用户名</label>
                <input type="text" class="form-control" id="u" name="u" placeholder="请输入用户名" required>
            </div>
            
            <div class="form-group">
                <label for="p">密码</label>
                <input type="password" class="form-control" id="p" name="p" placeholder="请输入密码" required>
            </div>
            
            <div class="form-group text-center" style="margin-top: 30px;">
                <button type="submit" class="btn">登录</button>
            </div>
            
            <div class="text-center" style="margin-top: 20px;">
                <a href="#" style="color: #7f8c8d; text-decoration: none; font-size: 12px;">忘记密码？</a>
                <span style="color: #bdc3c7; margin: 0 10px;">|</span>
                <a href="#" style="color: #7f8c8d; text-decoration: none; font-size: 12px;">注册新账号</a>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    document.getElementById('loginform').addEventListener('submit', function(e) {
        var username = document.getElementById('u').value;
        var password = document.getElementById('p').value;
        
        if (!username || !password) {
            e.preventDefault();
            alert('请填写完整的登录信息');
            return false;
        }
        
        // 添加加载动画效果
        var submitBtn = this.querySelector('button[type="submit"]');
        submitBtn.innerHTML = '登录中...';
        submitBtn.disabled = true;
    });
    
    // 自动聚焦到用户名输入框
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('u').focus();
    });
</script>
</body>
</html>
