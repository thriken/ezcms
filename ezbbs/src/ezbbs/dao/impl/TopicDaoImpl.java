/*
 * s2jsp.lg.dao.impl.ReplyDaoImpl.java
 * 2009-6-23
 * ReplyDao的实现类
 */
package ezbbs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

import ezbbs.dao.TopicDao;
import ezbbs.entity.Topic;


public class TopicDaoImpl extends BaseDao implements TopicDao {
	private Connection conn = null; // 保存数据库连接
	private PreparedStatement pstmt = null; // 用于执行SQL语句
	private ResultSet rs = null; // 用户保存查询结果集

	/**
	 * 添加主题
	 * 
	 * @param topic
	 * @return 增加条数
	 */
	public int addTopic(Topic topic) {
		String sql = "insert into TBL_TOPIC(title,content,publishTime,modifyTime,uId,boardId) values(?,?,?,?,"
				+ topic.getUid() + "," + topic.getBoardId() + ")";
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()); // 取得日期时间
		String[] parm = { topic.getTitle(), topic.getContent(), time, time };
		System.out.println("添加成功!");
		return this.executeSQL(sql, parm); // 执行sql，并返回影响行数
	}

	/**
	 * 删除主题
	 * 
	 * @param topicId
	 * @return 删除条数
	 */
	public int deleteTopic(int topicId) {
		String sql = "delete from TBL_TOPIC where topicId=" + topicId;
		return this.executeSQL(sql, null); // 执行sql，并返回影响行数
	}

	/**
	 * 更新主题
	 * 
	 * @param topic
	 * @return 更新条数
	 */
	public int updateTopic(Topic topic) {
		String sql = "update TBL_TOPIC set title=?, content=?, modifyTime=? where topicId="
				+ topic.getTopicId();
		String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()); // 取得日期时间
		String[] parm = { topic.getTitle(), topic.getContent(), time };
		return this.executeSQL(sql, parm); // 执行sql，并返回影响行数
	}

	/**
	 * 查找一个主题的详细信息
	 * 
	 * @param topicId
	 * @return 主题信息
	 */
	public Topic findTopic(int topicId) {
		String sql = "select * from TBL_TOPIC where topicId=?";
		Topic topic = null;
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			pstmt.setInt(1, topicId); // 设置topicId为参数值
			rs = pstmt.executeQuery(); // 执行sql，取得查询结果集

			/* 将结果集中的信息取出保存到topic对象中，循环最多只会执行一次 */
			while (rs.next()) {
				topic = new Topic(); // 主题对象
				topic.setTopicId(rs.getInt("topicId"));
				topic.setTitle(rs.getString("title"));
				topic.setContent(rs.getString("content"));
				topic.setPublishTime(rs.getString("publishTime"));
				topic.setModifyTime(rs.getString("modifyTime"));
				topic.setUid(rs.getInt("uId"));
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}
		return topic;
	}

	/**
	 * 查找主题List
	 * 
	 * @param page
	 * @return 主题List
	 */
	public List findListTopic(int page, int boardId) {
		List list = new ArrayList(); // 用来保存主题对象列表
		int pageSize = 10;
		int rowBegin = 0; // 开始行数，表示每页第一条记录在数据库中的行数
		String sql = "";
		if (page < 1) {
			page = 1;
			sql = "select * from TBL_TOPIC where boardId=" + boardId + " order by publishTime desc limit " + pageSize;
		} else {
			rowBegin = pageSize * (page - 1); // 按页数取得开始行数，设每页可以显示10条回复
			sql = "select * from TBL_TOPIC where boardId=" + boardId + " order by publishTime desc limit " + rowBegin + "," + pageSize;
		}

		System.out.println(sql);
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行SQL，得到结果集

			/* 将结果集中的信息取出保存到list中 */
			while (rs.next()) {
				Topic topic = new Topic(); // 主题对象
				topic.setTopicId(rs.getInt("topicId"));
				topic.setTitle(rs.getString("title"));
				topic.setContent(rs.getString("content"));
				topic.setPublishTime(rs.getString("publishTime"));
				topic.setModifyTime(rs.getString("modifyTime"));
				topic.setUid(rs.getInt("uId"));
				topic.setBoardId(rs.getInt("boardId"));
				list.add(topic);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}
		return list;
	}

	// 根据boardId查找Topic主题
	public List findTopicList(int boardId) {
		String sql = "select * from TBL_TOPIC where boardId=" + boardId;
		List listTopic = new ArrayList();
		Topic topic = null;
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行SQL，得到结果集

			/* 将结果集中的信息取出保存到list中 */
			while (rs.next()) {
				topic = new Topic(); // 主题对象
				topic.setTopicId(rs.getInt("topicId"));
				topic.setTitle(rs.getString("title"));
				topic.setContent(rs.getString("content"));
				topic.setPublishTime(rs.getString("publishTime"));
				topic.setModifyTime(rs.getString("modifyTime"));
				topic.setUid(rs.getInt("uId"));
				listTopic.add(topic);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}
		return listTopic;
	}

	/**
	 * 根据版块id取得该版块的主题数
	 * 
	 * @param boardId
	 * @return 主题数
	 */
	public int findCountTopic(int boardId) {
		int count = 0; // 主题数
		String sql = "select count(*) from TBL_TOPIC where boardId=" + boardId;
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

	/* 查找所有Topic */
	public List findTopicList() {
		String sql = "select * from TBL_TOPIC";
		Topic topic = null;
		List listTopic = new ArrayList(); // 用来保存主题对象列表
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行SQL，得到结果集
			/* 将结果集中的信息取出保存到list中 */
			while (rs.next()) {
				topic = new Topic(); // 主题对象
				topic.setTopicId(rs.getInt("topicId"));
				topic.setTitle(rs.getString("title"));
				topic.setContent(rs.getString("content"));
				topic.setPublishTime(rs.getString("publishTime"));
				topic.setModifyTime(rs.getString("modifyTime"));
				topic.setUid(rs.getInt("uId"));
				topic.setBoardId(rs.getInt("boardId"));
				listTopic.add(topic);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}

		return listTopic;
	}

	public static void main(String[] args) {
		TopicDaoImpl tdi = new TopicDaoImpl();
		Topic topic = new Topic();
		/* 添加 */
		// topic.setTitle("你傻B1");
		// topic.setContent("我是第一傻B的人");
		// topic.setUid(3);
		// topic.setBoardId(3);
		// tdi.addTopic(topic);
		/* 删除 */
		// tdi.deleteTopic(1);
		/* 根据topicId修改内容 */
		// topic.setTopicId(3);
		// topic.setTitle("你超笨");
		// topic.setContent("你笨得可怜!!!");
		// tdi.updateTopic(topic);
		// /*查找*/
		// tdi.findTopic(9).getInfo();
		// tdi.findCountTopic(1);
		// List findListTopic = tdi.findListTopic(1, 7); // 取得主题列表
		// for (int i = 0; i < findListTopic.size(); i++) {
		// topic = (Topic) findListTopic.get(i);
		// System.out.println(i + 1 + "\t" + topic.getTitle());
		//		}
		/* 根据boardId查找Topic主题 */
		// List findTopic = tdi.findTopicList(4);
		// for(int i=0;i<findTopic.size();i++) {
		// topic = (Topic)findTopic.get(i); // 主题对象
		// System.out.println("第i="+i);
		// System.out.println("主题ID："+topic.getTopicId());
		// System.out.println("主题名称："+topic.getTitle());
		// System.out.println("主题内容："+topic.getContent());
		// }
		/* 取出所有主题 */
		// List listTopic = tdi.findTopicList();
		// for(int i=0;i<listTopic.size();i++) {
		// topic = (Topic)listTopic.get(i); // 主题对象
		// System.out.println("第i="+i);
		// System.out.println("主题ID："+topic.getTopicId());
		// System.out.println("主题名称："+topic.getTitle());
		// System.out.println("主题内容："+topic.getContent());
		// }
	}
}