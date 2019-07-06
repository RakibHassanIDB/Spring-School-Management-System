package com.rakib.sms.controller;

import com.rakib.sms.model.Classname;
import com.rakib.sms.service.ClassnameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ClassnameCtrl {

    @Autowired
    ClassnameService sub;

    @RequestMapping("/showingclassnamepage")
    public ModelAndView showsubjectpage() {
        String subgsonlist = sub.viewClassname();
        ModelAndView mv = new ModelAndView("admin/classname", "addClassnameObject1", new Classname());
        mv.addObject("classnamemodelobject", subgsonlist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addingclassname", params = "addclassname")
    public String addsubject(@ModelAttribute("addClassnameObject1") Classname s) {
        //String categorygsonlist = cdao.viewCategory();
        //ModelAndView mv =new ModelAndView("AddCategory");
        sub.insertClassname(s);
        //mv.addObject("categorymodelobject", categorygsonlist);
        return "redirect:/showingclassnamepage";
    }

    @RequestMapping(value = "/addingclassname", params = "Editclassname")
    public String editsubject(@ModelAttribute("addClassnameObject1") Classname s) {

        //ModelAndView mv =new ModelAndView("AddCategory");
        sub.updateClassname(s);
        return "redirect:/showingclassnamepage";
    }

    @RequestMapping("removeclassname/{Id}")
    public String removesubject(@PathVariable("Id") int classid) {
        sub.deleteClassname(classid);
        return "redirect:/showingclassnamepage";
    }

    @RequestMapping("/editclassnamebutton")
    public ModelAndView passingonesubject(@RequestParam("getClassid") int classid) {

        Classname onesub = sub.viewOneClassname(classid);
        String subgsonlist = sub.viewClassname();
        ModelAndView mv = new ModelAndView("admin/classname", "addClassnameObject1", onesub);
        mv.addObject("classnamemodelobject", subgsonlist);
        mv.addObject("check", "false");
        return mv;
    }
}
