package ezcms.dao.impl;

import java.util.*;
import java.sql.*;
import ezcms.dao.*;
import ezcms.entity.*;

public class ManageMenuDaoImpl extends BaseDao implements ManageMenuDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int rows = 0;
	MainMenu mm = null;
	List<MainMenu> mlist =null;
	String sql = null;

	public int addMMenu(MainMenu mm) throws Exception {
		sql = "insert ez_mainmenu values('"+ mm.getMname()+"','"+ mm.getText()+"',"+ mm.getIsUrl()+","+mm.getSort()+")";
		return executeSQL(sql, null);
	}

	public int delMMenu(int mid) throws Exception {
		sql = "delete from ez_mainmenu where id = " +mid;
		return executeSQL(sql, null);
	}

	public List getMianMenu() throws Exception {
		mlist = new ArrayList<MainMenu>();
		sql = "select * from ez_mainmenu";
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				mm =new MainMenu();
				mm.setId(rs.getInt("id"));
				mm.setIsUrl(rs.getInt("isUrl"));
				mm.setMname(rs.getString("menuname"));
				mm.setSort(rs.getInt("sort"));
				mm.setText(rs.getString("text"));
				mlist.add(mm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}
		return mlist;
	}

	public int uptMMenu(MainMenu mm) throws Exception {
		sql = "update ez_mainmenu set menuname='" + mm.getMname()+"',text='"+mm.getText()+"',isUrl="+mm.getIsUrl()+",sort="+mm.getSort()+" where id = " + mm.getId();
		return executeSQL(sql, null);
	}
}

