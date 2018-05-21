package ezcms.hibernate.dao.impl;

import org.hibernate.Session;
import ezcms.dao.IBaseHibernateDAO;
import ezcms.utils.*;

public class BaseHibernateDAO implements IBaseHibernateDAO {

	public Session getSession() {
		HibernateSessionFactory sf = new HibernateSessionFactory();
		return sf.getSession();
	}

}
