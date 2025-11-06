package ezbbs.dao.impl;

import java.sql.*;
import java.util.*;

import ezbbs.dao.MessageDao;
import ezbbs.entity.Message;

public class MessageDaoImpl extends BaseDao implements MessageDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Message msg = null ;
	
	/**
	 * 保存短消息，返回0或1
	 */
	public int saveMsg(Message msg){
		String sql = "insert into tbl_message(note,sendUname,receiveUname,postTime) values(?,?,?,?)";
		String[] msgdetail = {msg.getNote(),msg.getSendUname(),msg.getReceiveUname(),msg.getPostTime()};
		return executeSQL(sql,msgdetail);
	}
	
	/**
	 * 删除短消息
	 */
	public int deleteMsg(int id) {
		String sql = "delete from tbl_message where id = " + id ;
		int rows = 0;
		/* 处理SQL,执行SQL */
		try {
			conn = getConn(); // 得到数据库连接
			pstmt = conn.prepareStatement(sql); // 得到PreparedStatement对象
			rows = pstmt.executeUpdate(); // 执行SQL语句
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 处理ClassNotFoundException异常
		} catch (SQLException e) {
			e.printStackTrace(); // 处理SQLException异常
		} finally {
			closeAll(conn, pstmt, null); // 释放资源
		}
		return rows;
	}

	/**
	 * 修改已阅读短消息标签
	 */
	public int readMsg(Message msg) {
		String sql = "update tbl_message set readSign=1 where id="+msg.getMid();
		return executeSQL(sql, null);
	}
	
	/**
	 * 根据mID 查找短消息
	 */
	public Message findMsg(int id ) {
		String sql = "select * from tbl_message where id = " + id ;
		try {
			conn = getConn(); // 得到数据库连接
			pstmt = conn.prepareStatement(sql); // 得到PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行SQL语句
			if(rs.next()){
				msg = new Message();
				msg.setNote(rs.getString("note"));
				msg.setPostTime(rs.getString("postTime"));
				msg.setReadSign(rs.getInt("readSign"));
				msg.setReceiveUname(rs.getString("receiveUname"));
				msg.setSendUname(rs.getString("sendUname"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 处理ClassNotFoundException异常
		} catch (SQLException e) {
			e.printStackTrace(); // 处理SQLException异常
		} finally {
			closeAll(conn, pstmt, null); // 释放资源
		}
		return msg;
	}
	
	public List listByReceivedUname(String uname) {
		String sql = "select * from tbl_message where receiveUname = '"+uname+"'";
		List<Message> list = new ArrayList<Message>();
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql); // 得到PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行SQL语句
			while(rs.next()){
				msg = new Message();
				msg.setMid(rs.getInt("id"));
				msg.setNote(rs.getString("note"));
				msg.setPostTime(rs.getString("postTime"));
				msg.setReadSign(rs.getInt("readSign"));
				msg.setReceiveUname(rs.getString("receiveUname"));
				msg.setSendUname(rs.getString("sendUname"));
				list.add(msg);
			}
			System.out.println(uname+"消息条数"+list.size());
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 处理ClassNotFoundException异常
		} catch (SQLException e) {
			e.printStackTrace(); // 处理SQLException异常
		} finally {
			closeAll(conn, pstmt, null); // 释放资源
		}
		return list;
	}
}
