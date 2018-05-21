/****
 * 公告接口
 * @author EZCMS CodeGroup
 *  2011-07-10
 */
package ezcms.dao;
import ezcms.entity.*;
import java.util.*;

public interface NoticeDao {
	
	/***
	 * 添加公告
	 * @param notice
	 * @return
	 */
	public int addNotice(Notice notice) throws Exception;
	
	/***
	 * 删除公告
	 * @param id
	 * @return
	 */
	public int delNotice(int id) throws Exception;
	
	/***
	 * 修改公告
	 * @param notice
	 * @return
	 */
	public int updateNotice(Notice notice) throws Exception;
	
	/***
	 * 获取公告列表
	 * @return
	 */
	public List listNotice() throws Exception;
	
	/***
	 * 获取最新公告
	 * @return
	 */
	public Notice getNewestNotice() throws Exception;
	
	/***
	 * 根据ID获公告
	 * @return
	 * @throws Exception
	 */
	public Notice getNoticeById(int id)throws Exception;
}
