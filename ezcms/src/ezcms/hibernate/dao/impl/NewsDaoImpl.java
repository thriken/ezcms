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
		log.debug("��� ����");
		try {
			getSession().save(news);
			log.debug("������ųɹ�");
		} catch (RuntimeException re) {
			log.debug("�������ʧ��");
		}
	}

	public void delNews(int nid) {
		// TODO Auto-generated method stub

	}

	public void updateNews(News news) {
		// TODO Auto-generated method stub

	}

	public List listNews() {
		log.debug("��ȡ��������");
		try {
			String qstr = "from News";
			Query query = getSession().createSQLQuery(qstr);
			return query.list();
		} catch (RuntimeException e) {
			log.debug("��ȡ�������� ʧ��");
			throw e;
		}
	}

	public List listNewsByClassId(int cid) {
		log.debug("��ȡ�������ţ�classId:"+cid);
		try {
			String qstr = "from News where classId=?";
			Query query = getSession().createSQLQuery(qstr);
			query.setInteger(0, cid);
			return query.list();
		} catch (RuntimeException e) {
			log.debug("��ȡ�������� ʧ��");
			throw e;
		}
	}

	public News getNewsById(int nid) {
		log.debug("��ȡ����  nid:"+nid);
		try {
			News news = (News) getSession().get("ezcms.entity.News", nid);
			return news;
		} catch (RuntimeException e) {
			log.debug("��ȡ����ʧ��");
			throw e;
		}
	}

	public List searchNewsByTitleKeyword(String keyword) {
		log.debug("��������  �ؼ���:"+keyword);
		try {
			String queryString = "from News as model where model.title like '%"+keyword+"%'";
			Query query = getSession().createQuery(queryString);
			return query.list();
		} catch (RuntimeException e) {
			log.debug("�������Źؼ��� ʧ��");
			throw e;
		}
	}

	public List listNewsByAuthor(Author author) {
		log.debug("�������߻�ȡ����   ���ߣ�"+author.getName());
		try {
			author = new AuthorDaoImpl().getAuthorByName(author.getName());
			String qstr = "from News n join fetch n.Author a where a.name=?";
			Query query = getSession().createQuery(qstr);
			query.setString(0, author.getName());
			return query.list();
		} catch (RuntimeException e) {
			log.debug("�������߻�ȡ����   ʧ��");
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
