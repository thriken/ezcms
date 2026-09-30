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
    background: #ffffff;
    box-shadow: 0 2px 12px rgba(0,0,0,0.08);
    position: relative;
    z-index: 100;
    flex-shrink: 0;
}

.admin-main {
    display: flex;
    flex: 1;
    overflow: hidden;
    background: #f1f5f9;
}

.admin-sidebar {
    width: 220px;
    flex-shrink: 0;
    background: #f1f5f9;
    box-shadow: 2px 0 10px rgba(0,0,0,0.05);
    overflow-y: auto;
    overflow-x: hidden;
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

// 以 AJAX 方式提交表单，成功后跳回指定页面
window.doSubmit = function(form, back) {
    var fd = new URLSearchParams(new FormData(form));
    fetch(form.action, { method: 'POST', body: fd })
        .then(r => r.text())
        .then(msg => { if (msg && msg.trim()) alert(msg.trim()); window.navigateTo(back); })
        .catch(e => alert('提交失败：' + e));
    return false;
};

// 删除确认后异步删除并刷新列表
window.delItem = function(url, back) {
    if (confirm('确定要删除吗？此操作不可恢复。')) {
        fetch(url)
            .then(() => window.navigateTo(back))
            .catch(e => alert('删除失败：' + e));
    }
};
</script>
</body>
</html>

