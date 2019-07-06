package com.rakib.sms.dao;

import com.google.gson.Gson;
import com.rakib.sms.model.Examinfo;
import com.rakib.sms.service.ExaminfoService;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExaminfoServiceImpl implements ExaminfoService {

    @Autowired
    SessionFactory sessionfac;

    @Override
    public String insertExaminfo(Examinfo sub) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(sub);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateExaminfo(Examinfo sub) {
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
    public Integer deleteExaminfo(int id) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Examinfo sub = (Examinfo) s.get(Examinfo.class, id);
        s.delete(sub);
        t.commit();
        s.close();

        return null;
    }

    @Override
    public String viewExaminfo() {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Examinfo> sublist = s.createQuery("from Examinfo").list();
        Gson g = new Gson();
        String sublistgson = g.toJson(sublist);
        t.commit();
        s.close();
        //System.out.println(categorylistgson);
        return sublistgson;
    }

    @Override
    public Examinfo viewOneExaminfo(int id) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Examinfo sub = (Examinfo) s.get(Examinfo.class, id);
        t.commit();
        s.close();
        Gson g = new Gson();
        String subgson = g.toJson(sub);
        return sub;
    }

    @Override
    public Examinfo viewOneExamtitle(String extitle) {
        Session s = sessionfac.openSession();
        Examinfo etitle = new Examinfo();
        Transaction t = s.getTransaction();
        t.begin();
        Query q = s.createQuery("  from Examinfo where examtitle=?");
        q.setParameter(0, extitle);
        List<Examinfo> etitlelist = q.setParameter(0, extitle).list();
        t.commit();
        s.close();
        return etitlelist.get(0);

    }

}
