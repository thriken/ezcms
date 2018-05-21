/****
 * 管理员实体类
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.entity;

public class Admin {
	private int id ;
	private String admin ;
	private String password;

	
	public Admin() {}
	public Admin(String admin, String password) {
		this.admin = admin;
		this.password = password;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public int getId() {
		return id;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
