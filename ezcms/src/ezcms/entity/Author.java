/****
 * 作者实体类
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.entity;

public class Author {
	private int authorId;
	private String name;
	private String password;
	private	int sex ;//默认0 表示男   1表示女
	private String birthday;
	private String regTime;
	
	public Author() {}

	public Author(String name, String password, int sex, String birthday, String regTime) {
		this.name = name;
		this.password = password;
		this.sex = sex;
		this.birthday = birthday;
		this.regTime = regTime;
	}

	public int getAuthorId() {
		return authorId;
	}
	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getRegTime() {
		return regTime;
	}
	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
}
