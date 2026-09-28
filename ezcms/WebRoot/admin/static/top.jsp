<%@ page language="java" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String m = request.getParameter("m");
if(m!=null){
	m="1";
}
String name = (String)session.getAttribute("Admin_Login");	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页 - 后台管理 - EZCMS</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Microsoft YaHei', Arial, sans-serif;
	background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}

.wrap {
	width: 100%;
	background: rgba(255, 255, 255, 0.95);
	box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
	border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

.wrap table {
	width: 100%;
	border-collapse: collapse;
}

.wrap td {
	vertical-align: middle;
	padding: 10px 0;
}

.wrap td:first-child {
	width: 160px;
	text-align: center;
	padding-left: 20px;
}

.wrap td:last-child {
	padding-right: 20px;
}

.wrap img {
	max-height: 40px;
	filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.1));
}

#menu {
	width: 100%;
}

#nav {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	list-style: none;
	gap: 0;
	height: 50px;
}

#nav li {
	position: relative;
}

#nav li:not(:last-child):after {
	content: "|";
	color: rgba(189, 195, 199, 0.5);
	position: absolute;
	right: -5px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 14px;
}

#nav li a {
	display: block;
	padding: 12px 20px;
	text-decoration: none;
	color: #2c3e50;
	font-weight: 500;
	font-size: 14px;
	transition: all 0.3s ease;
	border-radius: 6px;
	margin: 0 5px;
	position: relative;
	overflow: hidden;
}

#nav li a:hover {
	background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
	color: white;
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
}

#nav li a:before {
	content: "";
	position: absolute;
	top: 0;
	left: -100%;
	width: 100%;
	height: 100%;
	background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
	transition: left 0.5s ease;
}

#nav li a:hover:before {
	left: 100%;
}

#nav li a span {
	position: relative;
	z-index: 1;
}

/* 特殊样式 - 退出按钮 */
#nav li:last-child a {
	background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
	color: white;
	margin-left: 10px;
}

#nav li:last-child a:hover {
	background: linear-gradient(135deg, #c0392b 0%, #a93226 100%);
	transform: translateY(-2px);
	box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
}

/* 当前选中状态 */
#nav li a[target="left"]:hover {
	background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
}

/* 响应式设计 */
@media (max-width: 1200px) {
	#nav {
		justify-content: center;
		flex-wrap: wrap;
		height: auto;
		padding: 10px 0;
	}
	
	#nav li {
		margin: 5px 0;
	}
	
	#nav li:after {
		display: none;
	}
	
	.wrap td:first-child {
		width: auto;
		padding: 10px;
	}
	
	.wrap td:last-child {
		padding: 10px;
	}
}

@media (max-width: 768px) {
	#nav {
		flex-direction: column;
		align-items: stretch;
	}
	
	#nav li a {
		text-align: center;
		margin: 2px 0;
		border-radius: 4px;
	}
	
	.wrap table {
		display: block;
	}
	
	.wrap td {
		display: block;
		width: 100% !important;
		text-align: center;
	}
}
</style>
</head>
<body>
<%
  if(session.getAttribute("Admin_Login") == null)
    {
	%>
	<div style="padding: 20px; text-align: center; color: #e74c3c; font-weight: bold;">请先登录！</div>
	<%
  }else{
  %>
<div class="wrap">
	<table>
		<tr>
			<td><img src="../static/images/logo.gif" alt="EZCMS Logo" /></td>
			<td>       
			    <div id="menu">
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
			</td>
		</tr>
	</table>
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
                            <p style="font-size: 16px; margin-bottom: 10px;">❌ 加载失败</p>
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

</body>
</html>