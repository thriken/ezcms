package ezcms.dao.impl;

import java.sql.*;
import java.util.*;

import ezcms.dao.*;
import ezcms.entity.*;

public class NewsClassDaoImpl extends BaseDao implements NewsClassDao {
	Connection conn = null ;
	PreparedStatement pstmt = null ;
	ResultSet rs =null ;
	int rows = 0;
	String sql = null;
	NewsClass nc = null;
	List<NewsClass> nlist = new ArrayList<NewsClass>();
 	
	public int addClass(NewsClass nclass) throws Exception {
		sql = "insert into ez_newsclass valuse(?,"+ nclass.getSort() +","+nclass.getType()+",?)";
		String[] param = {nclass.getName(),nclass.getUrl()};
		return executeSQL(sql, param);
	}

	public int delClass(int classId) throws Exception {
		sql= "del from ez_newsclass where classId = " + classId;
		return executeSQL(sql, null);
	}

	public NewsClass getClassById(int classId)  throws Exception{
		sql = "select * from ez_newsclass where classId = " + classId;
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				nc = new NewsClass();
				nc.setName(rs.getString("name"));
				nc.setClassId(rs.getInt("classId"));
				nc.setSort(rs.getInt("sort"));
				nc.setType(rs.getInt("type"));
				nc.setUrl(rs.getString("url"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return nc;
	}

	public List listAllClass()  throws Exception{
		sql = "select * from ez_newsclass order by sort";
		try {
			conn =getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				nc= new NewsClass();
				nc.setClassId(rs.getInt("classId"));
				nc.setName(rs.getString("name"));
				nc.setSort(rs.getInt("sort"));
				nc.setType(rs.getInt("type"));
				nc.setUrl(rs.getString("url"));
				nlist.add(nc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return nlist;
	}

	public int updateClass(NewsClass nclass) throws Exception {
		sql = "update ez_newsclass set name = ? where classId = " + nclass.getClassId();
		String [] param = {nclass.getName()};
		return executeSQL(sql, param);
	}
}
