package ezcms.dao.impl;

import java.sql.*;
import java.util.*;

import ezcms.dao.*;
import ezcms.entity.*;

public class AuthorDaoImpl extends BaseDao implements AuthorDao {
	Connection conn = null ;
	PreparedStatement pstmt = null ;
	ResultSet rs =null ;
	int rows = 0;
	String sql = null;
	Author au =null;

	public int addAuthor(Author author) throws Exception{
		// TODO 自动生成方法存根
		return 0;
	}

	public int delAuthor(int auhtorId)throws Exception {
		// TODO 自动生成方法存根
		return 0;
	}
	public int updateAuthor(Author author) throws Exception{
		// TODO 自动生成方法存根
		return 0;
	}

	public Author getAuthorById(int authorId)throws Exception {
		sql = "select * from ez_author where authorId = "+ authorId;
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				au = new Author();
				au.setAuthorId(rs.getInt("authorId"));
				au.setBirthday(rs.getString("birthday"));
				au.setName(rs.getString("name"));
				au.setPassword(rs.getString("password"));
				au.setRegTime(rs.getString("regTime"));
				au.setSex(rs.getInt("sex"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return au;
	}

	public List listAuthor() throws Exception{
		List<Author> aulist = new ArrayList<Author>();
		String sql = "select * from ez_author";
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				au = new Author();
				au.setAuthorId(rs.getInt("authorId"));
				au.setName(rs.getString("name"));
				au.setPassword(rs.getString("password"));
				au.setBirthday(rs.getString("birthday"));
				au.setRegTime(rs.getString("regTime"));
				au.setSex(rs.getInt("sex"));
				aulist.add(au);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeAll(conn, pstmt, rs);			
		}
		return aulist;
	}


}
