package ezcms.dao.impl;

import java.util.*;
import java.sql.*;

import ezcms.entity.*;

public class LeftMenuDaoImpl extends BaseDao implements ezcms.dao.LeftMenuDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	LeftMenu lm = null;
	
	public int addLeftMenu(LeftMenu lm) throws Exception {
		// TODO 自动生成方法存根
		return 0;
	}

	public int delLeftMenu(int cid) throws Exception {
		// TODO 自动生成方法存根
		return 0;
	}

	public List<LeftMenu> getLeftMenu(int mid) throws Exception {
		List<LeftMenu> lmlist = new ArrayList<LeftMenu>();
		String sql = "select * from ez_leftmenu where mid = " + mid;
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs =pstmt.executeQuery();
			while(rs.next()){
				lm = new LeftMenu();
				lm.setCid(rs.getInt(1));
				lm.setCname(rs.getString(3));
				lm.setIsUrl(rs.getInt(5));
				lm.setMid(rs.getInt(2));
				lm.setSort(rs.getInt(6));
				lm.setText(rs.getString(4));
				lmlist.add(lm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeAll(conn, pstmt, rs);
		}
		return lmlist;
	}

	public int uptLeftMenu(LeftMenu lm) throws Exception {
		// TODO 自动生成方法存根
		return 0;
	}
}
