/****
 * ���Žӿ�
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.hibernate.dao;
import java.util.*;
import ezcms.entity.*;

public interface NewsDao {
	
	/***
	 * �������
	 * @return
	 */
	public void addNews(News news);
	
	/***
	 * ɾ������
	 * @return
	 */
	public void delNews(int nid);
	
	/***
	 * �޸�����
	 * @return
	 */
	public void updateNews(News news);
	
	/***
	 * ��ȡ�����б�
	 * @return
	 */
	public List listNews();
	
	/***
	 * ���ݷ���ID��ȡ�����б� 
	 * @param cid ����ID
	 * @return	�����б�
	 * @throws Exception
	 */
	public List listNewsByClassId(int cid);
	/***
	 * ����ID��ȡ����
	 * @return
	 */
	public News getNewsById(int nid);
	
	/***
	 * ���ݱ���ؼ�����������
	 * @return
	 */
	public List searchNewsByTitleKeyword(String keyword);
	
	/***
	 * ����������������
	 * @return
	 */
	public List listNewsByAuthor(Author author);
}
