/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.controller;


import com.rakib.sms.model.Payment;
import com.rakib.sms.service.AcademicyearService;
import com.rakib.sms.service.PaymentService;
import com.rakib.sms.service.StudentregistrationService;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author C7
 */
@Controller
public class PaymentCtrl {

    @Autowired
    PaymentService payment;
    @Autowired
    StudentregistrationService streg;
    @Autowired
    AcademicyearService year;

    @InitBinder
    public void myInitBinder(WebDataBinder binder) {
        //binder.setDisallowedFields(new String[]{"empMobile"});
        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        binder.registerCustomEditor(Date.class, "paydate", new CustomDateEditor(format, false));
//        binder.registerCustomEditor(String.class, "ename", new EmployeeNameEditor());
    }

    @RequestMapping("/showpaymentpage")
    public ModelAndView showpaypage() {
        String payamount = payment.viewMonthlypayment();
        String stregistration = streg.viewStudentregistration();
        String yeargsonlist = year.viewAcademicyear();
        ModelAndView mv = new ModelAndView("admin/payment", "paymentObject", new Payment());
        mv.addObject("payamount", payamount);
        mv.addObject("stregistration", stregistration);
        mv.addObject("yearmodelobject", yeargsonlist);
        mv.addObject("check", "true");
        return mv;
    }

    @RequestMapping(value = "/paymentadd", params = "Add")
    public String addpaypage(@ModelAttribute("paymentObject") Payment pay, HttpServletRequest request) {
        payment.insertMonthlypayment(pay);
        return "redirect:/showpaymentpage";
    }

    @RequestMapping(value = "/paymentadd", params = "Edit")
    public String editpaypage(@ModelAttribute("paymentObject") Payment pay, HttpServletRequest request) {
        payment.updateMonthlypayment(pay.getPayid(), pay);
        return "redirect:/showpaymentpage";
    }

    @RequestMapping("removingpayment/{payid}")
    public String removepaypage(@PathVariable("payid") int payid) {
        payment.deleteMonthlypayment(payid);
        return "redirect:/showpaymentpage";
    }

    @RequestMapping("/editingpaymayment")
    public ModelAndView editpaymentpage(@RequestParam("getpayid") int payid) {
        String payamount = payment.viewMonthlypayment();
        String stregistration = streg.viewStudentregistration();
        String yeargsonlist = year.viewAcademicyear();
        ModelAndView mv = new ModelAndView("admin/payment", "paymentObject", payment.viewOneMonthlypayment(payid));
        mv.addObject("payamount", payamount);
        mv.addObject("stregistration", stregistration);
        mv.addObject("yearmodelobject", yeargsonlist);
        mv.addObject("check", "false");
        return mv;
    }

}
