<%@ page language="java" pageEncoding="GBK"
	import="ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>

<%
	request.setCharacterEncoding("GBK");
	String uPass = request.getParameter("uPass");
	User loginuser = (User) session.getAttribute("user"); // 从session中取得登录用户
	UserDao userDao = new UserDaoImpl(); // 得到用户Dao的实例
	String msg = "";

	if (loginuser != null) {
		User user = new User();
		user.setUName(loginuser.getUName());
		user.setUPass(uPass);
		System.out.println(uPass);
		user.setUId(loginuser.getUId());
		System.out.println(user.getUId());
		user.setHead(loginuser.getHead());
		user.setGender(loginuser.getGender());
		userDao.updateUser(user);
		session.setAttribute("user", user);
		System.out.println("密码修改成功!");
		response.sendRedirect("../myinfo.jsp");
		return;
	} else {
		msg = "两次输入密码不同,修改不成功";
	}
	String forward = "/error.jsp?msg=" + msg;
	request.getRequestDispatcher(forward).forward(request, response);
%>
