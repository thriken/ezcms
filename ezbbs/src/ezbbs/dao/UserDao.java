/*
 * s2jsp.lg.dao.UserDao.java
 * 2009-6-23
 * 用户接口
 */
package ezbbs.dao;

import java.util.List;

import ezbbs.entity.User;


public interface UserDao {
	public static final int FEMALE = 1; // 代表女性
	public static final int MALE = 2; // 代表男性

	/**
	 * 根据用户名查找论坛用户
	 * 
	 * @param uName
	 * @return
	 */
	public User findUser(String uName);

	/**
	 * 根据用户名查找论坛用户
	 * 
	 * @param uId
	 * @return
	 */
	public User findUser(int uId);

	/**
	 * 增加论坛用户，返回增加个数
	 * 
	 * @param user
	 * @return
	 */
	public int addUser(User user);

	/**
	 * 修改论坛用户的信息，返回修改个数
	 * 
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public int updateUser(User user);

	public List findListUser();
}
