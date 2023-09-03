package hibernate.util;

import hibernate.entity.Themes;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import hibernate.entity.Choose;
import hibernate.entity.Propose;
import hibernate.entity.Users;

public class HibernateUtil {

    private static SessionFactory sessionFactory;
    private static Session session;

    static {
        try {
            Configuration configuration = new Configuration();
            configuration.addAnnotatedClass(Propose.class);
            configuration.addAnnotatedClass(Users.class);
            configuration.addAnnotatedClass(Choose.class);
            configuration.addAnnotatedClass(Themes.class);
            sessionFactory = configuration.configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("Errooore SessionFactory" + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session getCurrentSession() {
        session = sessionFactory.openSession();
        return session;
    }

    public static void closeSession(Session session) {
        if (null != session) {
            session.close();
        }
    }
}
