/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.dao;

import com.google.gson.Gson;
import com.rakib.sms.model.Classsection;
import com.rakib.sms.service.ClasssectionService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClasssectionServiceImpl implements ClasssectionService{
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertClasssection(Classsection pm) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(pm);
        t.commit();
        s.close();
        return null;   
    }

    @Override
    public Integer updateClasssection(int secid, Classsection pm) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Classsection Classsectionobject = (Classsection) s.get(Classsection.class, secid);
        Classsectionobject.setClassid(pm.getClassid());
        Classsectionobject.setSecname(pm.getSecname());
        Classsectionobject.setSecstatus(pm.getSecstatus());
        s.update(Classsectionobject);
        t.commit();
        s.close();
        return null;    
    }

    @Override
    public Integer deleteClasssection(int secid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Classsection pm = (Classsection) s.get(Classsection.class, secid);
        s.delete(pm);
        t.commit();
        s.close();
        return null;    
    }

    @Override
    public String viewClasssection() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Classsection> productslist = s.createQuery("from Classsection").list();
        Gson g = new Gson();
        String productslistgson = g.toJson(productslist);
        t.commit();
        s.close();
        return productslistgson;    
    }

    @Override
    public Classsection viewOneClasssection(int secid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Classsection pm = (Classsection) s.get(Classsection.class, secid);
        t.commit();
        s.close();
        return pm;    
    }
    
}
