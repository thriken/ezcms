/**
 * SiteInfo Dao �ӿ�
 * 2011-07-22
 * Write by Thriken
 */
package ezcms.dao;
import ezcms.entity.*;

/**
 * @author Administrator
 *
 */
public interface SiteInfoDao {
	/***
	 * ��ȡվ����Ϣ
	 * @return	SiteInfo ����
	 * @throws Exception
	 */
	public SiteInfo getSiteInfo()throws Exception;
	
	/***
	 * �޸�վ����Ϣ
	 * @param si SiteInfo ����
	 * @return	Ӱ�������
	 * @throws Exception
	 */
	public int uptSiteInfo(SiteInfo si )throws Exception;
}
