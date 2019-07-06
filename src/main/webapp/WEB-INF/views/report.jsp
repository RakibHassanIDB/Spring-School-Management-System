<%-- 
    Document   : report
    Created on : Mar 29, 2018, 10:46:50 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
        <style>
            .error {
                color: #ff0000;
            }
            body{
                margin-left: 0;
            }

        </style>
    </head>
    <body>
        <form:form method="POST" action="reportView" commandName="reportInputForm">

            <table id="reptbl" width="50%" style="width:40%;margin-top: 30px;margin-left: 10px;" border="1" class="table table-dark table-striped">
                <tr>
                    <th colspan="2"><form:errors path="mobile" cssClass="error"/>Report example</th> </tr>
                <tr>
                    <td>
                        <span class="card-title title-text">Enter Report Title</span> <form:input path="mobile" id="title"/>
                        <input type="submit" class="btn btn-outline-primary"  value="Generate Report"  />
                    </td> 

                </tr>
            </table>  
        </form:form>
    </body>
</html>
