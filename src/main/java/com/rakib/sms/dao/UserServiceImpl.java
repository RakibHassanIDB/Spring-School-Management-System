/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.dao;


import com.rakib.sms.model.User;
import com.rakib.sms.model.Userrole;
import com.rakib.sms.service.Userservice;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author HP
 */
@Repository
public class UserServiceImpl implements Userservice{

    
     @Autowired
    SessionFactory sessionFactory;
     
    @Override
    public String acceptUser(User u) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String insertUser(User u) {
        
        
         String status;
        try {
            Session s = sessionFactory.openSession();
            Transaction t = s.getTransaction();
            t.begin();
            Userrole role = new Userrole();                                   
            role.setEmailid(u.getEmailid());
            role.setPassword(u.getPassword());
            role.setRole(u.getRole());            
            s.save(u);
            s.save(role);            
            t.commit();
            s.close();
            status = "Success";
            //logger.info("End of insert user method in userservice impl");
        } catch (Exception e) {
            //logger.info("inside catch accept user method in userservice impl");
            e.printStackTrace();
            status = "Fail";
        }
        return status;
    }

    @Override
    public String updateUser(User u) {
        return null;
    }

    @Override
    public String deleteUser(User u) {
         return null;
    }

    @Override
    public String viewUsers(User u) {
         return null;
    }

    @Override
    public User viewUser(String s) {
        Session sc = sessionFactory.openSession();
        Transaction t = sc.getTransaction();
        t.begin();
        User us = (User) sc.get(User.class, s);
        t.commit();
        sc.close();
        //logger.info("end of view user method in userservice impl");
        return us;
    }
   
    
    
}
