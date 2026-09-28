/*
 * 2009-6-23
 * �����
 */
package ezbbs.entity;

// ���

public class Board {

	private int boardId; // ����Ψһ��ʶ���
	private String boardName; // �������
	private int parentId; // �����id
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
}
