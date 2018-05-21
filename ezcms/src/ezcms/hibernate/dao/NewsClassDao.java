/****
 * ���ŷ���ӿ�
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.hibernate.dao;

import java.util.*;
import ezcms.entity.*;

public interface NewsClassDao {
	
	/***
	 * ��ӷ���
	 * @return
	 */
	public int addClass(NewsClass nclass)throws Exception;
	
	/***
	 * ɾ������
	 * @return
	 */
	public int delClass(int classId)throws Exception;
	
	/***
	 * �޸ķ�����
	 * @return
	 */
	public int updateClass(NewsClass nclass)throws Exception;
	
	/***
	 * ��ȡ���з���
	 * @return  �����б�
	 */
	public List listAllClass()throws Exception;
	
	/***
	 * ���ݷ���ID��ȡ����
	 * @return
	 */
	public NewsClass getClassById(int classId)throws Exception;
}
