/*
 * ezcms.dao.impl.BaseDao.java
 * 2009-6-23
 * Dao�Ļ��࣬ʹ��JDBC�������ݿ⡢�ͷ���Դ��ִ��sql�����Ա�����Daoʵ����̳л�ʵ����ʹ��
 */
package ezcms.dao.impl;

import java.sql.*;

/****
 * 
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
public class BaseDao {
	public final static String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; // ���ݿ�����
	public final static String URL = "jdbc:sqlserver://127.0.0.1:1433;databaseName=bbs"; // url
	public final static String DBNAME = "sa"; // ���ݿ��û���
	public final static String DBPASS = ""; // ���ݿ�����

	/**
	 * �õ����ݿ�����
	 * 
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 * @return ���ݿ�����
	 */
	
	public Connection getConn() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVER); // ע������
		Connection conn = DriverManager.getConnection(URL, DBNAME, DBPASS); // ������ݿ�����
		return conn; // ��������
	}

	/**
	 * �ͷ���Դ
	 * 
	 * @param conn ���ݿ�����
	 * @param pstmt PreparedStatement����
	 * @param rs �����
	 */
	public void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		/* ���rs���գ��ر�rs */
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/* ���pstmt���գ��ر�pstmt */
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/* ���conn���գ��ر�conn */
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * ִ��SQL��䣬���Խ�������ɾ���ĵĲ���������ִ�в�ѯ
	 * 
	 * @param sql Ԥ����� SQL ���
	 * @param param Ԥ����� SQL ����еġ������������ַ�������
	 * @return Ӱ�������
	 * @throws Exception 
	 */
	public int executeSQL(String sql, String[] param) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;

		/* ����SQL,ִ��SQL */
		try {
			conn = getConn(); // �õ����ݿ�����
			pstmt = conn.prepareStatement(sql); // �õ�PreparedStatement����
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					pstmt.setString(i + 1, param[i]); // ΪԤ����sql���ò���
					System.out.println(param[i]);
				}
			}
			rows = pstmt.executeUpdate(); // ִ��SQL���
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // ����ClassNotFoundException�쳣
			throw e;
		} catch (SQLException e) {
			e.printStackTrace(); // ����SQLException�쳣
			throw e;
		} finally {
			closeAll(conn, pstmt, null); // �ͷ���Դ
		}
		return rows;
	}
}
