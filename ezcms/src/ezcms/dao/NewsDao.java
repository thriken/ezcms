/****
 * ���Žӿ�
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.dao;
import java.util.*;

import ezcms.entity.*;

public interface NewsDao {
	
	/***
	 * �������
	 * @return
	 */
	public int addNews(News news) throws Exception;
	
	/***
	 * ɾ������
	 * @return
	 */
	public int delNews(int nid) throws Exception;
	
	/***
	 * �޸�����
	 * @return
	 */
	public int updateNews(News news) throws Exception;
	
	/***
	 * ��ȡ�����б�
	 * @return
	 */
	public List listNews() throws Exception;
	
	/***
	 * ���ݷ���ID��ȡ�����б� 
	 * @param cid ����ID
	 * @return	�����б�
	 * @throws Exception
	 */
	public List listNewsByClassId(int cid) throws Exception;
	/***
	 * ����ID��ȡ����
	 * @return
	 */
	public News getNewsById(int nid) throws Exception;
	
	/***
	 * ���ݱ���ؼ�����������
	 * @return
	 */
	public List searchNewsByTitleKeyword(String keyword) throws Exception;
	
	/***
	 * ����������������
	 * @return
	 */
	public List listNewsByAuthor(Author author) throws Exception;
}
