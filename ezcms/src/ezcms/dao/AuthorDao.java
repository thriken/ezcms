/****
 * 作者接口
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.dao;

import java.util.List;
import ezcms.entity.*;

public interface AuthorDao {
	/**
	 * 添加作者
	 * @return int 影响的行数
	 */
	public int addAuthor(Author author)throws Exception;
	
	/**
	 * 删除作者
	 * @return int 影响的行数
	 */
	public int delAuthor(int auhtorId)throws Exception;
	
	/**
	 * 修改作者信息
	 * @return int 影响的行数
	 */
	public int updateAuthor(Author author)throws Exception;
	
	/**
	 *获取作者列表
	 * @return List 作者列表
	 */
	public List listAuthor()throws Exception;
	
	/**
	 * 根据ID查找作者
	 * @return  Author 作者对象
	 */
	public Author getAuthorById(int authorId)throws Exception;
}
