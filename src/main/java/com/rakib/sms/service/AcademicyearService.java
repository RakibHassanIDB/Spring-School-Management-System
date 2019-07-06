/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.service;

import com.rakib.sms.model.Academicyear;
import org.springframework.stereotype.Service;

@Service
public interface AcademicyearService {
    public String insertAcademicyear(Academicyear sub);

    public String updateAcademicyear(Academicyear sub);

    public Integer deleteAcademicyear(int id);

    public String viewAcademicyear();

    public Academicyear viewOneAcademicyear(int id);
    
    public Academicyear viewOneyearbyaccyear(String acyear);
}
