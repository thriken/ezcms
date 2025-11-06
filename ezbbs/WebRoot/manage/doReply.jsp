<%@ page language="java" pageEncoding="GBK"	import="ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%
	request.setCharacterEncoding("GBK");
	String content = request.getParameter("content"); // 取得帖子内容
	ReplyDao replyDao = new ReplyDaoImpl(); // 得到主题Dao的实例
	User user = (User) session.getAttribute("user"); // 从session中取得登录用户
	int boardId = Integer.parseInt(request.getParameter("bid")); // 取得版块id
	int topicId = Integer.parseInt(request.getParameter("tid")); // 取得主题id

	if (user != null) { // 判断用户是否已经登录
		Reply reply = new Reply();
		reply.setContent(content);
		reply.setTopicId(topicId);
		reply.setUid(user.getUId());
		// 发表时间和修改时间将由Dao类生成
		replyDao.addReply(reply); // 保存主题帖子
		response.sendRedirect("../detail.jsp?diPage=1&bid="	+ boardId + "&tid=" + topicId); // 跳转
		return;
	}
	request.getRequestDispatcher("/error.jsp?msg=您未登录").forward(request, response);
%>
