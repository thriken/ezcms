/****
 * ����ӿ�
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.dao;
import ezcms.entity.*;
import java.util.*;

public interface NoticeDao {
	
	/***
	 * ��ӹ���
	 * @param notice
	 * @return
	 */
	public int addNotice(Notice notice) throws Exception;
	
	/***
	 * ɾ������
	 * @param id
	 * @return
	 */
	public int delNotice(int id) throws Exception;
	
	/***
	 * �޸Ĺ���
	 * @param notice
	 * @return
	 */
	public int updateNotice(Notice notice) throws Exception;
	
	/***
	 * ��ȡ�����б�
	 * @return
	 */
	public List listNotice() throws Exception;
	
	/***
	 * ��ȡ���¹���
	 * @return
	 */
	public Notice getNewestNotice() throws Exception;
	
	/***
	 * ����ID�񹫸�
	 * @return
	 * @throws Exception
	 */
	public Notice getNoticeById(int id)throws Exception;
}
