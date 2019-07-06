/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.dao;

import com.rakib.sms.service.PaymentService;
import com.rakib.sms.model.Payment;
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
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public String insertMonthlypayment(Payment pay) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        s.save(pay);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String updateMonthlypayment(int payid, Payment pay) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Payment onepayobject = (Payment) s.get(Payment.class, payid);
        onepayobject.setPayid(pay.getPayid());
        onepayobject.setRegid(pay.getRegid());
        onepayobject.setPayofmonth(pay.getPayofmonth());
        onepayobject.setPayammount(pay.getPayammount());
        onepayobject.setPaydate(pay.getPaydate());
        s.update(onepayobject);
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String deleteMonthlypayment(int payid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Payment pay = (Payment) s.get(Payment.class, payid);
        if (null != pay) {
            s.delete(pay);
        }
        t.commit();
        s.close();
        return null;
    }

    @Override
    public String viewMonthlypayment() {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        List<Payment> paylist = s.createQuery("from Payment").list();
        Gson g = new Gson();
        String ctlistgson = g.toJson(paylist);
        t.commit();
        s.close();
        return ctlistgson;
    }

    @Override
    public Payment viewOneMonthlypayment(int payid) {
        Session s = sessionFactory.openSession();
        Transaction t = s.getTransaction();
        t.begin();
        Payment pay = (Payment) s.get(Payment.class, payid);
        t.commit();
        s.close();
        return pay;
    }

}
