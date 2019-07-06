
package com.rakib.sms.controller;


import com.rakib.sms.model.Classsection;
import com.rakib.sms.service.ClassnameService;
import com.rakib.sms.service.ClasssectionService;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
 */@Controller
public class ClasssectionCtrl {
   @Autowired
    ClasssectionService cls;
    @Autowired
    ClassnameService cs;
    @Autowired
    private ServletContext servletContext;
    
  
   

    @RequestMapping("/showsectionpage")
    public ModelAndView showsection() {
        String sectionlist = cls.viewClasssection();
        String ClassServicelist = cs.viewClassname();
        ModelAndView mv = new ModelAndView("admin/classsection", "newClasssectionObject", new Classsection());
        mv.addObject("sectionlist", sectionlist);
        mv.addObject("ClassServicelist", ClassServicelist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/sectionadd", params = "Add")
    public String addproductpage(@ModelAttribute("newClasssectionObject") Classsection section, HttpServletRequest request) {
        cls.insertClasssection(section);
        return "redirect:/showsectionpage";
    }

    @RequestMapping(value = "/sectionadd", params = "Edit")
    public String editProduct(@ModelAttribute("newClasssectionObject") Classsection section, HttpServletRequest request) {
        cls.updateClasssection(section.getSecid(), section);        
        return "redirect:/showsectionpage";
    }

    @RequestMapping("removingproduct/{productId}")
    public String removeproduct(@PathVariable("productId") int productid) {
        cls.deleteClasssection(productid);
        return "redirect:/showsectionpage";
    }

   

    @RequestMapping("/editingproduct")
    public ModelAndView editproductpage(@RequestParam("getpid") int pid) {
        String sectionlist = cls.viewClasssection();
        String ClassServicelist = cs.viewClassname();
        ModelAndView mv = new ModelAndView("admin/classsection", "newClasssectionObject", cls.viewOneClasssection(pid));
        mv.addObject("sectionlist", sectionlist);
        mv.addObject("ClassServicelist", ClassServicelist);
        mv.addObject("check", "false");
        return mv;
    }
    
}
