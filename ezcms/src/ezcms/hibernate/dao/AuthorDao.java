/****
 * ���߽ӿ�
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.hibernate.dao;

import java.util.List;
import ezcms.entity.*;

public interface AuthorDao {
	/**
	 * �������
	 */
	public void addAuthor(Author author);
	
	/**
	 * ɾ������
	 */
	public void delAuthor(Author author);
	
	/**
	 * �޸�������Ϣ
	 */
	public void updateAuthor(Author author);
	
	/**
	 *��ȡ�����б�
	 * @return List �����б�
	 */
	public List listAuthor();
	
	/**
	 * ����ID��������
	 * @return  Author ���߶���
	 */
	public Author getAuthorById(int authorId);
	
	public Author getAuthorByName(String name);
}
