/*
 * ezcms.dao.impl.BaseDao.java
 * 2009-6-23
 * Dao的基类，使用JDBC连接数据库、释放资源、执行sql，可以被其他Dao实现类继承或实例化使用
 */
package ezcms.dao.impl;

import java.sql.*;

/****
 * 
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
public class BaseDao {
	public final static String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; // 数据库驱动
	public final static String URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=bbs"; // url
	public final static String DBNAME = "sa"; // 数据库用户名
	public final static String DBPASS = ""; // 数据库密码

	/**
	 * 得到数据库连接
	 * 
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @return 数据库连接
	 */
	
	public Connection getConn() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVER); // 注册驱动
		Connection conn = DriverManager.getConnection(URL, DBNAME, DBPASS); // 获得数据库连接
		return conn; // 返回连接
	}

	/**
	 * 释放资源
	 * 
	 * @param conn 数据库连接
	 * @param pstmt PreparedStatement对象
	 * @param rs 结果集
	 */
	public void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		/* 如果rs不空，关闭rs */
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/* 如果pstmt不空，关闭pstmt */
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/* 如果conn不空，关闭conn */
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 执行SQL语句，可以进行增、删、改的操作，不能执行查询
	 * 
	 * @param sql 预编译的 SQL 语句
	 * @param param 预编译的 SQL 语句中的‘？’参数的字符串数组
	 * @return 影响的条数
	 * @throws Exception 
	 */
	public int executeSQL(String sql, String[] param) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;

		/* 处理SQL,执行SQL */
		try {
			conn = getConn(); // 得到数据库连接
			pstmt = conn.prepareStatement(sql); // 得到PreparedStatement对象
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					pstmt.setString(i + 1, param[i]); // 为预编译sql设置参数
					System.out.println(param[i]);
				}
			}
			rows = pstmt.executeUpdate(); // 执行SQL语句
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 处理ClassNotFoundException异常
			throw e;
		} catch (SQLException e) {
			e.printStackTrace(); // 处理SQLException异常
			throw e;
		} finally {
			closeAll(conn, pstmt, null); // 释放资源
		}
		return rows;
	}
}
