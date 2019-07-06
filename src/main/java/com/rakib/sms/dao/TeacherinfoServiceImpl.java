/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.dao;

import com.rakib.sms.service.TeacherinfoService;
import com.rakib.sms.model.Teacherinfo;
import com.google.gson.Gson;
import com.rakib.sms.model.User;
import com.rakib.sms.model.Userrole;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author HP
 */
@Repository
public class TeacherinfoServiceImpl implements TeacherinfoService {

    @Autowired
    SessionFactory sessionFactory;

    @Override

    public String insertTeacher(Teacherinfo te) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        User u = new User();
        Userrole ur = new Userrole();
        u.setEmailid(te.getTemail());
        u.setUsername(te.getTname());
        u.setPhone(te.getTcontact());

        ur.setEmailid(te.getTemail());
        ur.setPassword(te.getPassword());
        ur.setRole(te.getRole());
        ur.setStatus(te.getStatus());
        ur.setImage(te.getTimage());

        s.save(te);
        s.save(u);
        s.save(ur);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateTeacher(int teacher_id, Teacherinfo teacher) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Teacherinfo oneteacherobject = (Teacherinfo) s.get(Teacherinfo.class, teacher_id);
        oneteacherobject.setTid(teacher.getTid());
        oneteacherobject.setSubjectid(teacher.getSubjectid());
        oneteacherobject.setTname(teacher.getTname());
        oneteacherobject.setTaddress(teacher.getTaddress());
        oneteacherobject.setTcontact(teacher.getTcontact());
        oneteacherobject.setTemail(teacher.getTemail());
        oneteacherobject.setTjoindate(teacher.getTjoindate());
        oneteacherobject.setTgender(teacher.getTgender());
        oneteacherobject.setTstatus(teacher.getTstatus());
        s.update(oneteacherobject);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteTeacher(int teacher_id) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Teacherinfo teacher = (Teacherinfo) s.get(Teacherinfo.class, teacher_id);
        s.delete(teacher);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewTeacher() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Teacherinfo> teacherlist = s.createQuery("from Teacherinfo").list();
        Gson g = new Gson();
        String teacherlistgson = g.toJson(teacherlist);
        t.commit();
        s.close();
        return teacherlistgson;
    }

    @Override
    public Teacherinfo viewOneTeacher(int teacher_id) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Teacherinfo teacher = (Teacherinfo) s.get(Teacherinfo.class, teacher_id);
        t.commit();
        s.close();
        return teacher;
    }

    @Override
    public Teacherinfo showOneTeacherbyEmail(String email) {
        Session s = sessionFactory.openSession();
        Teacherinfo teinfo = new Teacherinfo();
        Transaction t = s.getTransaction();
        t.begin();
        Query q = s.createQuery(" select u from Teacherinfo u where temail=?");

        List<Teacherinfo> sinfo = q.setParameter(0, email).list();

        t.commit();
        s.close();
        return sinfo.get(0);
    }
}
