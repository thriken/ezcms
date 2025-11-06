package ezbbs.entity;

import java.util.*;
import java.text.*;

public class Message {
	private int mid;
	private String note;
	private String sendUname;
	private String receiveUname;
	private String postTime;
	private int readSign;
	

	public Message() {}
	/**
	 * @param mid
	 * @param note
	 * @param sendUname
	 * @param receiveUname
	 * @param postTime
	 * @param readSign
	 */
	public Message( String note, String sendUname, String receiveUname, String postTime, int readSign) {
		this.note = note;
		this.sendUname = sendUname;
		this.receiveUname = receiveUname;
		this.postTime = postTime;
		this.readSign = readSign;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getPostTime() {
		return postTime;
	}
	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}
	public int getReadSign() {
		return readSign;
	}
	public void setReadSign(int readSign) {
		this.readSign = readSign;
	}
	public String getReceiveUname() {
		return receiveUname;
	}
	public void setReceiveUname(String receiveUname) {
		this.receiveUname = receiveUname;
	}
	public String getSendUname() {
		return sendUname;
	}
	public void setSendUname(String sendUname) {
		this.sendUname = sendUname;
	}
	
}
