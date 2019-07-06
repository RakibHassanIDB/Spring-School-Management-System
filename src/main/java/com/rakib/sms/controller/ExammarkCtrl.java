/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.controller;

import com.rakib.sms.model.Exammark;
import com.rakib.sms.service.AcademicyearService;
import com.rakib.sms.service.ClassnameService;
import com.rakib.sms.service.ClasssectionService;
import com.rakib.sms.service.ExaminfoService;
import com.rakib.sms.service.ExammarkService;
import com.rakib.sms.service.StgroupService;
import com.rakib.sms.service.StudentinfoService;
import com.rakib.sms.service.StudentregistrationService;
import com.rakib.sms.service.SubjectService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author HP
 */
@Controller
public class ExammarkCtrl {

    @Autowired
    ExammarkService exmark;

    @Autowired
    StudentinfoService stinfo;

    @Autowired
    StgroupService stgroup;

    @Autowired
    AcademicyearService year;

    @Autowired
    SubjectService sub;

    @Autowired
    ClassnameService classser;

    @Autowired
    ClasssectionService classsec;

    @Autowired
    StudentregistrationService sts;
    @Autowired
    ExaminfoService exms;


    @RequestMapping("/showexammarkpage")
    public ModelAndView showmarkpage() {
        String marklist = exmark.viewExammark();
        String studentlist = stinfo.viewstudent();
        String grouplist = stgroup.viewStgroup();
        String yearlist = year.viewAcademicyear();
        String subjectlist = sub.viewSubject();
        String classlist = classser.viewClassname();
        String sectionlist = classsec.viewClasssection();
        String examlist = exms.viewExaminfo();
        ModelAndView mv = new ModelAndView("admin/exammark", "exammarkObject", new Exammark());
        mv.addObject("marklist", marklist);
        mv.addObject("studentlist", studentlist);
        mv.addObject("grouplist", grouplist);
        mv.addObject("yearlist", yearlist);
        mv.addObject("subjectlist", subjectlist);
        mv.addObject("classlist", classlist);
        mv.addObject("sectionlist", sectionlist);
        mv.addObject("examlist", examlist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping("/showeresultsearchpage")
    public ModelAndView showsearchresultpage() {
        String marklist = exmark.viewExammark();
        String yearlist = year.viewAcademicyear();
        String stureglist = sts.viewStudentregistration();
        String examlist = exms.viewExaminfo();
        ModelAndView mv = new ModelAndView("searchresult", "searchObject", new Exammark());
        mv.addObject("marklist", marklist);
        mv.addObject("yearlist", yearlist);
        mv.addObject("stureglist", stureglist);
        mv.addObject("examlist", examlist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping("/resultsheetpage")
    public ModelAndView showmarkpage(@ModelAttribute("searchObject") Exammark em, HttpSession session) {
        int reg = em.getRegid();
        String accyear = em.getAcademicYear();
        String examtitle = em.getExamtitle();
        ModelAndView mv = new ModelAndView("resultsheet", "searchObject", new Exammark());
        session.setAttribute("reglist", sts.viewOneStudentregid(reg));
        session.setAttribute("exmatitlelist", exms.viewOneExamtitle(examtitle));
        session.setAttribute("ayear", year.viewOneyearbyaccyear(accyear));
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/examMarkadd", params = "Add")
    public String addmarkpage(@ModelAttribute("exammarkObject") Exammark em, HttpServletRequest request) {
        exmark.insertExammark(em);
        return "redirect:/showexammarkpage";
    }

    @RequestMapping(value = "/examMarkadd", params = "Edit")
    public String editmark(@ModelAttribute("exammarkObject") Exammark em, HttpServletRequest request) {
        exmark.updateExammark(em);
        return "redirect:/showexammarkpage";
    }

    @RequestMapping("removingexammark/{emid}")
    public String removemark(@PathVariable("emid") int emid) {
        exmark.deleteExammark(emid);
        return "redirect:/showexammarkpage";
    }

    @RequestMapping("/editingexammark")
    public ModelAndView editonemarkpage(@RequestParam("getemid") int emid) {
        String marklist = exmark.viewExammark();
        String studentlist = stinfo.viewstudent();
        String grouplist = stgroup.viewStgroup();
        String yearlist = year.viewAcademicyear();
        String subjectlist = sub.viewSubject();
        String classlist = classser.viewClassname();
        String sectionlist = classsec.viewClasssection();
        String examlist = exms.viewExaminfo();
        ModelAndView mv = new ModelAndView("admin/exammark", "exammarkObject", exmark.viewOneExammark(emid));
        mv.addObject("marklist", marklist);
        mv.addObject("studentlist", studentlist);
        mv.addObject("grouplist", grouplist);
        mv.addObject("yearlist", yearlist);
        mv.addObject("subjectlist", subjectlist);
        mv.addObject("classlist", classlist);
        mv.addObject("sectionlist", sectionlist);
        mv.addObject("examlist", examlist);
        mv.addObject("check", "false");
        return mv;
    }
    
    
    

}
