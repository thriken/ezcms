/*
 * s2jsp.lg.entity.User.java
 * 2009-6-23
 * �û���
 */
package ezbbs.entity;

public class User {

	private int uId; // ����Ψһ��ʶ�û�
	private String uName; // �û���
	private String uPass; // �û�����
	private int gender; // �Ա�,1��Ů��2����
	private String head; // ͷ�񣬵�ַ��ʽ
	private String regTime; // ע��ʱ��
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
	 *            Ҫ���õ� head
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
	 *            Ҫ���õ� regTime
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
}
