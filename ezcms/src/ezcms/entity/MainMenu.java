package ezcms.entity;

public class MainMenu {
	private int id ;
	private String mname;
	private String text;
	private int isUrl;
	private int sort;
	
	public MainMenu() {}
	public MainMenu(String mname, String text, int isUrl, int sort) {
		this.mname = mname;
		this.text = text;
		this.isUrl = isUrl;
		this.sort = sort;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * ��ȡ���˵�����
	 * 
	 */
	public String getMname() {
		return mname;
	}
	/**
	 * �������˵�����
	 */
	public void setMname(String mname) {
		this.mname = mname;
	}
	/**
	 * ��ȡ���ӻ����
	 * @return
	 */
	public String getText() {
		return text;
	}
	/**
	 * �������ӻ����
	 * @return
	 */
	public void setText(String text) {
		this.text = text;
	}
	/**
	 * ��ȡ�Ƿ�������(int)
	 * @return
	 */
	public int getIsUrl() {
		return isUrl;
	}
	/**
	 * �����Ƿ�������(int)
	 * @return
	 */
	public void setIsUrl(int isUrl) {
		this.isUrl = isUrl;
	}
	/**
	 * ��ȡλ��
	 * @return
	 */
	public int getSort() {
		return sort;
	}
	/**
	 * ����λ��
	 * @param sort
	 */
	public void setSort(int sort) {
		this.sort = sort;
	}
}
