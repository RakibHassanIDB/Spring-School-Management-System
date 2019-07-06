package com.rakib.sms.controller;

import com.rakib.sms.model.Stgroup;

import com.rakib.sms.service.StgroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StgroupCtrl {

    @Autowired
    StgroupService sub;

    @RequestMapping("/showingstgrouppage")
    public ModelAndView showsubjectpage() {
        String subgsonlist = sub.viewStgroup();
        ModelAndView mv = new ModelAndView("admin/stgroup", "addStgroupObject1", new Stgroup());
        mv.addObject("stgroupmodelobject", subgsonlist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/addingstgroup", params = "addstgroup")
    public String addsubject(@ModelAttribute("addStgroupObject1") Stgroup s) {
        //String categorygsonlist = cdao.viewCategory();
        //ModelAndView mv =new ModelAndView("AddCategory");
        sub.insertStgroup(s);
        //mv.addObject("categorymodelobject", categorygsonlist);
        return "redirect:/showingstgrouppage";
    }

    @RequestMapping(value = "/addingstgroup", params = "Editstgroup")
    public String editsubject(@ModelAttribute("addStgroupObject1") Stgroup s) {

        //ModelAndView mv =new ModelAndView("AddCategory");
        sub.updateStgroup(s);
        return "redirect:/showingstgrouppage";
    }

    @RequestMapping("removestgroup/{Id}")
    public String removesubject(@PathVariable("Id") int groupid) {
        sub.deleteStgroup(groupid);
        return "redirect:/showingstgrouppage";
    }

    @RequestMapping("/editstgroupbutton")
    public ModelAndView passingonesubject(@RequestParam("getgroupid") int groupid) {

        Stgroup onesub = sub.viewOneStgroup(groupid);
        String subgsonlist = sub.viewStgroup();
        ModelAndView mv = new ModelAndView("admin/stgroup", "addStgroupObject1", onesub);
        mv.addObject("stgroupmodelobject", subgsonlist);
        mv.addObject("check", "false");
        return mv;
    }
}
