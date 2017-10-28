/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.daos;

import java.util.List;
import model.pojos.Role;
import model.util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Ishan Ayesha
 */
public class RoleDAO {

    /**
     * Get Role List
     * @return 
     */
    public static List<Role> get() {
        List<Role> roleList = null;
        Transaction transaction = null;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            Query query = session.createQuery("FROM Role");
            roleList = query.list();
           
            transaction.commit();
        } catch (HibernateException e) {
            if (transaction != null) {
                transaction.rollback();
                e.printStackTrace();
            }
        } finally {
            session.close();
        }
        return roleList;
    }
    
    /**
     * Save or Update Role
     * @param role 
     */
    public static void saveOrUpdateRole(Role role){
        Transaction transaction = null;
        Session session = null;
        try{
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            session.saveOrUpdate(role);
            transaction.commit();
        } catch(HibernateException e){
            if (transaction != null) {
                transaction.rollback();
                e.printStackTrace();
            }
        } finally{
            session.close();
        }
    }
}
