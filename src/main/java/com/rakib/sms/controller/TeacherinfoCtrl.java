/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.controller;

import com.rakib.sms.service.SubjectService;
import com.rakib.sms.service.TeacherinfoService;
import com.rakib.sms.model.Teacherinfo;
import com.google.gson.Gson;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author HP
 */
@Controller
public class TeacherinfoCtrl {

    @Autowired
    TeacherinfoService teacher;
    @Autowired
    SubjectService sub;
    @Autowired
    private ServletContext servletContext;

    @InitBinder
    public void myInitBinder(WebDataBinder binder) {
        //binder.setDisallowedFields(new String[]{"empMobile"});
        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        binder.registerCustomEditor(Date.class, "tjoindate", new CustomDateEditor(format, false));
//        binder.registerCustomEditor(String.class, "ename", new EmployeeNameEditor());
    }

    @RequestMapping("/showteacherpage")
    public ModelAndView showteacherpage() {
        String teacherlist = teacher.viewTeacher();
        String sublist = sub.viewSubject();
        ModelAndView mv = new ModelAndView("admin/teacherinfo", "newTeacherObject", new Teacherinfo());
        mv.addObject("teacherlist", teacherlist);
        mv.addObject("sublist", sublist);
        mv.addObject("check", "true");
        return mv;
    }

    
    @RequestMapping("/showteacher")
    public ModelAndView showteacherlist() {
        String tlist = teacher.viewTeacher();
        ModelAndView mv = new ModelAndView("admin/teacherlist");
        mv.addObject("tList", tlist);
        return mv;
    }
    
    

    @RequestMapping(value = "/teacheradd", params = "Add")
    public String addteacher(@ModelAttribute("newTeacherObject") Teacherinfo t, HttpServletRequest request) {
        teacher.insertTeacher(t);
        String path = servletContext.getRealPath("/");
        String projectcut = path.substring(0, path.lastIndexOf("\\"));
        //String projectcuts = projectcut.substring(0, projectcut.lastIndexOf("\\"));
        String targetcut = projectcut.substring(0, projectcut.lastIndexOf("\\"));
        String targetcuts = targetcut.substring(0, targetcut.lastIndexOf("\\"));
        //System.out.println(targetcut+".......");
        //System.out.println(request.getSession().getServletContext());
        //String p = servletContext.getContextPath();
        String p = targetcuts + "\\src\\main\\webapp\\resources\\timage\\" + String.valueOf(t.getTid()) + "" + ".jpg";
//        path = path + String.valueOf(product.getProductid()) + "" + ".jpg";

        MultipartFile filedet = t.getTimage();
        if (!filedet.isEmpty()) {
            try {
                byte[] bytes = filedet.getBytes();

                FileOutputStream fos = new FileOutputStream(new File(p));
                BufferedOutputStream bs = new BufferedOutputStream(fos);
                bs.write(bytes);
                bs.close();
                fos.close();
                Thread.sleep(10000);
                System.out.println("File Uploaded Successfully");
            } catch (Exception e) {
                System.out.println("Exception Arised" + e);
            }
        } else {
            System.out.println("File is Empty not Uploaded");
        }

        return "redirect:/showteacherpage";
    }

    @RequestMapping(value = "/teacheradd", params = "Edit")
    public String editteacherr(@ModelAttribute("newTeacherObject") Teacherinfo t, HttpServletRequest request) {
        teacher.updateTeacher(t.getTid(), t);

        String path = servletContext.getRealPath("/");

        String projectcut = path.substring(0, path.lastIndexOf("\\"));
        //String projectcuts = projectcut.substring(0, projectcut.lastIndexOf("\\"));
        String targetcut = projectcut.substring(0, projectcut.lastIndexOf("\\"));
        String targetcuts = targetcut.substring(0, targetcut.lastIndexOf("\\"));
        //System.out.println(targetcut+".......");
        //System.out.println(request.getSession().getServletContext());
        //String p = servletContext.getContextPath();
        String p = targetcuts + "\\src\\main\\webapp\\resources\\timage\\" + String.valueOf(t.getTid()) + "" + ".jpg";
//        path = path + String.valueOf(product.getProductid()) + "" + ".jpg";

        MultipartFile filedet = t.getTimage();
        if (!filedet.isEmpty()) {
            try {
                byte[] bytes = filedet.getBytes();
                System.out.println(bytes.length);
                FileOutputStream fos = new FileOutputStream(new File(p));
                BufferedOutputStream bs = new BufferedOutputStream(fos);
                bs.write(bytes);
                bs.close();
                fos.close();
                Thread.sleep(10000);
                System.out.println("File Uploaded Successfully");
            } catch (Exception e) {
                System.out.println("Exception Arised" + e);
            }
        } else {
            System.out.println("File is Empty not Uploaded");
        }
        return "redirect:/showteacherpage";
    }

    @RequestMapping("removingteacher/{tid}")
    public String removeteacher(@PathVariable("tid") int teacherid) {
        teacher.deleteTeacher(teacherid);
        return "redirect:/showteacherpage";
    }

    @RequestMapping("/viewteacher")
    public ModelAndView viewteacher(@RequestParam("getId") int teacherid, HttpSession session) {
        Gson g = new Gson();
        String teacherinfo = g.toJson(teacher.viewOneTeacher(teacherid));
        //session.setAttribute("productid", productid);
        ModelAndView mv = new ModelAndView("description");
        mv.addObject("oneteacher", teacherinfo);
        return mv;
    }

    @RequestMapping("/teacherpage")
    public ModelAndView viewviewteacherlist() {
        String teacherlist = teacher.viewTeacher();
        ModelAndView mv = new ModelAndView("viewteacher");
        mv.addObject("teacherlist", teacherlist);
        return mv;
    }

    @RequestMapping("/editingteacher")
    public ModelAndView editoneteacher(@RequestParam("gettid") int tid) {
        String teacherlist = teacher.viewTeacher();
        String sublist = sub.viewSubject();
        ModelAndView mv = new ModelAndView("admin/teacherinfo", "newTeacherObject", teacher.viewOneTeacher(tid));
        mv.addObject("teacherlist", teacherlist);
        mv.addObject("sublist", sublist);
        mv.addObject("check", "false");
        return mv;
    }
    
    @RequestMapping("/teacherprofilelink")
    public ModelAndView showingTeacher(@RequestParam("gettid") int tid) {
        Teacherinfo singlet = teacher.viewOneTeacher(tid);
        System.out.println(singlet);
        Gson g = new Gson();
        String singleTJson = g.toJson(singlet);
        ModelAndView mv = new ModelAndView("admin/teacherprofile", "tprofileObj", singlet);
        mv.addObject("singleT", singleTJson);
        return mv;
    }
    
    @RequestMapping("/tprofilelink")
    public ModelAndView showingmyProfile(@RequestParam("gettid") int tid) {
        Teacherinfo singlet = teacher.viewOneTeacher(tid);
        System.out.println(singlet);
        Gson g = new Gson();
        String singleTJson = g.toJson(singlet);
        ModelAndView mv = new ModelAndView("teacher/teacherprofile", "tprofileObj", singlet);
        mv.addObject("singleT", singleTJson);
        return mv;
    }
}
