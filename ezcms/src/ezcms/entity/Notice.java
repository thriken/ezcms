/****
 * 公告实体类
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.entity;

public class Notice {
	private int id;
	private String title;
	private String notice;
	private String postTime;

	public Notice() {}
	public Notice(String title, String notice, String postTime) {
		this.title = title;
		this.notice = notice;
		this.postTime = postTime;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getPostTime() {
		return postTime;
	}
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
}
