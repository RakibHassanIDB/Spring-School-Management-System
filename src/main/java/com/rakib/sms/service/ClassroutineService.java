/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.service;

import com.rakib.sms.model.Classroutine;
import org.springframework.stereotype.Service;

/**
 *
 * @author C7
 */
@Service
public interface ClassroutineService {

    public String insertClassroutin(Classroutine cr);

    public String updateClassroutin(int routinid, Classroutine cr);

    public String deleteClassroutin(int routinid);

    public String viewClassroutin();

    public Classroutine viewOneClassroutin(int routinid);

}
