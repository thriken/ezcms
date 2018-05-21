package ezcms.entity;

public class LeftMenu {
	private int cid;
	private int mid;
	private String cname;
	private String text;
	private int isUrl;
	private int sort;
	
	public LeftMenu() {	}
	public LeftMenu(int mid, String cname, String text,int isUrl,int sort) {
		this.mid = mid;
		this.cname = cname;
		this.text = text;
		this.isUrl = isUrl;
		this.sort = sort;
	}
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	/**
	 * 获取主菜单ID
	 * @return 主菜单ID
	 */
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	/**
	 * 获取子菜单名称
	 * @return
	 */
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getIsUrl() {
		return isUrl;
	}
	public void setIsUrl(int isUrl) {
		this.isUrl = isUrl;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
}
