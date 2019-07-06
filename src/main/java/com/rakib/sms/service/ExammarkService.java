/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.service;


import com.rakib.sms.model.Exammark;
import org.springframework.stereotype.Service;

/**
 *
 * @author HP
 */
@Service
public interface ExammarkService {

    public String insertExammark(Exammark em);

    public String updateExammark(Exammark em);

    public String deleteExammark(int markid);

    public String viewExammark();

    public Exammark viewOneExammark(int markid);
  

}
