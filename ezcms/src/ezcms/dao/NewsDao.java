/****
 * 新闻接口
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.dao;
import java.util.*;

import ezcms.entity.*;

public interface NewsDao {
	
	/***
	 * 添加新闻
	 * @return
	 */
	public int addNews(News news) throws Exception;
	
	/***
	 * 删除新闻
	 * @return
	 */
	public int delNews(int nid) throws Exception;
	
	/***
	 * 修改新闻
	 * @return
	 */
	public int updateNews(News news) throws Exception;
	
	/***
	 * 获取新闻列表
	 * @return
	 */
	public List listNews() throws Exception;
	
	/***
	 * 根据分类ID获取新闻列表 
	 * @param cid 分类ID
	 * @return	新闻列表
	 * @throws Exception
	 */
	public List listNewsByClassId(int cid) throws Exception;
	/***
	 * 根据ID获取新闻
	 * @return
	 */
	public News getNewsById(int nid) throws Exception;
	
	/***
	 * 根据标题关键字搜索新闻
	 * @return
	 */
	public List searchNewsByTitleKeyword(String keyword) throws Exception;
	
	/***
	 * 根据作者搜索新闻
	 * @return
	 */
	public List listNewsByAuthor(Author author) throws Exception;
}
