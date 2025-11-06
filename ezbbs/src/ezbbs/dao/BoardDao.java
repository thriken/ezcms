/*
 * s2jsp.lg.dao.BoardDao.java
 * 2009-6-23
 * 版块接口
 */
package ezbbs.dao;

import java.util.*;

import ezbbs.entity.Board;


public interface BoardDao {

	/**
	 * 根据版块id查找版块
	 * 
	 * @param boardId
	 * @return
	 */
	public Board findBoard(int boardId);

	public List findBoardList();

	public List findBoardList(int parentId);
}
