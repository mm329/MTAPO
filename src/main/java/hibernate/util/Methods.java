package hibernate.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import hibernate.entity.Choose;
import hibernate.entity.Propose;
import hibernate.entity.Themes;
import hibernate.entity.Users;

public class Methods {

	Session session = HibernateUtil.getCurrentSession();
	Transaction transaction = null;
	public static String APPROVED_STATUS = "Approved";
	public static String REJECTED_STATUS = "Rejected";
	public static String PENDING_STATUS = "Pending";
	
	public void addThemes(String name, String profName) {
		Session session = HibernateUtil.getCurrentSession();

		try {
			transaction = session.beginTransaction();
			Themes themes = new Themes();
			themes.setName(name);
			themes.setProfName(profName);
			session.save(themes);
			transaction.commit();
			System.out.println("Theme added sucessessfully");
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSession(session);
		}
	}

	public void deleteThemes(int id) {
		try {
			transaction = session.beginTransaction();
			String queryString = "from Themes where id = :id";
			Query query = session.createQuery(queryString);
			query.setInteger("id", id);
			Themes themes = (Themes) query.uniqueResult();
			if (themes == null) {
				System.out.println("Not exist!");
			} else {
				session.delete(themes);
				transaction.commit();
				System.out.println("Theme deleted!");
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSession(session);
		}
	}

	public void editThemes(int id, String name, String profName) {
		try {
			transaction = session.beginTransaction();
			String queryString = "from Themes where id = :id";
			Query query = session.createQuery(queryString);
			query.setInteger("id", id);
			Themes themes = (Themes) query.uniqueResult();
			if (themes == null) {
				System.out.println("Theme not exist!");
			} else {
				themes.setId(id);
				themes.setName(name);
				themes.setProfName(profName);
				session.update(themes);
				transaction.commit();
				System.out.println("Theme updated!");
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSession(session);
		}
	}

	public Themes retrieveThemes(int id) {
		Themes themes = new Themes();
		try {
			transaction = session.beginTransaction();
			String queryString = "from Themes where id = :id";
			Query query = session.createQuery(queryString);
			query.setInteger("id", id);
			themes = (Themes) query.uniqueResult();
			if (themes == null) {
				System.out.println("Themes not exist!");
			} else {
				transaction.commit();
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSession(session);
		}
		return themes;
	}
	
	public List<Themes> getListOfThemes(){
        List<Themes> list = new ArrayList<Themes>();
        transaction = session.beginTransaction();      
        try {
            list = session.createQuery("from Themes").list();                       
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
            	transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return list;
    }
	
	public void proposeThemes(String themeName, int userId) {
		try {
			transaction = session.beginTransaction();
			Propose propose = new Propose();
			propose.setPropose(themeName);
			propose.setIdUser(userId);
			propose.setDate(new Date());
			propose.setStatus(PENDING_STATUS);
			session.save(propose);
			transaction.commit();
			System.out.println("Added proposal");
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSession(session);
		}
	}
	
	public LinkedHashMap<Propose, Users> getListOfProposal() {
		LinkedHashMap<Propose, Users> lhm = new LinkedHashMap<Propose, Users>();
		transaction = session.beginTransaction();
		try {
			String hql = "from Propose as propose, Users as user where propose.status = :status";
			Query query = session.createQuery(hql);
			query.setString("status", PENDING_STATUS);
			List<?> list = query.list();

			for (int i = 0; i < list.size(); i++) {
				Object[] row = (Object[]) list.get(i);
				Propose prop = (Propose) row[0];
				Users us = (Users) row[1];
				lhm.put(prop, us);
				System.out.println(lhm.toString());
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			session.close();
		}
		return lhm;
	}

	public void approvedOrRejected(int idProposal, String status) {
		try {
			transaction = session.beginTransaction();
			String queryString = "from Propose where idPropose = :id";
			Query query = session.createQuery(queryString);
			query.setInteger("id", idProposal);
			Propose propose = (Propose) query.uniqueResult();
			if (propose == null) {
				System.out.println("Propose not exist!");
			} else {
				propose.setStatus(status);
				session.update(propose);
				transaction.commit();
				System.out.println("Status updated!");
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSession(session);
		}
	}
	
	public ArrayList<Propose> getListOfProposeByUser(int idUser) {
		ArrayList<Propose> arProp = new ArrayList<Propose>();
		try {
			transaction = session.beginTransaction();
			String queryString = "from Propose where idUser = :idUser";
			Query query = session.createQuery(queryString);
			query.setInteger("idUser", idUser);
			arProp = (ArrayList<Propose>) query.list();                       
            transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSession(session);
		}
		return arProp;
	}
	
	public ArrayList<Themes> getListOfTeacher(){
		ArrayList<Themes> arProp = new ArrayList<Themes>();
		try {
			transaction = session.beginTransaction();
			String queryString = "from Themes";
			Query query = session.createQuery(queryString);
			arProp = (ArrayList<Themes>) query.list();                       
            transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSession(session);
		}
		return arProp;
    }
	
	public ArrayList<Themes> getThemeByTeacher(String profName){
		ArrayList<Themes> arProp = new ArrayList<Themes>();
		try {
			transaction = session.beginTransaction();
			String queryString = "from Themes where profName = :profName";
			Query query = session.createQuery(queryString);
			query.setString("profName", profName);
			arProp = (ArrayList<Themes>) query.list();                       
            transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSession(session);
		}
		return arProp;
    }
	
	public void chooseTheme(int idUser, String theme, String profName) {
		try {
			transaction = session.beginTransaction();
			Choose themes = new Choose();
			themes.setIdUser(idUser);
			themes.setProfName(profName);
			themes.setTheme(theme);
			themes.setDate(new Date());
			session.save(themes);
			transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSession(session);
		}
	}
	
	public Choose getChoose(int idUser) {
		Choose choose= new Choose();
		Session session = HibernateUtil.getCurrentSession();
		try {
			transaction = session.beginTransaction();
			String queryString = "from Choose where idUser = :id";
			Query query = session.createQuery(queryString);
			query.setInteger("id", idUser);
			choose = (Choose) query.uniqueResult();
			if (choose == null) {
				System.out.println("Theme does not exist!");
			} else {
				transaction.commit();
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return choose;
	}
	
	public void editChoosedTheme(int idUser, String teacher, String themeName) {
		Choose choose= new Choose();
		Session session = HibernateUtil.getCurrentSession();
		try {
			transaction = session.beginTransaction();
			String queryString = "from Choose where idUser = :id";
			Query query = session.createQuery(queryString);
			query.setInteger("id", idUser);
			choose = (Choose) query.uniqueResult();
			if (choose == null) {
				System.out.println("Theme does not exist!");
			} else {
				choose.setProfName(teacher);
				choose.setTheme(themeName);
				session.save(choose);
				System.out.println("The choosed theme was modified");
				transaction.commit();
			}
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	public synchronized void insertFromPDF(String name, String profName) {
		Session session2 = null;
		try {
			session2 = HibernateUtil.getCurrentSession();
			System.out.println("session2: "+session2+" cu: name=" +name+" si profname: "+profName);
			transaction = session2.beginTransaction();
			Themes propose = new Themes();
			propose.setName(name);
			propose.setProfName(profName);
			session2.save(propose);
			session2.flush();
			session2.clear();
			transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
		}finally {
//			if (session2 != null){
//				session2.close();
//			}
		}
	}

	
}
