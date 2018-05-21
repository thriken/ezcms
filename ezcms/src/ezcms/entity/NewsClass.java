/****
 * 新闻分类实体类
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.entity;

public class NewsClass {
	private int classId;
	private String name;
	private int sort ;
	private int type;
	private String url;
	
	public NewsClass() {
	}
	public NewsClass(String name, int sort,int type, String url) {
		this.name = name;
		this.sort = sort;
		this.type = type;
		this.url = url;
	}

	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
