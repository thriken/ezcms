/****
 * 新闻分类接口
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.hibernate.dao;

import java.util.*;
import ezcms.entity.*;

public interface NewsClassDao {
	
	/***
	 * 添加分类
	 * @return
	 */
	public int addClass(NewsClass nclass)throws Exception;
	
	/***
	 * 删除分类
	 * @return
	 */
	public int delClass(int classId)throws Exception;
	
	/***
	 * 修改分类名
	 * @return
	 */
	public int updateClass(NewsClass nclass)throws Exception;
	
	/***
	 * 获取所有分类
	 * @return  分类列表
	 */
	public List listAllClass()throws Exception;
	
	/***
	 * 根据分类ID获取分类
	 * @return
	 */
	public NewsClass getClassById(int classId)throws Exception;
}
