package com.rakib.sms.dao;

import com.google.gson.Gson;
import com.rakib.sms.model.Studentinfo;
import com.rakib.sms.model.User;
import com.rakib.sms.model.Userrole;
import com.rakib.sms.service.StudentinfoService;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentinfoServiceImpl implements StudentinfoService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertstudent(Studentinfo st) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        User u = new User();
        Userrole ur = new Userrole();
        u.setEmailid(st.getEmailid());
        u.setUsername(st.getStname());
        u.setPhone(st.getStcontact());

        ur.setEmailid(st.getEmailid());
        ur.setPassword(st.getPassword());
        ur.setRole(st.getRole());
        ur.setStatus(st.getStstatus());
        ur.setImage(st.getStimage());
        t.begin();
        s.save(st);
        s.save(u);
        s.save(ur);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updatestudent(int stuid, Studentinfo st) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Studentinfo onestuobject = (Studentinfo) s.get(Studentinfo.class, stuid);
        onestuobject.setStid(st.getStid());
        onestuobject.setStname(st.getStname());
        onestuobject.setStfathername(st.getStfathername());
        onestuobject.setStmothername(st.getStmothername());
        onestuobject.setParmanentaddress(st.getParmanentaddress());
        onestuobject.setPresentaddress(st.getPresentaddress());
        onestuobject.setStage(st.getStage());
        onestuobject.setStcontact(st.getStcontact());
        onestuobject.setStdob(st.getStdob());
        onestuobject.setStgender(st.getStgender());
        onestuobject.setStstatus(st.getStstatus());
        onestuobject.setStimage(st.getStimage());
        s.update(onestuobject);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deletestudent(int stuid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Studentinfo teacher = (Studentinfo) s.get(Studentinfo.class, stuid);
        s.delete(teacher);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewstudent() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Studentinfo> stulist = s.createQuery("from Studentinfo").list();
        Gson g = new Gson();
        String stulistgson = g.toJson(stulist);
        t.commit();
        s.close();
        return stulistgson;
    }

    @Override
    public Studentinfo viewOnestudent(int stuid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Studentinfo student = (Studentinfo) s.get(Studentinfo.class, stuid);
        t.commit();
        s.close();
        return student;
    }

    @Override
    public Studentinfo viewstudentprofile(int stuid) {
        Session s = sessionFactory.openSession();
        Studentinfo stinfo = new Studentinfo();
        Transaction t = s.getTransaction();
        t.begin();
        Query q = s.createQuery(" select  Studentinfo  where stid=?");

        List<Studentinfo> stulist = q.setParameter(0, stuid).list();

        t.commit();
        s.close();
        return stulist.get(0);
    }

    @Override
    public Studentinfo viewSt(String s) {
        Session sc = sessionFactory.openSession();
        Transaction t = sc.getTransaction();
        t.begin();
        Studentinfo us = (Studentinfo) sc.get(Studentinfo.class, s);
        t.commit();
        sc.close();
        //logger.info("end of view user method in userservice impl");
        return us;
    }
    
    @Override
    public Studentinfo showOneStudentbyEmail(String email) {
        Session s = sessionFactory.openSession();
        Studentinfo stinfo = new Studentinfo();
        Transaction t = s.getTransaction();
        t.begin();
        Query q = s.createQuery(" select u from Studentinfo u where emailid=?");

        List<Studentinfo> sinfo = q.setParameter(0, email).list();

        t.commit();
        s.close();
        return sinfo.get(0);
    }

}
