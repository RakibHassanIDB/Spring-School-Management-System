
package com.rakib.sms.service;

import com.rakib.sms.model.Notice;
import org.springframework.stereotype.Service;


@Service
public interface NoticeService {

    public String insertNotice(Notice sub);

    public String updateNotice(Notice sub);

    public Integer deleteNotice(int id);

    public String viewNotice();

    public Notice viewOneNotice(int id);

}
