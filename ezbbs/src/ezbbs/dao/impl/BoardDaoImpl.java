package ezbbs.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import ezbbs.dao.BoardDao;
import ezbbs.entity.Board;
import ezbbs.entity.Parent;


public class BoardDaoImpl extends BaseDao implements BoardDao {
	private Connection conn = null; // 保存数据库连接
	private PreparedStatement pstmt = null; // 用于执行SQL语句
	private ResultSet rs = null; // 用户保存查询结果集

	public Board findBoard(int boardId) {
		String sql = "select * from TBL_BOARD where boardId=?";
		Board board = null;
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			pstmt.setInt(1, boardId); // 设置boardId为参数值
			rs = pstmt.executeQuery(); // 执行sql，取得查询结果集

			/* 将结果集中的信息取出保存到board对象中，循环最多只会执行一次 */
			while (rs.next()) {
				board = new Board(); // 主题对象
				board.setBoardId(rs.getInt("boardId"));
				board.setBoardName(rs.getString("boardName"));
				board.setParentId(rs.getInt("parentId"));
				board.setBoardIcon(rs.getInt("boardIcon"));
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}
		return board;
	}

	public List findBoardList() {
		String sql = "select * from TBL_BOARD";
		Board board = null;
		List listBoard = new ArrayList(); // 用来保存主题对象列表
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行SQL，得到结果集
			/* 将结果集中的信息取出保存到list中 */
			while (rs.next()) {
				board = new Board(); // 主题对象
				board.setBoardId(rs.getInt("boardId"));
				board.setBoardName(rs.getString("boardName"));
				board.setParentId(rs.getInt("parentId"));
				board.setBoardIcon(rs.getInt("boardIcon"));
				listBoard.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}

		return listBoard;
	}

	public List findBoardList(int parentId) {
		String sql = "select * from TBL_BOARD where parentId =" + parentId;
		Board board = null;
		List listBoard = new ArrayList(); // 用来保存主题对象列表
		try {
			conn = this.getConn(); // 获得数据库连接
			pstmt = conn.prepareStatement(sql); // 得到一个PreparedStatement对象
			rs = pstmt.executeQuery(); // 执行SQL，得到结果集
			/* 将结果集中的信息取出保存到list中 */
			while (rs.next()) {
				board = new Board(); // 主题对象
				board.setBoardId(rs.getInt("boardId"));
				board.setBoardName(rs.getString("boardName"));
				board.setBoardIcon(rs.getInt("boardIcon"));
				listBoard.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 处理异常
		} finally {
			this.closeAll(conn, pstmt, rs); // 释放资源
		}

		return listBoard;
	}

	public static void main(String[] args) {
		// BoardDaoImpl bdi = new BoardDaoImpl();
		// bdi.findBoard();
		// /*根据boardId查询版块名称、主版块id*/
		// bdi.findBoard(7).getBoardInfo();
		// List listBoard = bdi.findBoardList();
		// for(int i=1;i<listBoard.size();i++) {
		// Board board = (Board)listBoard.get(i); // 主题对象
		// System.out.println("第i="+i);
		// System.out.println("板块ID："+board.getBoardId());
		// System.out.println("板块名称："+board.getBoardName());
		// }
	}

}
