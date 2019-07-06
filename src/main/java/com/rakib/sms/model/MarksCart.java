package com.rakib.sms.model;

/**
 *
 * @author Shaheed
 */
public class MarksCart {
    
    private int subjectid;
    private String markobtain;
    private String markgrade;

    public MarksCart() {
    }

    public MarksCart(int subjectid, String markobtain, String markgrade) {
        this.subjectid = subjectid;
        this.markobtain = markobtain;
        this.markgrade = markgrade;
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

    @Override
    public String toString() {
        return "MarksCart{" + "subjectid=" + subjectid + ", markobtain=" + markobtain + ", markgrade=" + markgrade + '}';
    }

    
    
    

}
