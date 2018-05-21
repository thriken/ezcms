/****
 * 作者接口
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.hibernate.dao;

import java.util.List;
import ezcms.entity.*;

public interface AuthorDao {
	/**
	 * 添加作者
	 */
	public void addAuthor(Author author);
	
	/**
	 * 删除作者
	 */
	public void delAuthor(Author author);
	
	/**
	 * 修改作者信息
	 */
	public void updateAuthor(Author author);
	
	/**
	 *获取作者列表
	 * @return List 作者列表
	 */
	public List listAuthor();
	
	/**
	 * 根据ID查找作者
	 * @return  Author 作者对象
	 */
	public Author getAuthorById(int authorId);
	
	public Author getAuthorByName(String name);
}
