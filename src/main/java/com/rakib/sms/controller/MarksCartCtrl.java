/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.controller;

import com.google.gson.Gson;
import com.rakib.sms.model.Exammark;
import com.rakib.sms.model.MarksCart;
import com.rakib.sms.model.MarksDetails;
import com.rakib.sms.service.ExaminfoService;
import com.rakib.sms.service.ExammarkService;
import com.rakib.sms.service.MarksDetailsService;
import com.rakib.sms.service.SubjectService;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MarksCartCtrl {

    @Autowired
    SubjectService sub;

    @Autowired
    ExaminfoService examin;

    @Autowired
    ExammarkService exs;

    @Autowired
    MarksDetailsService mards;

    @RequestMapping(value = "/showaddmarkpage")
    public ModelAndView showprescriptionlistpage(HttpSession session) {

        String sublist = sub.viewSubject();
        String examnamelist = examin.viewExaminfo();
        ModelAndView mv = new ModelAndView("admin/marksadd", "MarkObject", new Exammark());
        mv.addObject("subList", sublist);
        mv.addObject("einfoList", examnamelist);

        mv.addObject("check", "true");
        Gson g = new Gson();

        ArrayList<MarksCart> c = (ArrayList<MarksCart>) session.getAttribute("markCart");
        if (c.isEmpty()) {
            session.setAttribute("cartempty", "true");
            mv.addObject("itemsincart", "null");
            return mv;
        } else {
            String cartgson = g.toJson(c);
            mv.addObject("itemsincart", cartgson);
            System.out.println(cartgson);
            session.setAttribute("cartempty", "false");
            return mv;
        }

    }

    @RequestMapping("/addmarks2cart")
    public String addingToCart(HttpSession marksession, @ModelAttribute("MarkObject") Exammark mark) {

        String flag = "not inserted";
        ArrayList<MarksCart> cartarray = (ArrayList<MarksCart>) marksession.getAttribute("markCart");

        if (cartarray.isEmpty()) {
            cartarray.add(new MarksCart(mark.getSubjectid(), mark.getMarkobtain(), mark.getMarkgrade()));

            flag = "inserted";
        } else {

            Iterator<MarksCart> lit = cartarray.iterator();
            while (lit.hasNext()) {
                MarksCart d = lit.next();
                if (d.getSubjectid() == mark.getSubjectid()) {
                    System.out.println("################" + d.getSubjectid() + mark.getSubjectid());
                    int index = cartarray.indexOf(d);

                    cartarray.remove(index);
                    cartarray.add(index, new MarksCart(mark.getSubjectid(), mark.getMarkobtain(), mark.getMarkgrade()));
                    marksession.setAttribute("markCart", cartarray);
                    flag = "inserted";
                    break;
                }
            }
            if (flag.equals("not inserted")) {
                cartarray.add(new MarksCart(mark.getSubjectid(), mark.getMarkobtain(), mark.getMarkgrade()));
                marksession.setAttribute("markCart", cartarray);
            }
        }

        return "redirect:/showaddmarkpage";
    }

    @RequestMapping("/deletemarkfromcart")
    public String removemarks(@RequestParam("getsubjectid") int subjectid, HttpSession marksession) {
        // Remove allowance from added items
        @SuppressWarnings("unchecked")
        ArrayList<MarksCart> markCartTemp = (ArrayList<MarksCart>) marksession.getAttribute("markCart");
        Iterator<MarksCart> itr = markCartTemp.iterator();
        while (itr.hasNext()) {
            MarksCart aci = itr.next();
            if (aci.getSubjectid() == subjectid) {
                markCartTemp.remove(markCartTemp.indexOf(aci));
                break;
            }
        }
        marksession.setAttribute("markCart", markCartTemp);

        return "redirect:/showaddmarkpage";
    }

    @RequestMapping(value = "/marksadd", params = "Add")
    public ModelAndView addmarkspage(@ModelAttribute("MarkObject") Exammark mark, HttpServletRequest request, HttpSession marksession) {
        ArrayList<MarksCart> c = (ArrayList<MarksCart>) marksession.getAttribute("markCart");
        String statusOfMarks = exs.insertExammark(mark);
        
        int mkid = mark.getMarkid();
        
        marksession.setAttribute("markid", mkid);
        
        MarksDetails md = new MarksDetails();
        ArrayList<MarksDetails> markdetail = new ArrayList<MarksDetails>();
        for (MarksCart cart : c) {
            System.out.println("fast");
            md.setStid(mark.getStid());
            md.setMarkid(mark.getMarkid());
            md.setSubjectid(cart.getSubjectid());
            md.setMarkobtain(cart.getMarkobtain());
            md.setMarkgrade(cart.getMarkgrade());
            markdetail.add(md);
            mards.insertStudentmarks(markdetail);

        }
        markdetail.removeAll(markdetail);
        marksession.setAttribute("markCart", new ArrayList<MarksCart>());

        if (statusOfMarks.equals("success")) {
            Gson g = new Gson();
            String exammarksgson = g.toJson(mark);
            
            int markid = mark.getMarkid();
            
            String markdetailgson = mards.showStudentmarks(markid);
            
            ModelAndView mv = new ModelAndView("admin/marksuccess");
            mv.addObject("exammarksgson", exammarksgson);
            mv.addObject("markdetailgson", markdetailgson);

            return mv;
        }

        ModelAndView mv = new ModelAndView("addmarkserror");
        return mv;

    }

    @RequestMapping(value = "/marksadd", params = "Edit")
    public String editMarks(@ModelAttribute("MarkObject") Exammark mark, HttpServletRequest request, HttpSession marksession) {
        ArrayList<MarksCart> c = (ArrayList<MarksCart>) marksession.getAttribute("markCart");

        exs.updateExammark(mark);

        MarksDetails md = new MarksDetails();
        //int prid = prsdrug.getPresid();

        ArrayList<MarksDetails> markdetail = new ArrayList<MarksDetails>();
        for (MarksCart cart : c) {
            System.out.println("fast");
            md.setStid(mark.getStid());
            md.setMarkid(mark.getMarkid());
            md.setSubjectid(cart.getSubjectid());
            md.setMarkobtain(cart.getMarkobtain());
            md.setMarkgrade(cart.getMarkgrade());
            markdetail.add(md);
            mards.insertStudentmarks(markdetail);

        }

        markdetail.removeAll(markdetail);
        marksession.setAttribute("markCart", new ArrayList<MarksCart>());

        return "redirect:/addexammark";
    }

    @RequestMapping("removexammark/{Id}")
    public String removeprescription(@PathVariable("Id") int markid) {
        exs.deleteExammark(markid);
        return "redirect:/addexammark";
    }

//    @RequestMapping("/editingprescription")
//    public ModelAndView editprescriptionpage(@RequestParam("getpid") int pid, HttpSession session) {
//        String a = session.getAttribute("UserId").toString();
//        Doctor d = ds.showOneDoctorbyEmail(a);
//        System.out.println(a);
//        System.out.println(d.getDoctorid());
//        int doc = d.getDoctorid();
//        String appointmentgsonlist = aps.viewPatientAppointment(doc);
//        String preslist = ps.showPrescription();
//        String apointlist = aps.viewAppointmentsPatient();
//        String grouplist = ms.showMedecinegroup();
//        String typelist = mts.showMedecinetype();
//        String medicinelist = mls.viewMedecine();
//        String testreportgsonlist = tr.showTestreport();
//        String testgsonlist = ts.showTest();
//        String testtypegsonlist = tts.showTesttype();
//        String testprescriptionlist = tp.showTestpres();
//        String patientlist = pts.viewPatient();
//        ModelAndView mv = new ModelAndView("doctor/addprescription", "newPrescriptionObject", ps.showOnePrescription(pid));
//        session.setAttribute("prespdetail", pid);
//        mv.addObject("prescriptionlist", preslist);
//        mv.addObject("aplist", appointmentgsonlist);
//        mv.addObject("appointmentgsonlist", apointlist);
//        mv.addObject("grouplist", grouplist);
//        mv.addObject("typelist", typelist);
//        mv.addObject("medicinelist", medicinelist);
//        mv.addObject("testprescriptionmodelobject", testprescriptionlist);
//        mv.addObject("testmodelobject", testgsonlist);
//        mv.addObject("testreportmodelobject", testreportgsonlist);
//        mv.addObject("testtypemodelobject", testtypegsonlist);
//        mv.addObject("patientmodelobject", patientlist);
//        mv.addObject("check", "false");
//
//        Gson g = new Gson();
//
//        ArrayList<Cart> c = (ArrayList<Cart>) session.getAttribute("usercart");
//        if (c.isEmpty()) {
//            session.setAttribute("cartempty", "true");
//            mv.addObject("itemsincart", "null");
//            return mv;
//        } else {
//            String cartgson = g.toJson(c);
//            mv.addObject("itemsincart", cartgson);
//            System.out.println(cartgson);
//            session.setAttribute("cartempty", "false");
//            return mv;
//        }
//
//    }
}
