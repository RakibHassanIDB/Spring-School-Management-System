package com.rakib.sms.dao;

import com.google.gson.Gson;
import com.rakib.sms.model.Stgroup;
import com.rakib.sms.model.Examinfo;
import com.rakib.sms.service.StgroupService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StgroupServiceImpl implements StgroupService {

    @Autowired
    SessionFactory sessionfac;

    @Override
    public String insertStgroup(Stgroup sub) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(sub);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateStgroup(Stgroup sub) {
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
    public Integer deleteStgroup(int id) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Stgroup sub = (Stgroup) s.get(Stgroup.class, id);
        s.delete(sub);
        t.commit();
        s.close();

        return null;
    }

    @Override
    public String viewStgroup() {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Stgroup> sublist = s.createQuery("from Stgroup").list();
        Gson g = new Gson();
        String sublistgson = g.toJson(sublist);
        t.commit();
        s.close();
        //System.out.println(categorylistgson);
        return sublistgson;
    }

    @Override
    public Stgroup viewOneStgroup(int id) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Stgroup sub = (Stgroup) s.get(Stgroup.class, id);
        t.commit();
        s.close();
        Gson g = new Gson();
        String subgson = g.toJson(sub);
        return sub;
    }

}
