package ezcms.hibernate.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ezcms.entity.Author;
import ezcms.entity.News;
import ezcms.hibernate.dao.AuthorDao;
import ezcms.hibernate.dao.NewsDao;

public class NewsDaoImpl extends BaseHibernateDAO implements NewsDao {
	private static final Logger log = LoggerFactory.getLogger(NewsDaoImpl.class);
	public void addNews(News news) {
		log.debug("添加 新闻");
		try {
			getSession().save(news);
			log.debug("添加新闻成功");
		} catch (RuntimeException re) {
			log.debug("添加新闻失败");
		}
	}

	public void delNews(int nid) {
		// TODO Auto-generated method stub

	}

	public void updateNews(News news) {
		// TODO Auto-generated method stub

	}

	public List listNews() {
		log.debug("获取所有新闻");
		try {
			String qstr = "from News";
			Query query = getSession().createSQLQuery(qstr);
			return query.list();
		} catch (RuntimeException e) {
			log.debug("获取所有新闻 失败");
			throw e;
		}
	}

	public List listNewsByClassId(int cid) {
		log.debug("获取分类新闻：classId:"+cid);
		try {
			String qstr = "from News where classId=?";
			Query query = getSession().createSQLQuery(qstr);
			query.setInteger(0, cid);
			return query.list();
		} catch (RuntimeException e) {
			log.debug("获取分类新闻 失败");
			throw e;
		}
	}

	public News getNewsById(int nid) {
		log.debug("获取新闻  nid:"+nid);
		try {
			News news = (News) getSession().get("ezcms.entity.News", nid);
			return news;
		} catch (RuntimeException e) {
			log.debug("获取新闻失败");
			throw e;
		}
	}

	public List searchNewsByTitleKeyword(String keyword) {
		log.debug("搜索新闻  关键字:"+keyword);
		try {
			String queryString = "from News as model where model.title like '%"+keyword+"%'";
			Query query = getSession().createQuery(queryString);
			return query.list();
		} catch (RuntimeException e) {
			log.debug("搜索新闻关键字 失败");
			throw e;
		}
	}

	public List listNewsByAuthor(Author author) {
		log.debug("根据作者获取新闻   作者："+author.getName());
		try {
			author = new AuthorDaoImpl().getAuthorByName(author.getName());
			String qstr = "from News n join fetch n.Author a where a.name=?";
			Query query = getSession().createQuery(qstr);
			query.setString(0, author.getName());
			return query.list();
		} catch (RuntimeException e) {
			log.debug("根据作者获取新闻   失败");
			throw e;
		}
	}
	
	public static void main(String[] args) {
		NewsDao nd = new NewsDaoImpl();
		Author author = new Author();
		author.setName("accp");
		for(Object o:nd.listNewsByAuthor(author)){
			System.out.println(((News)o).getTitle());
		}
	}
}
