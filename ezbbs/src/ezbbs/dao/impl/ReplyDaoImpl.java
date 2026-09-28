package ezbbs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import ezbbs.dao.ReplyDao;
import ezbbs.entity.Reply;


public class ReplyDaoImpl extends BaseDao implements ReplyDao {
	private Connection conn = null; // 保存数据库连接
	private PreparedStatement pstmt = null; // 用于执行SQL语句
	private ResultSet rs = null; // 用户保存查询结果集
	String sql;

	public int addReply(Reply reply) {
		String sql = "insert into TBL_REPLY(content,publishTime,modifyTime,uId,topicId) values(?,?,?,"
				+ reply.getUid() + "," + reply.getTopicId() + ")";
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()); // 取得日期时间
		String[] parm = { reply.getContent(), time, time };
		return this.executeSQL(sql, parm);
	}

	public int deleteReply(int replyId) {
		this.sql = "delete from TBL_REPLY where replyId=" + replyId;
		System.out.println(sql);
		int n = 0;
		try {
			conn = this.getConn();
			pstmt = conn.prepareStatement(sql);
			n = pstmt.executeUpdate();
			System.out.println("成功删除" + n + "条回复");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}

	public int updateReply(Reply reply) {
		String sql = "update TBL_REPLY set content=? , modifyTime=? where replyId="
				+ reply.getReplyId();
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()); // 取得日期时间
		String[] parm = { reply.getContent(), time };
		return this.executeSQL(sql, parm); // 执行sql，并返回影响行数
	}

	public int findCountReply(int topicId) {
		int count = 0; // 主题数
		String sql = "select count(*) from TBL_REPLY where topicId=" + topicId;
		try {
			conn = this.getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1); // 取得主题数
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}
		return count;
	}

	public List findListReply(int page, int topicId) {
		List list = new ArrayList(); // 用来保存主题对象列表
		int pageSize = 20;
		int offset = 0; // MySQL偏移量，表示从第几条记录开始查询
		if (page < 1) {
			page = 1;
		} else {
			offset = pageSize * (page - 1); // 按页数取得偏移量，设每页可以显示20条回复
		}
		String sql = "SELECT * FROM TBL_REPLY WHERE topicId=" + topicId 
				+ " ORDER BY publishTime ASC LIMIT " + pageSize + " OFFSET " + offset;
		System.out.println(sql);
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行SQL，得到结果集

			/* 将结果集中的信息取出保存到list中 */
			while (rs.next()) {
				Reply reply = new Reply(); // 主题对象
				reply.setReplyId(rs.getInt("replyId"));
				reply.setContent(rs.getString("content"));
				reply.setPublishTime(rs.getString("publishTime"));
				reply.setModifyTime(rs.getString("modifyTime"));
				reply.setUid(rs.getInt("uId"));
				reply.setTopicId(rs.getInt("topicId"));
				list.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}
		return list;
	}

	public Reply findReply(int replyId) {
		String sql = "select * from TBL_REPLY where replyId=?";
		Reply reply = null;
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			pstmt.setInt(1, replyId); // 设置topicId为参数值
			rs = pstmt.executeQuery(); // 执行sql，取得查询结果集

			/* 将结果集中的信息取出保存到topic对象中，循环最多只会执行一次 */
			while (rs.next()) {
				reply = new Reply(); // 主题对象
				reply.setReplyId(rs.getInt("replyId"));
				reply.setContent(rs.getString("content"));
				reply.setPublishTime(rs.getString("publishTime"));
				reply.setModifyTime(rs.getString("modifyTime"));
				reply.setUid(rs.getInt("uId"));
				reply.setTopicId(rs.getInt("topicId"));
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}
		return reply;
	}

	/* 根据topicId查找回复数reply */
	public List findReplyList(int topicId) {
		String sql = "select * from TBL_REPLY where topicId =" + topicId;
		Reply reply = null;
		List listReply = new ArrayList(); // 用来保存主题对象列表
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行SQL，得到结果集
			/* 将结果集中的信息取出保存到list中 */
			while (rs.next()) {
				reply = new Reply(); // 主题对象
				reply.setReplyId(rs.getInt("replyId"));
				reply.setContent(rs.getString("content"));
				reply.setPublishTime(rs.getString("publishTime"));
				reply.setModifyTime(rs.getString("modifyTime"));
				reply.setUid(rs.getInt("uId"));
				listReply.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}

		return listReply;
	}

	public List findReplyList() {
		String sql = "select * from TBL_REPLY ";
		Reply reply = null;
		List listReply = new ArrayList(); // 用来保存主题对象列表
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行SQL，得到结果集
			/* 将结果集中的信息取出保存到list中 */
			while (rs.next()) {
				reply = new Reply(); // 主题对象
				reply.setReplyId(rs.getInt("replyId"));
				reply.setContent(rs.getString("content"));
				reply.setPublishTime(rs.getString("publishTime"));
				reply.setUid(rs.getInt("uId"));
				reply.setTopicId(rs.getInt("topicId"));
				listReply.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}

		return listReply;
	}

	public static void main(String[] args) {
		ReplyDaoImpl rdi = new ReplyDaoImpl();
		Reply reply = new Reply();
		/* 添加回复 */
		// reply.setTitle("落水");
		// reply.setContent("落水了");
		// reply.setUid(2);
		// reply.setTopicId(2);
		// rdi.addReply(reply);
		/* 根据replyID查找回复内容 */
		// rdi.findReply(2).getInfo();
		/* 根据标题修改内容 */
		// reply.setReplyId(1);
		// reply.setContent("青蛙跳落水！");
		// rdi.updateReply(reply);
		/* 根据replyId删除回复 */
		// rdi.deleteReply(3);
		// rdi.findCountReply(2);
		// ReplyDao replyDao = new ReplyDaoImpl();
		// List listReply = rdi.findReplyList();
		// for (int i = 0; i < listReply.size(); i++) {
		// reply = (Reply) listReply.get(i); // 主题对象
		// System.out.println("第i=" + i);
		// System.out.println("replyId:" + reply.getReplyId());
		// System.out.println("content:" + reply.getContent());
		// }
		List findlistReply = rdi.findListReply(1, 15);
		for (int i = 0; i < findlistReply.size(); i++) {
			reply = (Reply) findlistReply.get(i);
			System.out.println(i + 1 + "\t" + reply.getContent());
		}
	}
}
