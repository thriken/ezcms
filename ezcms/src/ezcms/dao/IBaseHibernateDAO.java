package ezcms.dao;

import org.hibernate.Session;

public interface IBaseHibernateDAO {
	public Session getSession();
}
