package hibernate.util;

import hibernate.entity.Users;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class UsersUtils {
    static Transaction transaction = null;

    public static String stringMd5(String s) {
        MessageDigest m = null;
        try {
            m = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        m.reset();
        m.update(s.getBytes());
        byte[] digest = m.digest();
        BigInteger bigInt = new BigInteger(1, digest);
        String hashtext = bigInt.toString(16);
        // Now we need to zero pad it if you actually want the full 32 chars.
        while (hashtext.length() < 32) {
            hashtext = "0" + hashtext;
        }
        return hashtext;
    }

    public static Users retrieveUser(String email, String password) {
        System.out.println("Retrive user with: email: " + email + " and pass: " + password);
        Users user = new Users();
        Session session = HibernateUtil.getCurrentSession();
        try {
            transaction = session.beginTransaction();
            String queryString = "from Users where email = :email and password = :pass";
            Query query = session.createQuery(queryString);
            query.setString("pass", password);
            query.setString("email", email);
            user = (Users) query.uniqueResult();
            if (user == null) {
                System.out.println("Users not exist!");
            } else {
                transaction.commit();
            }
        } catch (HibernateException e) {
            transaction.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }

    public static void createUser(Users user) {

        Session session = HibernateUtil.getCurrentSession();
        try {
            transaction = session.beginTransaction();
            session.save(user);
            System.out.println("id generat = " + user.getIdUser());
            transaction.commit();
            System.out.println("User created sucessessfully");
        } catch (HibernateException e) {
            transaction.rollback();
            e.printStackTrace();
        } finally {
            HibernateUtil.closeSession(session);
        }

    }

}
