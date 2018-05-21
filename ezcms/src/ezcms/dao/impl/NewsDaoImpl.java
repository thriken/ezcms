package ezcms.dao.impl;

import java.sql.*;
import java.util.*;

import ezcms.dao.*;
import ezcms.entity.*;


public class NewsDaoImpl extends BaseDao implements NewsDao {
	Connection conn = null ;
	PreparedStatement pstmt = null ;
	ResultSet rs =null ;
	int rows = 0;
	String sql = null;
	News n = null;
	List<News> nlist = new ArrayList<News>();
	
	public int addNews(News news)throws Exception {
		// TODO 自动生成方法存根
		return 0;
	}

	public int delNews(int nid)throws Exception {
		// TODO 自动生成方法存根
		return 0;
	}

	public int updateNews(News news) throws Exception{
		// TODO 自动生成方法存根
		return 0;
	}
	
	public News getNewsById(int nid)throws Exception {
		sql = "select * from ez_news where nid = " + nid;
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				n = new News();
				n.setAuthorId(rs.getInt("authorId"));
				n.setClassId(rs.getInt("classId"));
				n.setDescription(rs.getString("description"));
				n.setNewsContent(rs.getString("newsContent"));
				n.setNid(rs.getInt("nid"));
				n.setPostTime(rs.getString("postTime"));
				n.setTitle(rs.getString("title"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return n;
	}

	public List listNews() throws Exception {
		sql = "select * from ez_news order by postTime desc";
		try {
			conn =getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				n = new News();
				n.setNid(rs.getInt("nid"));
				n.setAuthorId(rs.getInt("authorId"));
				n.setClassId(rs.getInt("classId"));
				n.setDescription(rs.getString("description"));
				n.setNewsContent(rs.getString("newsContent"));
				n.setPostTime(rs.getString("postTime"));
				n.setTitle(rs.getString("title"));
				nlist.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return nlist;
	}
	
	public List listNewsByClassId(int cid) throws Exception {
		sql = "select * from ez_news  where classId = " + cid + " order by postTime";
		try {
			conn =getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				n = new News();
				n.setNid(rs.getInt("nid"));
				n.setAuthorId(rs.getInt("authorId"));
				n.setClassId(rs.getInt("classId"));
				n.setDescription(rs.getString("description"));
				n.setNewsContent(rs.getString("newsContent"));
				n.setPostTime(rs.getString("postTime"));
				n.setTitle(rs.getString("title"));
				nlist.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return nlist;
	}

	public List listNewsByAuthor(Author author)throws Exception {
		// TODO 自动生成方法存根
		return null;
	}

	public List searchNewsByTitleKeyword(String keyword)throws Exception {
		sql = "select * from ez_news where title like '%"+keyword+"%' order by postTime";
		try {
			conn =getConn();
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, keyword);
			rs = pstmt.executeQuery();
			while(rs.next()){
				n = new News();
				n.setNid(rs.getInt("nid"));
				n.setAuthorId(rs.getInt("authorId"));
				n.setClassId(rs.getInt("classId"));
				n.setDescription(rs.getString("description"));
				n.setNewsContent(rs.getString("newsContent"));
				n.setPostTime(rs.getString("postTime"));
				n.setTitle(rs.getString("title"));
				nlist.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return nlist;
	}
}
