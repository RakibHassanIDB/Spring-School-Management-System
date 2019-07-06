
package com.rakib.sms.service;

import com.rakib.sms.model.Subjects;
import org.springframework.stereotype.Service;


@Service
public interface SubjectService {

    public String insertSubject(Subjects sub);

    public String updateSubject(Subjects sub);

    public Integer deleteSubject(int id);

    public String viewSubject();

    public Subjects viewOneSubject(int id);

}
