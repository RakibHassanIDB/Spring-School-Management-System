
package com.rakib.sms.dao;


import com.google.gson.Gson;
import com.rakib.sms.model.Classteacher;
import com.rakib.sms.service.ClassteacherService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ClassteacherServiceImpl implements ClassteacherService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertClassteacher(Classteacher ct) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(ct);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateClassteacher(int cteacherid, Classteacher ct) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Classteacher onectobject = (Classteacher) s.get(Classteacher.class, cteacherid);
        onectobject.setAssignid(ct.getAssignid());
        onectobject.setClassid(ct.getClassid());
        onectobject.setGroupid(ct.getGroupid());
        onectobject.setSecid(ct.getSecid());
        onectobject.setTid(ct.getTid());
        onectobject.setYearid(ct.getYearid());

        s.update(onectobject);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteClassteachert(int cteacherid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Classteacher ct = (Classteacher) s.get(Classteacher.class, cteacherid);
        s.delete(ct);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewClassteacher() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Classteacher> ctlist = s.createQuery("from Classteacher").list();
        Gson g = new Gson();
        String ctlistgson = g.toJson(ctlist);
        t.commit();
        s.close();
        return ctlistgson;
    }

    @Override
    public Classteacher viewOneClassteacher(int cteacherid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Classteacher ct = (Classteacher) s.get(Classteacher.class, cteacherid);
        t.commit();
        s.close();
        return ct;
    }

}
