/****
 * ����Ա�ӿ�
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.hibernate.dao;

import java.util.List;
import ezcms.entity.*;

public interface AdminDao {
	/**
	 * ��ӹ���Ա
	 * @return int Ӱ�������
	 */
	public int addAdmin(Admin admin);

	/**
	 * ɾ������Ա
	 * @return int Ӱ�������
	 */
	public int delAdmin(int id);
	
	/**
	 * �޸Ĺ���Ա��Ϣ
	 * @return int Ӱ�������
	 */
	public int updateAdmin(Admin admin);
	
	/**
	 *��ȡ����Ա�б�
	 * @return List ����Ա�б�
	 */
	public List listAdmin();
	
	/**
	 * ����ID���ҹ���Ա
	 * @return  Admin ����Ա����
	 */
	public Admin getAdminById(int id);
	
	/**
	 * �������Ʋ��ҹ���Ա
	 * @return  Admin ����Ա����
	 */
	public Admin getAdminByName(String name);
}
