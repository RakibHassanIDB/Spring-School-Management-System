
package com.rakib.sms.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;


@Entity
public class Exammark implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int markid;
    @Column
    private int yearid;
    @Column
    private int secid;
    @Column
    private int groupid;
    @Column
    private int stid;
    @Column
    private int classid;
    @Column
    private int examid;
    @Transient
    private int subjectid;
    @Transient
    private String markgrade;
    @Transient
    private String markobtain;
    @Transient
    private String academicYear;
    @Transient
    private int regid;
    @Transient
    private String examtitle;

    public int getExamid() {
        return examid;
    }

    public void setExamid(int examid) {
        this.examid = examid;
    }

    public String getAcademicYear() {
        return academicYear;
    }

    public void setAcademicYear(String academicYear) {
        this.academicYear = academicYear;
    }

    public int getRegid() {
        return regid;
    }

    public void setRegid(int regid) {
        this.regid = regid;
    }

    public String getExamtitle() {
        return examtitle;
    }

    public void setExamtitle(String examtitle) {
        this.examtitle = examtitle;
    }

    public int getMarkid() {
        return markid;
    }

    public void setMarkid(int markid) {
        this.markid = markid;
    }

    public int getYearid() {
        return yearid;
    }

    public void setYearid(int yearid) {
        this.yearid = yearid;
    }

    public int getSecid() {
        return secid;
    }

    public void setSecid(int secid) {
        this.secid = secid;
    }

    public int getGroupid() {
        return groupid;
    }

    public void setGroupid(int groupid) {
        this.groupid = groupid;
    }

    public int getStid() {
        return stid;
    }

    public void setStid(int stid) {
        this.stid = stid;
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

    public String getMarkgrade() {
        return markgrade;
    }

    public void setMarkgrade(String markgrade) {
        this.markgrade = markgrade;
    }

    public String getMarkobtain() {
        return markobtain;
    }

    public void setMarkobtain(String markobtain) {
        this.markobtain = markobtain;
    }

}
