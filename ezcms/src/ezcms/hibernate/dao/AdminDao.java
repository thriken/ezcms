/****
 * 管理员接口
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.hibernate.dao;

import java.util.List;
import ezcms.entity.*;

public interface AdminDao {
	/**
	 * 添加管理员
	 * @return int 影响的行数
	 */
	public int addAdmin(Admin admin);

	/**
	 * 删除管理员
	 * @return int 影响的行数
	 */
	public int delAdmin(int id);
	
	/**
	 * 修改管理员信息
	 * @return int 影响的行数
	 */
	public int updateAdmin(Admin admin);
	
	/**
	 *获取管理员列表
	 * @return List 管理员列表
	 */
	public List listAdmin();
	
	/**
	 * 根据ID查找管理员
	 * @return  Admin 管理员对象
	 */
	public Admin getAdminById(int id);
	
	/**
	 * 根据名称查找管理员
	 * @return  Admin 管理员对象
	 */
	public Admin getAdminByName(String name);
}
