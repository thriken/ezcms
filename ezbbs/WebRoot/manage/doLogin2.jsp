<%@ page language="java" pageEncoding="GBK"
	import="ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%
	request.setCharacterEncoding("GBK");

	String uName = request.getParameter("uName").trim(); // 取得请求中的登录名
	String uPass = request.getParameter("uPass").trim(); // 取得请求中的密码
	String url = request.getParameter("ref");
	UserDao userDao = new UserDaoImpl(); // 得到用户Dao的实例
	User user = (User) session.getAttribute("user"); // 从session中取得登录用户
	String msg = "";
	if (user == null) {
		user = userDao.findUser(uName); // 根据请求的登录名和密码查找用户
		//uPass = user.getUPass();
		System.out.println("uName:" + uName + "\t" + "uPass:" + uPass);
		if (user != null && user.getUPass().trim().equals(uPass)) {
			session.setAttribute("user", user); // 如果查找的用户不为空并且密码正确，保存用户信息
			response.sendRedirect("../"+url); // 转发请求到ref
			return;
		} else {
			msg = "用户名或密码错误";
		}
	} else {
		msg = "重复登录";
	}
	String forward = "/error.jsp?msg=" + msg;
	request.getRequestDispatcher(forward).forward(request, response);
%>
