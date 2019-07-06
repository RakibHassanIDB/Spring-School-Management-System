/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.dao;

import com.google.gson.Gson;
import com.rakib.sms.model.Studentattendance;
import com.rakib.sms.model.Studentregistration;
import com.rakib.sms.service.StudentattendanceService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author C7
 */
@Repository
public class StudentattendanceServiceImpl implements StudentattendanceService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String inserattendenc(Studentattendance sat) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(sat);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateattendenc(int satid, Studentattendance sat) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Studentattendance oneattobject = (Studentattendance) s.get(Studentattendance.class, satid);
        oneattobject.setAtid(sat.getAtid());
        oneattobject.setClassid(sat.getClassid());
        oneattobject.setGroupid(sat.getGroupid());
        oneattobject.setSecid(sat.getSecid());
        oneattobject.setRegid(sat.getRegid());
        oneattobject.setStid(sat.getStid());
        oneattobject.setAtdate(sat.getAtdate());
        oneattobject.setAtstatus(sat.getAtstatus());
        s.update(oneattobject);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteattendenc(int satid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Studentattendance statt = (Studentattendance) s.get(Studentattendance.class, satid);
        s.delete(statt);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewattendenc() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Studentattendance> attlist = s.createQuery("from Studentattendance").list();
        Gson g = new Gson();
        String stulistgson = g.toJson(attlist);
        t.commit();
        s.close();
        return stulistgson;
    }

    @Override
    public String viewattendencsheet(int clid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Studentregistration> streglist = s.createQuery("from Studentregistration  where classid=:clid").setParameter("clid", clid).list();
        Gson g = new Gson();
        String stureglistgson = g.toJson(streglist);
        t.commit();
        s.close();
        return stureglistgson;
    }

    @Override
    public Studentattendance viewOneattendenc(int satid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Studentattendance statt = (Studentattendance) s.get(Studentattendance.class, satid);
        t.commit();
        s.close();
        return statt;
    }

}
