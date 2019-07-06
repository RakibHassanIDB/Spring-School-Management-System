package com.rakib.sms.dao;

import com.google.gson.Gson;
import com.rakib.sms.model.Classname;
import com.rakib.sms.model.Examinfo;
import com.rakib.sms.service.ClassnameService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClassnameServiceImpl implements ClassnameService {

    @Autowired
    SessionFactory sessionfac;

    @Override
    public String insertClassname(Classname sub) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(sub);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateClassname(Classname sub) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        //CategoriesModel cm = (CategoriesModel)s.get(CategoriesModel.class, categoryid);
        s.update(sub);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public Integer deleteClassname(int id) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Classname sub = (Classname) s.get(Classname.class, id);
        s.delete(sub);
        t.commit();
        s.close();

        return null;
    }

    @Override
    public String viewClassname() {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Classname> sublist = s.createQuery("from Classname").list();
        Gson g = new Gson();
        String sublistgson = g.toJson(sublist);
        t.commit();
        s.close();
        //System.out.println(categorylistgson);
        return sublistgson;
    }

    @Override
    public Classname viewOneClassname(int id) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Classname sub = (Classname) s.get(Classname.class, id);
        t.commit();
        s.close();
        Gson g = new Gson();
        String subgson = g.toJson(sub);
        return sub;
    }

}
