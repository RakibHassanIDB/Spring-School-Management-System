
package com.rakib.sms.dao;

import com.google.gson.Gson;
import com.rakib.sms.model.Exammark;
import com.rakib.sms.service.ExammarkService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ExammarkServiceImpl implements ExammarkService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertExammark(Exammark em) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(em);
        t.commit();
        s.close();
        return "success";
    }

    @Override
    public String updateExammark(Exammark em) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Exammark markobject = new Exammark();
        markobject.setMarkid(em.getMarkid());
        markobject.setClassid(em.getClassid());
        markobject.setGroupid(em.getGroupid());
        markobject.setSecid(em.getSecid());
        markobject.setStid(em.getStid());
        markobject.setYearid(em.getYearid());
        markobject.setExamid(em.getExamid());

        s.update(markobject);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteExammark(int markid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Exammark em = (Exammark) s.get(Exammark.class, markid);
        s.delete(em);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewExammark() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Exammark> marklist = s.createQuery("from Exammark").list();
        Gson g = new Gson();
        String ctlistgson = g.toJson(marklist);
        t.commit();
        s.close();
        return ctlistgson;
    }

    @Override
    public Exammark viewOneExammark(int markid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Exammark ct = (Exammark) s.get(Exammark.class, markid);
        t.commit();
        s.close();
        return ct;
    }

}
