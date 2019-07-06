
package com.rakib.sms.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Classroutine implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int routineid;
    @Column
    private int tid;
    @Column
    private int subjectid;
    @Column
    private int classid;
    @Column
    private int secid;
    @Column
    private String periodname;
    @Column
    private String  dayname;
    @Column
    private String  periodtime;

    public String getPeriodtime() {
        return periodtime;
    }

    public void setPeriodtime(String periodtime) {
        this.periodtime = periodtime;
    }

    public int getRoutineid() {
        return routineid;
    }

    public void setRoutineid(int routineid) {
        this.routineid = routineid;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getSubjectid() {
        return subjectid;
    }

    public void setSubjectid(int subjectid) {
        this.subjectid = subjectid;
    }

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }

    public int getSecid() {
        return secid;
    }

    public void setSecid(int secid) {
        this.secid = secid;
    }

    public String getPeriodname() {
        return periodname;
    }

    public void setPeriodname(String periodname) {
        this.periodname = periodname;
    }

    public String getDayname() {
        return dayname;
    }

    public void setDayname(String dayname) {
        this.dayname = dayname;
    }
    
}
