/**
 * ���˵�DAO�ӿ�
 * 2011-07-22
 * Write By Thriken
 */
package ezcms.hibernate.dao;
import java.util.*;
import ezcms.entity.*;
/**
 * @author Administrator
 *	
 */
public interface ManageMenuDao {
	/***
	 * ��ȡ���˵�
	 * @return ���˵��б�
	 * @throws Exception
	 */
	public List getMianMenu()throws Exception;
	
	/***
	 * ������˵�
	 * @param mm ���˵�����
	 * @return	Ӱ�������
	 * @throws Exception
	 */
	public int addMMenu(MainMenu mm)throws Exception;
	
	/***
	 * ɾ�����˵�
	 * @param mid ���˵�ID
	 * @return	Ӱ�������
	 * @throws Exception
	 */
	public int delMMenu(int mid)throws Exception;
	
	/***
	 * �޸����˵�
	 * @param mm ���˵�����
	 * @return	Ӱ�������
	 * @throws Exception
	 */
	public int uptMMenu(MainMenu mm)throws Exception;
	
	
}
