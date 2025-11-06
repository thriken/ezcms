package ezbbs.dao;

import java.util.List;

import ezbbs.entity.Message;

public interface MessageDao {
	public int saveMsg(Message msg);
	public int deleteMsg(int id);
	public int readMsg(Message msg);
	public Message findMsg(int id);
	public List listByReceivedUname(String uname);
}
