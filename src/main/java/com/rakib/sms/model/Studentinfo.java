
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
public class Studentinfo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int stid;
    @Column
    private String stname;
    @Column
    private String stfathername;
    @Column
    private String stmothername;
    @Column
    private String presentaddress;
    @Column
    private String parmanentaddress;
    @Column
    private String emailid;
    @Column
    private String stage;
    @Column
    private String stgender;
    @Temporal(TemporalType.DATE)
    private Date stdob;
    @Column
    private String stcontact;
    @Transient
    private String ststatus = "True";
    @Transient
    MultipartFile stimage;
    @Transient
    private String username;
    @Transient
    private String password="456";
    @Transient
    private String role="ROLE_STUDENT";

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public MultipartFile getStimage() {
        return stimage;
    }

    public void setStimage(MultipartFile stimage) {
        this.stimage = stimage;
    }

    public int getStid() {
        return stid;
    }

    public void setStid(int stid) {
        this.stid = stid;
    }

    public String getStname() {
        return stname;
    }

    public void setStname(String stname) {
        this.stname = stname;
    }

    public String getStfathername() {
        return stfathername;
    }

    public void setStfathername(String stfathername) {
        this.stfathername = stfathername;
    }

    public String getStmothername() {
        return stmothername;
    }

    public void setStmothername(String stmothername) {
        this.stmothername = stmothername;
    }

    public String getPresentaddress() {
        return presentaddress;
    }

    public void setPresentaddress(String presentaddress) {
        this.presentaddress = presentaddress;
    }

    public String getParmanentaddress() {
        return parmanentaddress;
    }

    public void setParmanentaddress(String parmanentaddress) {
        this.parmanentaddress = parmanentaddress;
    }

    public String getStage() {
        return stage;
    }

    public void setStage(String stage) {
        this.stage = stage;
    }

    public String getStgender() {
        return stgender;
    }

    public void setStgender(String stgender) {
        this.stgender = stgender;
    }

    public Date getStdob() {
        return stdob;
    }

    public void setStdob(Date stdob) {
        this.stdob = stdob;
    }

    public String getStcontact() {
        return stcontact;
    }

    public void setStcontact(String stcontact) {
        this.stcontact = stcontact;
    }

    public String getStstatus() {
        return ststatus;
    }

    public void setStstatus(String ststatus) {
        this.ststatus = ststatus;
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
    
    

}
