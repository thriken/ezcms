<%@ page language="java" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String name = (String)session.getAttribute("Admin_Login");	
%>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.topbar {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 72px;
	padding: 0 28px;
	background: #ffffff;
	box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
	font-family: 'Microsoft YaHei', Arial, sans-serif;
}

.topbar .logo img {
	max-height: 44px;
	display: block;
	filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.1));
}

#nav {
	display: flex;
	align-items: center;
	list-style: none;
	gap: 4px;
	margin: 0;
	padding: 0;
}

#nav li a {
	display: block;
	padding: 14px 26px;
	text-decoration: none;
	color: #2c3e50;
	font-weight: 600;
	font-size: 17px;
	white-space: nowrap;
	border-radius: 8px;
	transition: all 0.25s ease;
}

#nav li a:hover {
	background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
	color: #ffffff;
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
}

/* 退出按钮 */
#nav li:last-child a {
	background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
	color: #ffffff;
	margin-left: 14px;
}

#nav li:last-child a:hover {
	background: linear-gradient(135deg, #c0392b 0%, #a93226 100%);
	box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
}

.topbar .hello {
	font-size: 14px;
	color: #7f8c8d;
	margin-right: 16px;
	white-space: nowrap;
}

@media (max-width: 1100px) {
	#nav li a {
		padding: 12px 16px;
		font-size: 15px;
	}
}

@media (max-width: 900px) {
	.topbar {
		flex-direction: column;
		height: auto;
		padding: 10px;
		gap: 8px;
	}
	#nav {
		flex-wrap: wrap;
		justify-content: center;
	}
	#nav li a {
		padding: 10px 16px;
		font-size: 15px;
	}
}
</style>

<%
  if(session.getAttribute("Admin_Login") == null)
    {
	%>
	<div class="topbar">
		<span style="padding: 20px; color: #e74c3c; font-weight: bold;">请先登录！</span>
	</div>
	<%
  }else{
  %>
<div class="topbar">
	<div class="logo"><img src="../static/images/logo.gif" alt="EZCMS Logo" /></div>
	<ul id="nav">
		<li><a href="javascript:void(0)" onclick="refreshLeftMenu('index')"><span>首 页</span></a></li>
		<li><a href="javascript:void(0)" onclick="refreshLeftMenu('notice')"><span>公 告</span></a></li>
		<li><a href="javascript:void(0)" onclick="refreshLeftMenu('news')"><span>新 闻</span></a></li>
		<li><a href="javascript:void(0)" onclick="refreshLeftMenu('user')"><span>用 户</span></a></li>
		<li><a href="javascript:void(0)" onclick="refreshLeftMenu('ad')"><span>广 告</span></a></li>
		<li><a href="javascript:void(0)" onclick="refreshLeftMenu('menu')"><span>菜单管理</span></a></li>
		<li><a href="function/dologout.jsp"  target="_top"><span>退出</span></a></li>
	</ul>
</div>
<%} %>

<script>
// 刷新左侧菜单内容
function refreshLeftMenu(menuType) {
    // 显示加载动画
    const sidebar = document.getElementById('sidebar-container');
    if (sidebar) {
        sidebar.innerHTML = `
            <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                <div style="text-align: center;">
                    <div style="width: 40px; height: 40px; border: 3px solid #f3f3f3; border-top: 3px solid #3498db; border-radius: 50%; animation: spin 1s linear infinite; margin: 0 auto;"></div>
                    <p style="margin-top: 10px; color: #666; font-size: 14px;">加载中...</p>
                </div>
            </div>
            <style>
                @keyframes spin {
                    0% { transform: rotate(0deg); }
                    100% { transform: rotate(360deg); }
                }
            </style>
        `;
    }
    
    // 使用fetch加载左侧菜单内容
    fetch('static/left.jsp?m=' + menuType)
        .then(response => {
            if (!response.ok) {
                throw new Error('网络请求失败: ' + response.status);
            }
            return response.text();
        })
        .then(html => {
            if (sidebar) {
                sidebar.innerHTML = html;
                
                // 执行左侧菜单中的脚本
                setTimeout(() => {
                    const scripts = sidebar.getElementsByTagName('script');
                    for (let script of scripts) {
                        try {
                            if (script.innerHTML.trim()) {
                                eval(script.innerHTML);
                            }
                        } catch (e) {
                            console.error('脚本执行错误:', e);
                        }
                    }
                    
                    // 添加点击效果反馈
                    const currentLink = document.querySelector(`a[onclick*="${menuType}"]`);
                    if (currentLink) {
                        currentLink.style.transform = 'scale(0.95)';
                        currentLink.style.opacity = '0.8';
                        setTimeout(() => {
                            currentLink.style.transform = '';
                            currentLink.style.opacity = '';
                        }, 200);
                    }
                }, 100);
            }
        })
        .catch(error => {
            console.error('加载左侧菜单失败:', error);
            if (sidebar) {
                sidebar.innerHTML = `
                    <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                        <div style="text-align: center; color: #e74c3c;">
                            <p style="font-size: 16px; margin-bottom: 10px;">加载失败</p>
                            <p style="font-size: 12px; color: #666;">请刷新页面重试</p>
                            <button onclick="refreshLeftMenu('${menuType}')" style="margin-top: 10px; padding: 5px 15px; background: #3498db; color: white; border: none; border-radius: 3px; cursor: pointer;">重试</button>
                        </div>
                    </div>
                `;
            }
        });
}

// 页面加载完成后自动设置当前菜单状态
document.addEventListener('DOMContentLoaded', function() {
    // 检查URL参数，如果有m参数则自动加载对应菜单
    const urlParams = new URLSearchParams(window.location.search);
    const menuType = urlParams.get('m');
    if (menuType) {
        setTimeout(() => {
            refreshLeftMenu(menuType);
        }, 500);
    }
});
</script>
