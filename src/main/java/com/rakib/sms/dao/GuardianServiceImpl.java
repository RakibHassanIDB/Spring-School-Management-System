
package com.rakib.sms.dao;

import com.google.gson.Gson;
import com.rakib.sms.model.Guardian;
import com.rakib.sms.model.User;
import com.rakib.sms.model.Userrole;
import com.rakib.sms.service.GuardianService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuardianServiceImpl implements GuardianService{
    @Autowired
    SessionFactory sessionFactory;
    
    @Override
    public String insertGuardian(Guardian guar) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        
        User u = new User();
        Userrole ur = new Userrole();
        u.setEmailid(guar.getEmailid());
        u.setUsername(guar.getFname()+" "+guar.getLname());
        u.setPhone(guar.getContact());

        ur.setEmailid(guar.getEmailid());
        ur.setPassword(guar.getPassword());
        ur.setRole(guar.getRole());
        ur.setStatus(guar.getStatus());
        s.save(u);
        s.save(ur);
        s.save(guar);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateGuardian(int profileid, Guardian em) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Guardian gn = (Guardian) s.get(Guardian.class, profileid);
        gn.setProfileid(em.getProfileid());
        gn.setFname(em.getFname());
        gn.setLname(em.getLname());
        gn.setEmailid(em.getEmailid());
        gn.setOccupation(em.getOccupation());
        gn.setContact(em.getContact());
        gn.setGender(em.getGender());
        gn.setStid(em.getStid());
        gn.setStatus(em.getStatus());
        s.update(gn);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public Integer deleteGuardian(int id) {
       Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Guardian em = (Guardian) s.get(Guardian.class, id);
        s.delete(em);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewGuardian() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Guardian> guardianList = s.createQuery("from Guardian").list();
        Gson g = new Gson();
        String ctlistgson = g.toJson(guardianList);
        t.commit();
        s.close();
        return ctlistgson;
    }

    @Override
    public Guardian viewOneGuardian(int id) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Guardian ct = (Guardian) s.get(Guardian.class, id);
        t.commit();
        s.close();
        return ct;
    }
    
}
