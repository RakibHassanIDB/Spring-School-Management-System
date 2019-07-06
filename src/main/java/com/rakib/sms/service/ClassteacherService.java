/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.service;

import com.rakib.sms.model.Classteacher;
import org.springframework.stereotype.Service;

/**
 *
 * @author HP
 */
@Service
public interface ClassteacherService {

    public String insertClassteacher(Classteacher ct);

    public String updateClassteacher(int cteacherid, Classteacher ct);

    public String deleteClassteachert(int cteacherid);

    public String viewClassteacher();

    public Classteacher viewOneClassteacher(int cteacherid);

}
