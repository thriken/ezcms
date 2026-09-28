<%@ page language="java"  pageEncoding="UTF-8"%>
<%
if(session.getAttribute("Admin_Login") == null){
	%>
<script type="text/javascript">
    // 跳转顶层窗口到登录页面
    top.location.href = "login.jsp";
</script>
<% 
return;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>欢迎页 - EZCMS 后台管理系统</title>
<link href="../static/css/admin-main.css"  rel="stylesheet" type="text/css" />
</head>
<body>
<div class="admin-main-content slide-in-left">
    <h1>欢迎使用 EZCMS 后台管理系统</h1>
    
    <div class="card">
        <div class="card-header">
            <h2 class="card-title">系统概述</h2>
        </div>
        <p>EZ CMS 是一款免费、快速、安全、稳定、扩展性强的文章管理系统！</p>
        <p>采用 JSP + SQL Server 技术栈开发，未来计划支持 JSP + MySQL 数据库。</p>
        <p><strong>我们的目标：</strong> 开发最适合广大网友使用的 JSP 文章管理系统。</p>
    </div>
    
    <div class="card">
        <div class="card-header">
            <h2 class="card-title">系统特性</h2>
        </div>
        <ul style="list-style: none; padding: 0;">
            <li style="padding: 8px 0; border-bottom: 1px solid #ecf0f1;">
                <strong>? 现代化界面</strong> - 采用响应式设计，支持多种设备访问
            </li>
            <li style="padding: 8px 0; border-bottom: 1px solid #ecf0f1;">
                <strong>? 安全保障</strong> - 完善的安全机制，保护您的数据安全
            </li>
            <li style="padding: 8px 0; border-bottom: 1px solid #ecf0f1;">
                <strong>? 高性能</strong> - 优化的代码结构，确保系统运行流畅
            </li>
            <li style="padding: 8px 0; border-bottom: 1px solid #ecf0f1;">
                <strong>? 易于扩展</strong> - 模块化设计，方便功能扩展和定制
            </li>
            <li style="padding: 8px 0;">
                <strong>? 移动友好</strong> - 完美适配手机和平板设备
            </li>
        </ul>
    </div>
    
    <div class="card">
        <div class="card-header">
            <h2 class="card-title">快速开始</h2>
        </div>
        <p>您可以通过左侧菜单快速访问以下功能：</p>
        <ul style="list-style: none; padding: 0; display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin-top: 15px;">
            <li style="background: #f8f9fa; padding: 15px; border-radius: 6px; text-align: center;">
                <strong>? 新闻管理</strong><br>
                <span style="color: #7f8c8d; font-size: 12px;">发布和管理新闻内容</span>
            </li>
            <li style="background: #f8f9fa; padding: 15px; border-radius: 6px; text-align: center;">
                <strong>? 公告管理</strong><br>
                <span style="color: #7f8c8d; font-size: 12px;">发布系统公告信息</span>
            </li>
            <li style="background: #f8f9fa; padding: 15px; border-radius: 6px; text-align: center;">
                <strong>? 用户管理</strong><br>
                <span style="color: #7f8c8d; font-size: 12px;">管理用户账号信息</span>
            </li>
            <li style="background: #f8f9fa; padding: 15px; border-radius: 6px; text-align: center;">
                <strong>? 广告管理</strong><br>
                <span style="color: #7f8c8d; font-size: 12px;">配置广告位和内容</span>
            </li>
        </ul>
    </div>
    
    <div style="margin-top: 30px; padding: 20px; background: linear-gradient(135deg, #3498db 0%, #2980b9 100%); border-radius: 8px; color: white; text-align: center;">
        <h3 style="margin: 0 0 10px 0;">需要帮助？</h3>
        <p style="margin: 0; opacity: 0.9;">查看我们的文档或联系技术支持获取帮助</p>
    </div>
</div>
</body>
</html>