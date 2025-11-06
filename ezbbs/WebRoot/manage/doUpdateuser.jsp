<%@ page language="java" pageEncoding="GBK"
	import="ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>

<%
	request.setCharacterEncoding("GBK");
	String uName = request.getParameter("uName").trim(); // 取得请求中的登录名
	int gender = Integer.parseInt(request.getParameter("gender"));// 取得性别 
	String head = request.getParameter("head"); // 取得头像图片名
	User loginuser = (User) session.getAttribute("user"); // 从session中取得登录用户
	UserDao userDao = new UserDaoImpl(); // 得到用户Dao的实例
	String msg = "";

	if (loginuser != null) {
		User user = new User();
		user.setUName(uName);
		System.out.println(uName);
		user.setUPass(loginuser.getUPass());
		user.setHead(head);
		user.setGender(gender);
		user.setUId(loginuser.getUId());
		System.out.println(user.getUId());
		userDao.updateUser(user);
		session.setAttribute("user", user);
		response.sendRedirect("../myinfo.jsp");
		return;
	} else {
		msg = "修改不成功";
	}
	String forward = "/error.jsp?msg=" + msg;
	request.getRequestDispatcher(forward).forward(request, response);
%>