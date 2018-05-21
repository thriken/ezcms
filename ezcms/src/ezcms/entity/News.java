/****
 * 新闻实体类
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.entity;

public class News {
	private int nid;
	private int classId;
	private String title;
	private String newsContent;
	private String description;
	private String postTime;
	private int authorId;
	
	
	public News() {}
	public News( int classId, String title, String newsContent, String description, String postTime, int authorId) {
		this.classId = classId;
		this.title = title;
		this.newsContent = newsContent;
		this.description = description;
		this.postTime = postTime;
		this.authorId = authorId;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPostTime() {
		return postTime;
	}
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}
}
