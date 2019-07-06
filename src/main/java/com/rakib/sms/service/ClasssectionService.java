/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.service;

import com.rakib.sms.model.Classsection;
import org.springframework.stereotype.Service;

/**
 *
 * @author HP
 */@Service
public interface ClasssectionService {
 
public String insertClasssection(Classsection pm);

    public Integer updateClasssection(int secid, Classsection pm);

    public Integer deleteClasssection(int secid);

    public String viewClasssection();

    public Classsection viewOneClasssection(int secid);
}
