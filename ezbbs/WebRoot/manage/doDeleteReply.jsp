<%@ page language="java" pageEncoding="GBK"
	import="ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%
	request.setCharacterEncoding("GBK");
	ReplyDao replyDao = new ReplyDaoImpl(); // 得到回复Dao的实例
	int boardId = Integer.parseInt(request.getParameter("bid")); // 取得版块id
	int topicId = Integer.parseInt(request.getParameter("tid")); // 取得主题id
	int replyId = Integer.parseInt(request.getParameter("rid")); // 取得回复id
	User user = (User) session.getAttribute("user"); // 从session中取得登录用户
	String msg = "";
	if (user != null
			&& user.getUId() == replyDao.findReply(replyId).getUid()) { // 判断用户权限
		replyDao.deleteReply(replyId); // 根据回复id删除回复
		response.sendRedirect("../detail.jsp?diPage=1&bid="
				+ boardId + "&tid=" + topicId); // 跳转
		return;
	} else {
		msg = "您无此权限";
	}
	String forward = "/error.jsp?msg=" + msg;
	request.getRequestDispatcher(forward).forward(request, response);
%>