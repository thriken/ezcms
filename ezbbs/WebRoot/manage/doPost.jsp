<%@ page language="java" pageEncoding="GBK"	import="ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<%
	request.setCharacterEncoding("GBK");
	String title = request.getParameter("title"); // 取得帖子标题
	String content = request.getParameter("content"); // 取得帖子内容
	TopicDao topicDao = new TopicDaoImpl(); // 得到主题Dao的实例
	User user = (User) session.getAttribute("user"); // 从session中取得登录用户
	int boardId = Integer.parseInt(request.getParameter("bid")); // 取得版块id

	if (user != null) { // 判断用户是否已经登录
		Topic topic = new Topic();
		topic.setTitle(title);
		topic.setContent(content);
		topic.setBoardId(boardId);
		topic.setUid(user.getUId());
		// 发表时间和修改时间将由Dao类生成
		topicDao.addTopic(topic); // 保存主题帖子
		response
				.sendRedirect("../list.jsp?diPage=1&bid=" + boardId); // 跳转
		System.out.println(boardId);
		return;
	}
	request.getRequestDispatcher("/error.jsp?msg=您未登录").forward(request, response);
%>