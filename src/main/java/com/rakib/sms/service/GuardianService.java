/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.service;

import com.rakib.sms.model.Guardian;
import org.springframework.stereotype.Service;

@Service
public interface GuardianService {
    public String insertGuardian(Guardian guar);

    public String updateGuardian(int profileid,Guardian sub);

    public Integer deleteGuardian(int id);

    public String viewGuardian();

    public Guardian viewOneGuardian(int id);
}
