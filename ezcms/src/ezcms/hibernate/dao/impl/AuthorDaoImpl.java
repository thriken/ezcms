package ezcms.hibernate.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ezcms.entity.Author;
import ezcms.hibernate.dao.AuthorDao;

public class AuthorDaoImpl extends BaseHibernateDAO implements AuthorDao {
	private static final Logger log = LoggerFactory.getLogger(AuthorDaoImpl.class);
	public void addAuthor(Author author) {
		log.debug("saving author instance");
		try {
			getSession().save(author);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delAuthor(Author author) {
		log.debug("delete author");
		try {
			getSession().delete(author);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public void updateAuthor(Author author) {
		log.debug("update author");
		try {
			getSession().update(author);
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}

	public List listAuthor() {
		log.debug("list AllAuthor author");
		try {
			String queryString = "from Author";
			Query query = getSession().createQuery(queryString);
			log.debug("list AllAuthor successful");
			return query.list();
		} catch (RuntimeException re) {
			log.error("list AllAuthor failed", re);
			throw re;
		}
	}

	public Author getAuthorById(int authorId) {
		log.debug("getting Author instance with id: " + authorId);
		try {
			
			Author instance = (Author) getSession().get("ezcms.entity.Author", authorId);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public Author getAuthorByName(String name) {
		log.debug("getting Author instance with id: " + name);
		try {
			Author author = null;
			String queryString = "from Author as model where model.name=?";
			Query query = getSession().createQuery(queryString);
			query.setString(0, name.trim());
			List list = query.list();
			if(list.size()!=0){
				author = (Author)list.get(0);
				log.debug("getting Author instance ³É¹¦");
			}
			return author;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
