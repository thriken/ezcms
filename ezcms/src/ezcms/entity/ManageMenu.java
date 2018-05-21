package ezcms.entity;

public class ManageMenu {
	private int id ;
	private String mname;
	private String aname;
	
	public ManageMenu() {}
	public ManageMenu(String mname, String aname) {
		this.mname = mname;
		this.aname = aname;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
}
