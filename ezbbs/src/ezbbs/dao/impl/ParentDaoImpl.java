package ezbbs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import ezbbs.dao.ParentDao;
import ezbbs.entity.Parent;
import ezbbs.entity.User;


public class ParentDaoImpl extends BaseDao implements ParentDao {
	private Connection conn = null; // 保存数据库连接
	private PreparedStatement pstmt = null; // 用于执行SQL语句
	private ResultSet rs = null; // 用户保存查询结果集

	public Parent findParent(int parentId) {
		String sql = "select * from TBL_PARENT where parentId=?";
		Parent parent = null;
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			pstmt.setInt(1, parentId); // 设置parentId为参数值
			rs = pstmt.executeQuery(); // 执行sql，取得查询结果集

			/* 将结果集中的信息取出保存到parent对象中，循环最多只会执行一次 */
			while (rs.next()) {
				parent = new Parent(); // 主题对象
				parent.setParentId(rs.getInt("parentId"));
				parent.setParentName(rs.getString("parentName"));
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}
		return parent;
	}

	public List findParentList() {
		String sql = "select * from TBL_PARENT";
		Parent parent = null;
		List listParent = new ArrayList(); // 用来保存主题对象列表
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行SQL，得到结果集
			/* 将结果集中的信息取出保存到list中 */
			while (rs.next()) {
				parent = new Parent(); // 主题对象
				parent.setParentId(rs.getInt("parentId"));
				parent.setParentName(rs.getString("parentName"));
				listParent.add(parent);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}

		return listParent;
	}

	public static void main(String[] args) {
		// ParentDaoImpl pdi = new ParentDaoImpl();
		// pdi.findParent(2).getParentInfo();
		// List listParent = pdi.findParentList();
		// for(int i=1;i<listParent.size();i++) {
		// Parent parent = (Parent)listParent.get(i); // 主题对象
		// System.out.println("第i="+i);
		// System.out.println("主板块ID："+parent.getParentId());
		// System.out.println("主板块名称："+parent.getParentName());
		// }
	}

}
