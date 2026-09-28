package ezbbs.dao.impl;

import java.sql.*;
import ezbbs.dao.BbsinfoDao;
import ezbbs.entity.BbsInfo;

public class BbsinfoDaoImpl extends BaseDao implements BbsinfoDao  {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BbsInfo getInfo() {
		String sql = "select * from TBL_BBSINFO";
		BbsInfo info = null;
		try {
			conn = getConn(); 
			pstmt = conn.prepareStatement(sql); 
			rs = pstmt.executeQuery(); 
			while (rs.next()) {
				info = new BbsInfo(); 
				info.setName(rs.getString(1));
				info.setVersion(rs.getString(2));
				info.setTemplate(rs.getString(3));
				info.setUrl(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.closeAll(conn, pstmt, rs); 
		}
		return info;
	}

}
