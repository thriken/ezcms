/**
 * SiteInfo Dao 接口
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
	 * 获取站点信息
	 * @return	SiteInfo 对象
	 * @throws Exception
	 */
	public SiteInfo getSiteInfo()throws Exception;
	
	/***
	 * 修改站点信息
	 * @param si SiteInfo 对象
	 * @return	影响的行数
	 * @throws Exception
	 */
	public int uptSiteInfo(SiteInfo si )throws Exception;
}
