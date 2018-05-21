package ezcms.dao.impl;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

import ezcms.dao.*;
import ezcms.entity.*;

public class NoticeDaoImpl extends BaseDao implements NoticeDao {
	private Connection conn = null; // 保存数据库连接
	private PreparedStatement pstmt = null; // 用于执行SQL语句
	private ResultSet rs = null; // 用户保存查询结果集
	private int rows = 0;       //返回影响的夯行数
	String now = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); //当前时间
	private Notice notice = null;
	List<Notice> nl = new ArrayList<Notice>();
	
	public int addNotice(Notice notice) throws Exception {
		String sql = "insert ez_Notice values('?','?','?')";
		String[] paras = {notice.getTitle(),notice.getNotice(),now};
		System.out.println(notice.getTitle()+notice.getNotice()+now);
		rows = executeSQL(sql, paras);
		return rows;
	}
	
	public int delNotice(int id) throws Exception{
		// TODO 自动生成方法存根
		return rows;
	}
	
	public int updateNotice(Notice notice) throws Exception{
		// TODO 自动生成方法存根
		return rows;
	}

	public Notice getNewestNotice() throws Exception {
		String sql = "select top 1 * from ez_Notice order by id desc";
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				notice = new Notice();
				notice.setTitle(rs.getString("title"));
				notice.setId(rs.getInt("id"));
				notice.setNotice(rs.getString("notice"));
				notice.setPostTime(rs.getString("postTime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return notice;
	}

	public List listNotice()throws Exception {
		String sql = "select * from ez_Notice order by id desc";
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				notice = new Notice();
				notice.setTitle(rs.getString("title"));
				notice.setId(rs.getInt("id"));
				notice.setNotice(rs.getString("notice"));
				notice.setPostTime(rs.getString("postTime"));
				nl.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return nl;
	}

	public Notice getNoticeById(int id) throws Exception {
		String sql = "select * from ez_Notice where id = "+id;
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				notice = new Notice();
				notice.setTitle(rs.getString("title"));
				notice.setId(rs.getInt("id"));
				notice.setNotice(rs.getString("notice"));
				notice.setPostTime(rs.getString("postTime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return notice;
	}
}
