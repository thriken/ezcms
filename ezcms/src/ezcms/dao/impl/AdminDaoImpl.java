package ezcms.dao.impl;

import java.sql.*;
import java.util.*;

import ezcms.dao.*;
import ezcms.entity.*;

public class AdminDaoImpl extends BaseDao implements AdminDao {

	public int addAdmin(Admin admin) throws Exception {
		String sql = "insert into ez_Admin(admin,password) values(?,?)";
		String[] param = {admin.getAdmin(), admin.getPassword()};
		return executeSQL(sql, param);
	}

	public int delAdmin(int id) throws Exception {
		String sql = "delete from ez_Admin where id = ?";
		String[] param = {String.valueOf(id)};
		return executeSQL(sql, param);
	}

	public int updateAdmin(Admin admin) throws Exception {
		String sql = "update ez_Admin set admin=?,password=? where id=?";
		String[] param = {admin.getAdmin(), admin.getPassword(), String.valueOf(admin.getId())};
		return executeSQL(sql, param);
	}

	public List listAdmin() throws Exception {
		List<Admin> list = new ArrayList<Admin>();
		String sql = "select * from ez_Admin order by id";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Admin a = new Admin();
				a.setId(rs.getInt("id"));
				a.setAdmin(rs.getString("admin"));
				a.setPassword(rs.getString("password"));
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return list;
	}

	public Admin getAdminById(int id) throws Exception {
		Admin a = null;
		String sql = "select * from ez_Admin where id = " + id;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				a = new Admin();
				a.setId(rs.getInt("id"));
				a.setAdmin(rs.getString("admin"));
				a.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return a;
	}

	public Admin getAdminByName(String name) throws Exception {
		Admin a = null;
		String sql = "select * from ez_Admin where admin = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				a = new Admin();
				a.setId(rs.getInt("id"));
				a.setAdmin(rs.getString("admin"));
				a.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return a;
	}
}
