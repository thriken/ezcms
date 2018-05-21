/****
 * ���߽ӿ�
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.dao;

import java.util.List;
import ezcms.entity.*;

public interface AuthorDao {
	/**
	 * �������
	 * @return int Ӱ�������
	 */
	public int addAuthor(Author author)throws Exception;
	
	/**
	 * ɾ������
	 * @return int Ӱ�������
	 */
	public int delAuthor(int auhtorId)throws Exception;
	
	/**
	 * �޸�������Ϣ
	 * @return int Ӱ�������
	 */
	public int updateAuthor(Author author)throws Exception;
	
	/**
	 *��ȡ�����б�
	 * @return List �����б�
	 */
	public List listAuthor()throws Exception;
	
	/**
	 * ����ID��������
	 * @return  Author ���߶���
	 */
	public Author getAuthorById(int authorId)throws Exception;
}
