/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author HP
 */
@Entity
public class Classteacher implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int assignid;
    @Column
    private int tid;
    @Column
    private int secid;
    @Column
    private int yearid;
    @Column
    private int groupid;
    @Column
    private int classid;

    public int getAssignid() {
        return assignid;
    }

    public void setAssignid(int assignid) {
        this.assignid = assignid;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getSecid() {
        return secid;
    }

    public void setSecid(int secid) {
        this.secid = secid;
    }

    public int getYearid() {
        return yearid;
    }

    public void setYearid(int yearid) {
        this.yearid = yearid;
    }

    public int getGroupid() {
        return groupid;
    }

    public void setGroupid(int groupid) {
        this.groupid = groupid;
    }

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }

}
