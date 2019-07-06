/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 *
 * @author C7
 */
@Entity
public class Studentattendance implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int atid;
    @Column
    private int regid;
    @Column
    private int secid;
    @Column
    private int groupid;
    @Column
    private int stid;
    @Column
    private int classid;
    @Temporal(TemporalType.TIMESTAMP)
    private Date atdate = new Date();
    @Column
    private String atstatus ="Preasent";

    public int getAtid() {
        return atid;
    }

    public void setAtid(int atid) {
        this.atid = atid;
    }

    public int getRegid() {
        return regid;
    }

    public void setRegid(int regid) {
        this.regid = regid;
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

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }

    public Date getAtdate() {
        return atdate;
    }

    public void setAtdate(Date atdate) {
        this.atdate = atdate;
    }

    public String getAtstatus() {
        return atstatus;
    }

    public void setAtstatus(String atstatus) {
        this.atstatus = atstatus;
    }
}
