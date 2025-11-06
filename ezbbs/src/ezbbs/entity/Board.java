/*
 * 2009-6-23
 * 版块类
 */
package ezbbs.entity;

// 版块

public class Board {

	private int boardId; // 用来唯一标识版块
	private String boardName; // 版块名称
	private int parentId; // 主版块id
	private int boardIcon ;

	public int getBoardIcon() {
		return boardIcon;
	}

	public void setBoardIcon(int boardicon) {
		this.boardIcon = boardicon;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getBoardName() {
		return boardName;
	}

	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	/**
	 * 输出版块信息
	 */
	public void getBoardInfo() {
		System.out.println("====板块信息====");
		System.out.println("板块id：" + boardId);
		System.out.println("板块名称：" + boardName);
		System.out.println("主版块id:" + parentId + "\n");
	}
}
