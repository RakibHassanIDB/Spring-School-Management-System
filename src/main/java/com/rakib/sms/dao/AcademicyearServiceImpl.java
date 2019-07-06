package com.rakib.sms.dao;

import com.google.gson.Gson;
import com.rakib.sms.model.Academicyear;
import com.rakib.sms.service.AcademicyearService;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AcademicyearServiceImpl implements AcademicyearService {

    @Autowired
    SessionFactory sessionfac;

    @Override
    public String insertAcademicyear(Academicyear sub) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(sub);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateAcademicyear(Academicyear sub) {
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
    public Integer deleteAcademicyear(int id) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Academicyear sub = (Academicyear) s.get(Academicyear.class, id);
        s.delete(sub);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewAcademicyear() {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Academicyear> sublist = s.createQuery("from Academicyear").list();
        Gson g = new Gson();
        String sublistgson = g.toJson(sublist);
        t.commit();
        s.close();
        //System.out.println(categorylistgson);
        return sublistgson;
    }

    @Override
    public Academicyear viewOneAcademicyear(int id) {
        Session s = sessionfac.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Academicyear sub = (Academicyear) s.get(Academicyear.class, id);
        t.commit();
        s.close();
        Gson g = new Gson();
        String subgson = g.toJson(sub);
        return sub;
    }
    
    @Override
    public Academicyear viewOneyearbyaccyear(String acyear) {
        Session s = sessionfac.openSession();
        Academicyear accyear = new Academicyear();
        Transaction t = s.getTransaction();
        t.begin();
        Query q = s.createQuery("  from Academicyear where accyear=?");
        q.setParameter(0, acyear);
        List<Academicyear> yearlist = q.setParameter(0, acyear).list();
        t.commit();
        s.close();
        return yearlist.get(0); 
    }

}
