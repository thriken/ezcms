package ezbbs.entity;

public class Parent {
	private int parentId;
	private String parentName;

	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	public void getParentInfo() {
		System.out.println("====主板块信息====");
		System.out.println("主板块名称：" + parentName + "\n");
		System.out.println("主版块id:" + parentId + "\n");
	}
}
