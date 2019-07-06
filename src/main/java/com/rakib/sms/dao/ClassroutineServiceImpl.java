/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.dao;

import com.rakib.sms.service.ClassroutineService;
import com.rakib.sms.model.Classroutine;
import com.google.gson.Gson;
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
public class ClassroutineServiceImpl implements ClassroutineService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertClassroutin(Classroutine cr) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(cr);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateClassroutin(int routinid, Classroutine cr) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Classroutine onecrobject = (Classroutine) s.get(Classroutine.class, routinid);
        onecrobject.setRoutineid(cr.getRoutineid());
        onecrobject.setClassid(cr.getClassid());
        onecrobject.setTid(cr.getTid());
        onecrobject.setSecid(cr.getSecid());
        onecrobject.setSubjectid(cr.getSubjectid());
        onecrobject.setPeriodname(cr.getPeriodname());
        onecrobject.setDayname(cr.getDayname());
        onecrobject.setPeriodtime(cr.getPeriodtime());

        s.update(onecrobject);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteClassroutin(int routinid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Classroutine cr = (Classroutine) s.get(Classroutine.class, routinid);
        s.delete(cr);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewClassroutin() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Classroutine> crlist = s.createQuery("from Classroutine").list();
        Gson g = new Gson();
        String ctlistgson = g.toJson(crlist);
        t.commit();
        s.close();
        return ctlistgson;
    }

    @Override
    public Classroutine viewOneClassroutin(int routinid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Classroutine ct = (Classroutine) s.get(Classroutine.class, routinid);
        t.commit();
        s.close();
        return ct;
    }

}
