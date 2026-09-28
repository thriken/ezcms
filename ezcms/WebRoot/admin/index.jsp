<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ include file="function/checkLogin.jsp" %> 
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>后台管理 - EZCMS</title>
<link rel="stylesheet" href="static/css/admin-main.css">
<style>
.admin-container {
    display: flex;
    flex-direction: column;
    height: 100vh;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.admin-header {
    height: 80px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    box-shadow: 0 2px 20px rgba(0,0,0,0.1);
    position: relative;
    z-index: 100;
}

.admin-main {
    display: flex;
    flex: 1;
    overflow: hidden;
}

.admin-sidebar {
    width: 200px;
    background: linear-gradient(135deg, #4a5568 0%, #2d3748 100%);
    box-shadow: 2px 0 10px rgba(0,0,0,0.1);
    overflow-y: auto;
}

.admin-content {
    flex: 1;
    background: #f8fafc;
    overflow-y: auto;
    padding: 20px;
}

/* 响应式设计 */
@media (max-width: 768px) {
    .admin-sidebar {
        width: 60px;
    }
    
    .admin-content {
        padding: 15px;
    }
}
</style>
</head>
<body>
<div class="admin-container">
    <!-- 顶部导航栏 -->
    <div class="admin-header" id="header-container">
        <!-- 使用Ajax加载顶部内容 -->
    </div>
    
    <div class="admin-main">
        <!-- 左侧边栏 -->
        <div class="admin-sidebar" id="sidebar-container">
            <!-- 使用Ajax加载侧边栏内容 -->
        </div>
        
        <!-- 主内容区域 -->
        <div class="admin-content" id="content-container">
            <!-- 使用Ajax加载主内容 -->
        </div>
    </div>
</div>

<script>
// 使用Ajax动态加载各个部分的内容
document.addEventListener('DOMContentLoaded', function() {
    // 加载顶部导航栏
    fetch('static/top.jsp')
        .then(response => response.text())
        .then(html => {
            document.getElementById('header-container').innerHTML = html;
            // 执行顶部导航栏的脚本
            setTimeout(() => {
                const scripts = document.getElementById('header-container').getElementsByTagName('script');
                for (let script of scripts) {
                    eval(script.innerHTML);
                }
            }, 100);
        })
        .catch(error => console.error('加载顶部导航栏失败:', error));
    
    // 加载左侧边栏
    fetch('static/left.jsp?m=index')
        .then(response => response.text())
        .then(html => {
            document.getElementById('sidebar-container').innerHTML = html;
            // 执行侧边栏的脚本
            setTimeout(() => {
                const scripts = document.getElementById('sidebar-container').getElementsByTagName('script');
                for (let script of scripts) {
                    eval(script.innerHTML);
                }
            }, 100);
        })
        .catch(error => console.error('加载左侧边栏失败:', error));
    
    // 加载主内容
    fetch('static/main.jsp')
        .then(response => response.text())
        .then(html => {
            document.getElementById('content-container').innerHTML = html;
            // 执行主内容的脚本
            setTimeout(() => {
                const scripts = document.getElementById('content-container').getElementsByTagName('script');
                for (let script of scripts) {
                    eval(script.innerHTML);
                }
            }, 100);
        })
        .catch(error => console.error('加载主内容失败:', error));
});

// 处理内容区域的导航
window.navigateTo = function(url) {
    fetch(url)
        .then(response => response.text())
        .then(html => {
            document.getElementById('content-container').innerHTML = html;
            // 执行新内容的脚本
            setTimeout(() => {
                const scripts = document.getElementById('content-container').getElementsByTagName('script');
                for (let script of scripts) {
                    try {
                        eval(script.innerHTML);
                    } catch (e) {
                        console.error('脚本执行错误:', e);
                    }
                }
            }, 100);
        })
        .catch(error => console.error('加载内容失败:', error));
};
</script>
</body>
</html>

