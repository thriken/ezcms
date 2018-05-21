package ezcms.utils;

import org.hibernate.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import com.sun.org.apache.commons.logging.*;

public class HibernateSessionFactory {
	public static Log log = LogFactory.getLog(HibernateSessionFactory.class) ;
	public Session getSession() {
		log.debug("ApplicationContext get sessionFactory");
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		SessionFactory sessionFactory  = (SessionFactory) context.getBean("sessionFac");
		Session session = null;
		if (session == null || !session.isOpen()) {
			session = (sessionFactory != null) ? sessionFactory.openSession() : null;
		}
		return session;
	}
}