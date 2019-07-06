package com.rakib.sms.dao;

import com.google.gson.Gson;
import com.rakib.sms.model.Notice;
import com.rakib.sms.service.NoticeService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    SessionFactory sessionfac;

    @Override
    public String insertNotice(Notice sub) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(sub);
        System.out.println(sub);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateNotice(Notice sub) {
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
    public Integer deleteNotice(int id) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Notice sub = (Notice) s.get(Notice.class, id);
        s.delete(sub);
        t.commit();
        s.close();

        return null;
    }

    @Override
    public String viewNotice() {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Notice> sublist = s.createQuery("from Notice").list();
        Gson g = new Gson();
        String sublistgson = g.toJson(sublist);
        t.commit();
        s.close();
        //System.out.println(categorylistgson);
        return sublistgson;
    }

    @Override
    public Notice viewOneNotice(int id) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Notice sub = (Notice) s.get(Notice.class, id);
        t.commit();
        s.close();
        Gson g = new Gson();
        String subgson = g.toJson(sub);
        return sub;
    }

}
