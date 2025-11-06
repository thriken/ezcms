/*
 * s2jsp.lg.entity.User.java
 * 2009-6-23
 * 用户类
 */
package ezbbs.entity;

public class User {

	private int uId; // 用来唯一标识用户
	private String uName; // 用户名
	private String uPass; // 用户密码
	private int gender; // 性别,1是女，2是男
	private String head; // 头像，地址形式
	private String regTime; // 注册时间
	private int ulevel ;
	private String umanage;
	/**
	 * @return head
	 */
	public String getHead() {
		return head;
	}

	/**
	 * @param head
	 *            要设置的 head
	 */
	public void setHead(String head) {
		this.head = head;
	}

	/**
	 * @return regTime
	 */
	public String getRegTime() {
		return regTime;
	}

	/**
	 * @param regTime
	 *            要设置的 regTime
	 */
	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public int getUId() {
		return uId;
	}

	public void setUId(int id) {
		uId = id;
	}

	public String getUName() {
		return uName;
	}

	public void setUName(String name) {
		uName = name;
	}

	public String getUPass() {
		return uPass;
	}

	public void setUPass(String pass) {
		uPass = pass;
	}
	public int getUlevel() {
		return ulevel;
	}
	
	public void setUlevel(int level) {
		ulevel = level;
	}
	
	public String getUmanage() {
		return umanage;
	}
	
	public void setUmanage(String manage) {
		umanage = manage;
	}

	/**
	 * 输出当前用户的信息
	 */
	public void getUserInfo() {
		System.out.println("====用户信息====");
		System.out.println("用户名：" + uName);
		System.out.println("用户密码：" + uPass);
		char sex = gender == 1 ? '女' : '男'; // 判断性别
		System.out.println("性别：" + sex + "\n");
		System.out.println("等级：" + ulevel + "\n");
		System.out.println("职务：" + umanage + "\n");
	}

}
