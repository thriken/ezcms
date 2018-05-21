/**
 * �Ӳ˵�DAO
 * Write by Thriken
 * 2011-07-22
 */
package ezcms.dao;
import ezcms.entity.*;
import java.util.*;
/**
 * @author Administrator
 *
 */
public interface LeftMenuDao {
	
	/***
	 * ��ȡ�Ӳ�˵�
	 * @param aname ���˵�����
	 * @return	�Ӳ˵��б�
	 * @throws Exception
	 */
	public List<LeftMenu> getLeftMenu(int mid)throws Exception;
	
	/***
	 * ����Ӳ˵�
	 * @param lm �Ӳ˵�����
	 * @return Ӱ�������
	 * @throws Exception
	 */
	public int addLeftMenu(LeftMenu lm)throws Exception;
	
	/***
	 * �޸��Ӳ˵�
	 * @param lm �Ӳ˵�����
	 * @return Ӱ�������
	 * @throws Exception
	 */
	public int uptLeftMenu(LeftMenu lm)throws Exception;
	
	/***
	 * ɾ���Ӳ˵�
	 * @param cid �Ӳ˵�ID
	 * @return Ӱ�������
	 * @throws Exception
	 */
	public int delLeftMenu(int cid)throws Exception;
}
