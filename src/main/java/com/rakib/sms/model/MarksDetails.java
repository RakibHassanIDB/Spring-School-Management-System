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

@Entity
public class MarksDetails implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int markdetailid;
    @Column
    private int stid;
    @Column
    private int markid;
    @Column
    private int subjectid;
    @Column
    private String markobtain;
    @Column
    private String markgrade;

    public int getMarkdetailid() {
        return markdetailid;
    }

    public void setMarkdetailid(int markdetailid) {
        this.markdetailid = markdetailid;
    }

    public int getStid() {
        return stid;
    }

    public void setStid(int stid) {
        this.stid = stid;
    }
    

    public int getMarkid() {
        return markid;
    }

    public void setMarkid(int markid) {
        this.markid = markid;
    }
    
    

    public int getSubjectid() {
        return subjectid;
    }

    public void setSubjectid(int subjectid) {
        this.subjectid = subjectid;
    }

    public String getMarkobtain() {
        return markobtain;
    }

    public void setMarkobtain(String markobtain) {
        this.markobtain = markobtain;
    }

    public String getMarkgrade() {
        return markgrade;
    }

    public void setMarkgrade(String markgrade) {
        this.markgrade = markgrade;
    }
    
}
