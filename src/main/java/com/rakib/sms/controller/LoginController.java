
package com.rakib.sms.controller;

import com.rakib.sms.model.MarksCart;
import com.rakib.sms.model.User;
import com.rakib.sms.service.GuardianService;
import com.rakib.sms.service.StudentinfoService;
import com.rakib.sms.service.TeacherinfoService;
import com.rakib.sms.service.Userservice;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class LoginController {

    @Autowired
    Userservice user;

    @Autowired
    TeacherinfoService ts;
    
    @Autowired
    StudentinfoService std;
    
    @Autowired
    GuardianService gs;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLogin() {
        return "login";
    }


    @RequestMapping(value = "/loginsuccess")
    public String loginsuccess(HttpSession session) {
        System.out.println("success..........");

        String userid = SecurityContextHolder.getContext().getAuthentication().getName();
        User us = user.viewUser(userid);
        Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
        String page = "";
        String rolea = "ROLE_ADMIN";
        String rolet = "ROLE_TEACHER";
        String roles = "ROLE_STUDENT";
        String roleg = "ROLE_GUARDIAN";
        for (GrantedAuthority authority : authorities) {

            if (authority.getAuthority().equals(rolea)) {
                session.setAttribute("UserLoggedIn", us.getUsername());
                session.setAttribute("Userphone", us.getPhone());
                session.setAttribute("email", us.getEmailid());
                session.setAttribute("UserId", userid);
                session.setAttribute("markCart", new ArrayList<MarksCart>());
                page = "redirect:/adminpanel";
            } else if (authority.getAuthority().equals(rolet)) {
                session.setAttribute("UserLoggedIn", us.getUsername());
                session.setAttribute("Userphone", us.getPhone());
                session.setAttribute("email", us.getEmailid());
                session.setAttribute("role", us.getRole());
                session.setAttribute("UserId", userid);
                session.setAttribute("teinfo", ts.showOneTeacherbyEmail(userid));
                page = "redirect:/teacherpanel";
            } else if (authority.getAuthority().equals(roles)) {
                session.setAttribute("UserLoggedIn", us.getUsername());
                session.setAttribute("email", us.getEmailid());
                session.setAttribute("UserId", userid);
                session.setAttribute("role", us.getRole());
                session.setAttribute("stinfo", std.showOneStudentbyEmail(userid));
                page = "redirect:/studentpanel";
            }else if (authority.getAuthority().equals(roleg)) {
                session.setAttribute("UserLoggedIn", us.getUsername());
                session.setAttribute("Userphone", us.getPhone());
                session.setAttribute("email", us.getEmailid());
                session.setAttribute("UserId", userid);
                page = "redirect:/guardianpanel";
            }else {
                page = "redirect:/";
            }

        }
        return page;
    }

}
