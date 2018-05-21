/****
 * 新闻接口
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.hibernate.dao;
import java.util.*;
import ezcms.entity.*;

public interface NewsDao {
	
	/***
	 * 添加新闻
	 * @return
	 */
	public void addNews(News news);
	
	/***
	 * 删除新闻
	 * @return
	 */
	public void delNews(int nid);
	
	/***
	 * 修改新闻
	 * @return
	 */
	public void updateNews(News news);
	
	/***
	 * 获取新闻列表
	 * @return
	 */
	public List listNews();
	
	/***
	 * 根据分类ID获取新闻列表 
	 * @param cid 分类ID
	 * @return	新闻列表
	 * @throws Exception
	 */
	public List listNewsByClassId(int cid);
	/***
	 * 根据ID获取新闻
	 * @return
	 */
	public News getNewsById(int nid);
	
	/***
	 * 根据标题关键字搜索新闻
	 * @return
	 */
	public List searchNewsByTitleKeyword(String keyword);
	
	/***
	 * 根据作者搜索新闻
	 * @return
	 */
	public List listNewsByAuthor(Author author);
}
