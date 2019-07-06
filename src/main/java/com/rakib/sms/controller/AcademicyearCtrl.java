package com.rakib.sms.controller;

import com.rakib.sms.model.Academicyear;

import com.rakib.sms.service.AcademicyearService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AcademicyearCtrl {

    @Autowired
    AcademicyearService sub;

    @RequestMapping("/showingacademicyearpage")
    public ModelAndView showsubjectpage() {
        String subgsonlist = sub.viewAcademicyear();
        ModelAndView mv = new ModelAndView("admin/academicyear", "addAcademicyearObject1", new Academicyear());
        mv.addObject("academicyearmodelobject", subgsonlist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addingacademicyear", params = "addacademicyear")
    public String addsubject(@ModelAttribute("addAcademicyearObject1") Academicyear s) {
        //String categorygsonlist = cdao.viewCategory();
        //ModelAndView mv =new ModelAndView("AddCategory");
        sub.insertAcademicyear(s);
        //mv.addObject("categorymodelobject", categorygsonlist);
        return "redirect:/showingacademicyearpage";
    }

    @RequestMapping(value = "/addingacademicyear", params = "Editacademicyear")
    public String editsubject(@ModelAttribute("addAcademicyearObject1") Academicyear s) {

        //ModelAndView mv =new ModelAndView("AddCategory");
        sub.updateAcademicyear(s);
        return "redirect:/showingacademicyearpage";
    }

    @RequestMapping("removeacademicyear/{Id}")
    public String removesubject(@PathVariable("Id") int subId) {
        sub.deleteAcademicyear(subId);
        return "redirect:/showingacademicyearpage";
    }

    @RequestMapping("/editacademicyearbutton")
    public ModelAndView passingonesubject(@RequestParam("getYearid") int yearid) {

        Academicyear onesub = sub.viewOneAcademicyear(yearid);
        String subgsonlist = sub.viewAcademicyear();
        ModelAndView mv = new ModelAndView("admin/academicyear", "addAcademicyearObject1", onesub);
        mv.addObject("academicyearmodelobject", subgsonlist);
        mv.addObject("check", "false");
        return mv;
    }
}
