/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.service;


import com.rakib.sms.model.Studentattendance;
import org.springframework.stereotype.Service;

/**
 *
 * @author C7
 */
@Service
public interface StudentattendanceService {

    public String inserattendenc(Studentattendance sat);

    public String updateattendenc(int satid, Studentattendance sat);

    public String deleteattendenc(int satid);

    public String viewattendenc();
    public String viewattendencsheet(int clid);

    public Studentattendance viewOneattendenc(int satid);

}
