/**
 * 主菜单DAO接口
 * 2011-07-22
 * Write By Thriken
 */
package ezcms.hibernate.dao;
import java.util.*;
import ezcms.entity.*;
/**
 * @author Administrator
 *	
 */
public interface ManageMenuDao {
	/***
	 * 获取主菜单
	 * @return 主菜单列表
	 * @throws Exception
	 */
	public List getMianMenu()throws Exception;
	
	/***
	 * 添加主菜单
	 * @param mm 主菜单对象
	 * @return	影响的行数
	 * @throws Exception
	 */
	public int addMMenu(MainMenu mm)throws Exception;
	
	/***
	 * 删除主菜单
	 * @param mid 主菜单ID
	 * @return	影响的行数
	 * @throws Exception
	 */
	public int delMMenu(int mid)throws Exception;
	
	/***
	 * 修改主菜单
	 * @param mm 主菜单对象
	 * @return	影响的行数
	 * @throws Exception
	 */
	public int uptMMenu(MainMenu mm)throws Exception;
	
	
}
