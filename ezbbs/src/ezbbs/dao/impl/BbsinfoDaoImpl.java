package ezbbs.dao.impl;

import java.sql.*;

import ezbbs.dao.BbsinfoDao;
import ezbbs.entity.BbsInfo;
import ezbbs.entity.Board;

public class BbsinfoDaoImpl extends BaseDao implements BbsinfoDao  {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public BbsInfo getInfo() {
		String sql = "select * from TBL_BBSINFO";
		BbsInfo info = null;
		try {
			conn = getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行sql，取得查询结果集

			/* 将结果集中的信息取出保存到board对象中，循环最多只会执行一次 */
			while (rs.next()) {
				info = new BbsInfo(); // 主题对象
				info.setName(rs.getString(1));
				info.setVersion(rs.getString(2));
				info.setTemplate(rs.getString(3));
				info.setUrl(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}
		return info;
	}

}
