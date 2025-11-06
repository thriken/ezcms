<%@ page language="java" pageEncoding="GBK"
	import="java.util.*,ezbbs.entity.*,ezbbs.dao.*,ezbbs.dao.impl.*"%>
<div align="left">
	<%
		request.setCharacterEncoding("GBK");
		ReplyDao replyDao = new ReplyDaoImpl(); // 得到主题Dao的实例
		int boardId = Integer.parseInt(request.getParameter("bid")); // 取得版块id
		int topicId = Integer.parseInt(request.getParameter("tid")); // 取得主题id
		int replyId = Integer.parseInt(request.getParameter("rid")); // 取得回复id
		String content = request.getParameter("content").trim(); // 取得帖子内容
		User user = (User) session.getAttribute("user"); // 从session中取得登录用户
		String msg = "";

		if (user != null
				&& user.getUId() == replyDao.findReply(replyId).getUid()) { // 判断用户权限                                               // 判断用户是否已经登录
			Reply reply = new Reply();
			reply.setReplyId(replyId);
			reply.setContent(content);
			System.out.println(content);
			// 修改时间由Dao类生成
			replyDao.updateReply(reply); // 修改主题
			response.sendRedirect("../detail.jsp?diPage=1&bid="	+ boardId + "&tid=" + topicId);// 跳转
			return;
		} else {
			msg = "您无此权限";
		}
		String forward = "/error.jsp?msg=" + msg;
		request.getRequestDispatcher(forward).forward(request, response);
	%>
</div>