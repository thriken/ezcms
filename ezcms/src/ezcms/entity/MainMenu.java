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
	 * 获取主菜单名称
	 * 
	 */
	public String getMname() {
		return mname;
	}
	/**
	 * 设置主菜单名称
	 */
	public void setMname(String mname) {
		this.mname = mname;
	}
	/**
	 * 获取链接或别名
	 * @return
	 */
	public String getText() {
		return text;
	}
	/**
	 * 设置链接或别名
	 * @return
	 */
	public void setText(String text) {
		this.text = text;
	}
	/**
	 * 获取是否是链接(int)
	 * @return
	 */
	public int getIsUrl() {
		return isUrl;
	}
	/**
	 * 设置是否是链接(int)
	 * @return
	 */
	public void setIsUrl(int isUrl) {
		this.isUrl = isUrl;
	}
	/**
	 * 获取位置
	 * @return
	 */
	public int getSort() {
		return sort;
	}
	/**
	 * 设置位置
	 * @param sort
	 */
	public void setSort(int sort) {
		this.sort = sort;
	}
}
