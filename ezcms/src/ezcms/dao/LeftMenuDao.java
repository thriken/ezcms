/**
 * 子菜单DAO
 * Write by Thriken
 * 2011-07-22
 */
package ezcms.dao;
import ezcms.entity.*;
import java.util.*;
/**
 * @author Administrator
 *
 */
public interface LeftMenuDao {
	
	/***
	 * 获取子侧菜单
	 * @param aname 主菜单别名
	 * @return	子菜单列表
	 * @throws Exception
	 */
	public List<LeftMenu> getLeftMenu(int mid)throws Exception;
	
	/***
	 * 添加子菜单
	 * @param lm 子菜单对象
	 * @return 影响的行数
	 * @throws Exception
	 */
	public int addLeftMenu(LeftMenu lm)throws Exception;
	
	/***
	 * 修改子菜单
	 * @param lm 子菜单对象
	 * @return 影响的行数
	 * @throws Exception
	 */
	public int uptLeftMenu(LeftMenu lm)throws Exception;
	
	/***
	 * 删除子菜单
	 * @param cid 子菜单ID
	 * @return 影响的行数
	 * @throws Exception
	 */
	public int delLeftMenu(int cid)throws Exception;
}
