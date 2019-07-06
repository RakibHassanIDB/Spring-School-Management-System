package com.rakib.sms.controller;

import com.rakib.sms.service.AcademicyearService;
import com.rakib.sms.service.ClassnameService;
import com.rakib.sms.service.ClasssectionService;
import com.rakib.sms.service.StudentinfoService;
import com.rakib.sms.service.StudentregistrationService;
import java.text.ParseException;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudentsearchCtrl {

    @Autowired
    AcademicyearService acy;
    @Autowired
    ClassnameService cls;
    @Autowired
    ClasssectionService sec;

    @Autowired
    StudentinfoService stinfo;
    @Autowired
    StudentregistrationService sreg;

    @RequestMapping("/searchstd")
    public ModelAndView showAllRoom() {

        String ayear = acy.viewAcademicyear();
        String classname = cls.viewClassname();
        String section = sec.viewClasssection();
        ModelAndView mv = new ModelAndView("admin/searchstudent");
        mv.addObject("acList", ayear);
        mv.addObject("clList", classname);
        mv.addObject("secList", section);
        mv.addObject("check", "false");
        mv.addObject("s", "null");
        return mv;
    }

    @RequestMapping("/searchstudent")
    public ModelAndView display(@RequestParam("yearid") int yearid, @RequestParam("classid") int classid, @RequestParam("secid") int secid, HttpSession searchsession) throws ParseException {
        String searchstudent = sreg.viewSearchStudent(yearid, classid, secid);
        System.out.println("Search Result aise: " + searchstudent);
        String ayear = acy.viewAcademicyear();
        String classname = cls.viewClassname();
        String section = sec.viewClasssection();
        ModelAndView mv = new ModelAndView("admin/searchstudent");
        mv.addObject("acList", ayear);
        mv.addObject("clList", classname);
        mv.addObject("secList", section);
        mv.addObject("check", "true");
        mv.addObject("s", searchstudent);
        return mv;
    }

}
