package com.rakib.sms.controller;

import com.google.gson.Gson;
import com.rakib.sms.model.Studentinfo;
import com.rakib.sms.service.StudentinfoService;
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

@Controller
public class StudentinfoCtrl {

    @Autowired
    StudentinfoService stis;
    @Autowired
    private ServletContext servletContext;

    @InitBinder
    public void myInitBinder(WebDataBinder binder) {
        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        binder.registerCustomEditor(Date.class, "stdob", new CustomDateEditor(format, false));
    }

    @RequestMapping("/studentinfoepage")
    public ModelAndView showteacherpage() {
        String studentlist = stis.viewstudent();

        ModelAndView mv = new ModelAndView("admin/studentinfo", "addStuObject1", new Studentinfo());
        mv.addObject("studentlists", studentlist);

        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping("/showStudentlist")
    public ModelAndView showstudentlist() {
        String studentlist = stis.viewstudent();

        ModelAndView mv = new ModelAndView("admin/studentlist");
        mv.addObject("studentlists", studentlist);
        return mv;
    }


    @RequestMapping(value = "/addingstudent", params = "Add")
    public String addteacher(@ModelAttribute("addStuObject1") Studentinfo st, HttpServletRequest request) {
        stis.insertstudent(st);
        String path = servletContext.getRealPath("/");
        System.out.println(path);
        String projectcut = path.substring(0, path.lastIndexOf("\\"));
        String targetcut = projectcut.substring(0, projectcut.lastIndexOf("\\"));
        String targetcuts = targetcut.substring(0, targetcut.lastIndexOf("\\"));
        String p = targetcuts + "\\src\\main\\webapp\\resources\\stimage\\" + String.valueOf(st.getStid()) + "" + ".jpg";
        System.out.println(p);
        MultipartFile filedet = st.getStimage();
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

        return "redirect:/studentinfoepage";
    }

    @RequestMapping(value = "/addingstudent", params = "Edit")
    public String editteacherr(@ModelAttribute("addStuObject1") Studentinfo st, HttpServletRequest request) {
        stis.updatestudent(st.getStid(), st);
        String path = servletContext.getRealPath("/");
        System.out.println(path);
        String projectcut = path.substring(0, path.lastIndexOf("\\"));
        String targetcut = projectcut.substring(0, projectcut.lastIndexOf("\\"));
        String targetcuts = targetcut.substring(0, targetcut.lastIndexOf("\\"));
        String p = targetcuts + "\\src\\main\\webapp\\resources\\stimage\\" + String.valueOf(st.getStid()) + "" + ".jpg";
        String imagepath = "\\src\\main\\webapp\\resources\\stimage\\" + String.valueOf(st.getStid()) + "" + ".jpg";
        System.out.println(p);
        MultipartFile filedet = st.getStimage();
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
        return "redirect:/studentinfoepage";
    }

    @RequestMapping("removingstudent/{stuid}")
    public String removeteacher(@PathVariable("stuid") int stuid) {
        stis.deletestudent(stuid);
        return "redirect:/studentinfoepage";
    }


    @RequestMapping("/editingstudent")
    public ModelAndView editoneteacher(@RequestParam("getsid") int sid) {
        String studentlist = stis.viewstudent();
        ModelAndView mv = new ModelAndView("admin/studentinfo", "addStuObject1", stis.viewOnestudent(sid));
        mv.addObject("studentlists", studentlist);
        mv.addObject("check", "false");
        return mv;
    }
    
    @RequestMapping("/studentprofilelink")
    public ModelAndView showingStudent(@RequestParam("getsid") int sid) {
        Studentinfo singleStd = stis.viewOnestudent(sid);
        System.out.println(singleStd);
        Gson g = new Gson();
        String singleStdJson = g.toJson(singleStd);
        ModelAndView mv = new ModelAndView("admin/studentprofile", "paymentMA", singleStd);
        mv.addObject("singleStd", singleStdJson);
        return mv;
    }
    
    @RequestMapping("/sprofilelink")
    public ModelAndView showingmyProfile(@RequestParam("getsid") int sid) {
        Studentinfo singleStd = stis.viewOnestudent(sid);
        System.out.println(singleStd);
        Gson g = new Gson();
        String singleStdJson = g.toJson(singleStd);
        ModelAndView mv = new ModelAndView("student/studentprofile", "paymentMA", singleStd);
        mv.addObject("singleStd", singleStdJson);
        return mv;
    }
}
