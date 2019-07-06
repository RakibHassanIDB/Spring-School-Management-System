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
import javax.persistence.Transient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author HP
 */
@Entity
public class Teacherinfo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int tid;
    @Column
    private int subjectid;
    @Column
    private String subjectname;
    @Column
    private String tname;
    @Column
    private String taddress;
    @Column
    private String temail;
    @Column
    private String tcontact;
    @Temporal(TemporalType.DATE)
    private Date tjoindate;
    @Column
    private String tstatus = "True";
    @Column
    private String tgender;
    @Transient
    MultipartFile timage;
    @Transient
    private String username;
    @Transient
    private String password = "123";
    @Transient
    private String role = "ROLE_TEACHER";
    @Transient
    private String status="True";

    public String getSubjectname() {
        return subjectname;
    }

    public void setSubjectname(String subname) {
        this.subjectname = subjectname;
    }

    public String getTgender() {
        return tgender;
    }

    public void setTgender(String tgender) {
        this.tgender = tgender;
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

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getTaddress() {
        return taddress;
    }

    public void setTaddress(String taddress) {
        this.taddress = taddress;
    }

    public String getTemail() {
        return temail;
    }

    public void setTemail(String temail) {
        this.temail = temail;
    }

    public String getTcontact() {
        return tcontact;
    }

    public void setTcontact(String tcontact) {
        this.tcontact = tcontact;
    }

    public Date getTjoindate() {
        return tjoindate;
    }

    public void setTjoindate(Date tjoindate) {
        this.tjoindate = tjoindate;
    }

    public String getTstatus() {
        return tstatus;
    }

    public void setTstatus(String tstatus) {
        this.tstatus = tstatus;
    }

    public MultipartFile getTimage() {
        return timage;
    }

    public void setTimage(MultipartFile timage) {
        this.timage = timage;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
