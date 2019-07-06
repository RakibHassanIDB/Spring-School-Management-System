package com.rakib.sms.controller;

import com.rakib.sms.dao.JasperReportDAO;
import com.rakib.sms.reportmodel.AttendenceReport;
import com.rakib.sms.reportmodel.ClassRoutineReport;
import com.rakib.sms.reportmodel.ExamSearchReport;
import com.rakib.sms.reportmodel.PaymentReport;
import com.rakib.sms.reportmodel.StudentReport;
import com.rakib.sms.reportmodel.TeacherReport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;
/**
 *
 * @author User
 */
@Controller
public class ReportController {
    

    
    //report-1: Demo Report
    @RequestMapping(value = "/studentView", method = RequestMethod.GET)
    public String loadSurveyPg(
            @ModelAttribute("reportInputForm") StudentReport reportInputForm, Model model) {
        model.addAttribute("reportInputForm", reportInputForm);
        return "report/studentlist";
    }
    
    @RequestMapping(value = "/studentView", method = RequestMethod.POST)
    public String generateReport(@ModelAttribute("reportInputForm") StudentReport reportInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "studentlist";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String clid = reportInputForm.getClassid();
            String section = reportInputForm.getSecid();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("classid", clid);
            hmParams.put("section", section);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    
    
    //report-2: Attendence Report
     @RequestMapping(value = "/attendenceView", method = RequestMethod.GET)
    public String loadSurveyPg(
            @ModelAttribute("attendenceInputForm") AttendenceReport attendenceInputForm, Model model) {
        model.addAttribute("attendenceInputForm", attendenceInputForm);
        return "report/attendence";
    }
    
    @RequestMapping(value = "/attendenceView", method = RequestMethod.POST)
    public String generateReport(@ModelAttribute("attendenceInputForm") AttendenceReport attendenceInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "attendencereport";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String clsname = attendenceInputForm.getClassname();
            String attdate = attendenceInputForm.getAtdate();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("classname", clsname);
            hmParams.put("atdate", attdate);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    
    //report-3: Student Marks report
    
    @RequestMapping(value = "/reportMarksheet", method = RequestMethod.GET)
    public String generateReport(HttpServletRequest request,HttpServletResponse response,HttpSession marksession) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "marksheet";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            int markid = (int) marksession.getAttribute("markid");
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("markid", markid);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    
    
    
    
    
    //report-4: Class Routine Report
     @RequestMapping(value = "/classroutineView", method = RequestMethod.GET)
    public String loadClassRoutinepage(
            @ModelAttribute("attendenceInputForm") ClassRoutineReport classroutineInputForm, Model model) {
        model.addAttribute("classroutineInputForm", classroutineInputForm);
        return "report/classroutine";
    }
    
    @RequestMapping(value = "/classroutineView", method = RequestMethod.POST)
    public String generateReport(@ModelAttribute("classroutineInputForm") ClassRoutineReport attendenceInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "classroutine";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String clsname = attendenceInputForm.getClassname();
            String section = attendenceInputForm.getSecname();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("classname", clsname);
            hmParams.put("section", section);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    
    
    
    //report-4: Class Routine Report
     @RequestMapping(value = "/examsearchView", method = RequestMethod.GET)
    public String loadClassRoutinepage(
            @ModelAttribute("examsearchInputForm") ExamSearchReport examsearchInputForm, Model model) {
        model.addAttribute("examsearchInputForm", examsearchInputForm);
        return "report/examsearch";
    }
    
    @RequestMapping(value = "/examsearchView", method = RequestMethod.POST)
    public String generateReport(@ModelAttribute("examsearchInputForm") ExamSearchReport examsearchInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "examsearch";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String clsname = examsearchInputForm.getExams();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("classname", clsname);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    
    
    
    //report-5: Fess payment Report
     @RequestMapping(value = "/paymentView", method = RequestMethod.GET)
    public String loadClassRoutinepage(
            @ModelAttribute("paymentInputForm") PaymentReport paymentInputForm, Model model) {
        model.addAttribute("paymentInputForm", paymentInputForm);
        return "report/feespayment";
    }
    
    @RequestMapping(value = "/paymentView", method = RequestMethod.POST)
    public String generateReport(@ModelAttribute("paymentInputForm") PaymentReport paymentInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "paymentreport";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String startdate = paymentInputForm.getStartdate();
            String enddate = paymentInputForm.getEnddate();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("startdate", startdate);
            hmParams.put("enddate", enddate);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    
    
    //report-6: Teacher Report
     @RequestMapping(value = "/teacherView", method = RequestMethod.GET)
    public String loadClassRoutinepage(
            @ModelAttribute("teacherInputForm") TeacherReport teacherInputForm, Model model) {
        model.addAttribute("teacherInputForm", teacherInputForm);
        return "report/feespayment";
    }
    
    @RequestMapping(value = "/teacherView", method = RequestMethod.POST)
    public String generateReport(@ModelAttribute("teacherInputForm") TeacherReport teacherInputForm,HttpServletRequest request,HttpServletResponse response) throws JRException, IOException, SQLException, NamingException {
        String reportFileName = "teacherlist";
        JasperReportDAO jrdao = new JasperReportDAO();
        Connection conn = null;
        try {
            conn = jrdao.getConnection();
            String tname = teacherInputForm.getTname();
            HashMap<String, Object> hmParams = new HashMap<String, Object>();
            hmParams.put("tname", tname);
            JasperReport jasperReport = jrdao.getCompiledFile(reportFileName,request);

            jrdao.generateReportPDF(response, hmParams, jasperReport, conn); 

        } catch (SQLException sqlExp) {
            System.out.println("Exception::" + sqlExp.toString());
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                    conn = null;
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }

        }

        return null;
    }
    
    
    
    
    
}
