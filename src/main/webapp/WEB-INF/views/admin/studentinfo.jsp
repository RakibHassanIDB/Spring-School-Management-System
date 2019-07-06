
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Information Page</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var studentlist = ${studentlists};
                angular.module('mystudent', []).controller('studentController',
                        function ($scope) {
                            $scope.studentlists = studentlist;
                            console.log($scope.studentlists);
                        });
        </script>

    </head>
    <body ng-app="mystudent" ng-controller="studentController">
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <jsp:include page="/WEB-INF/views/partial/topnav.jsp"></jsp:include>
                <!-- partial -->
                <div class="container-fluid page-body-wrapper">
                    <!-- partial:partials/_sidebar.html -->
                <jsp:include page="/WEB-INF/views/partial/admin/sidebar.jsp"></jsp:include>
                    <!-- partial -->
                    <div class="main-panel">
                        <div class="content-wrapper">
                            <div class="row">
                                <div class="col-md-12 grid-margin">
                                    <div>
                                        <div class="card">
                                            <center><span class="card-title title-text"><h4>Add Student information</h4></span></center>
                                            <div class="box">
                                            <c:if test="${check}">
                                                <form:form commandName="addStuObject1" action="addingstudent"
                                                           enctype="multipart/form-data" >

                                                    <div class="form-group input-field col s6" >

                                                        <form:input class="form-control" 
                                                                    Placeholder=" Name" type="text" path="stname" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Father's Name" type="text" path="stfathername" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">


                                                        <form:input class="form-control"
                                                                    Placeholder=" Mother's Name" type="text" path="stmothername" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Present Address" type="text" path="presentaddress" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Permanent Address" type="text" path="parmanentaddress" required="true"></form:input>
                                                        </div>
                                                        
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder="Email Address" type="text" path="emailid" required="true"></form:input>
                                                        </div>                                                    
                                                        
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Age" type="text" path="stage" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">                                                            
                                                            <select class="form-control combobox" ng-model="gen" required="true">
                                                                <option value="">--Select Gender --</option>
                                                                <option value="Male"> Male</option>
                                                                <option value="Female"> Female</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group input-field col s6">

                                                        <form:hidden  class="form-control" value="{{gen}}" path="stgender"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Date of Birth" type="text" path="stdob" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Contact" type="text" path="stcontact" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">

                                                        <form:input type="file" name="fileToUpload" id="fileToUpload" class="btn btn-info"
                                                                    path="stimage" ></form:input>
                                                        </div>
                                                    <form:button type="submit" class="btn btn-primary" id="editbuttons" name="Add">Add Student</form:button>
                                                    <form:button type="reset" class="btn btn-danger" id="removebuttons">Reset Details</form:button>
                                                </form:form>
                                            </c:if>
                                            <c:if test="${!check}">
                                                <form:form commandName="addStuObject1" action="addingstudent"
                                                           enctype="multipart/form-data">

                                                    <div class="form-group input-field col s6">

                                                        <form:input class="form-control" style="display:none"
                                                                    Placeholder=" Student Id" type="text" path="stid" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"

                                                                    Placeholder=" Name" type="text" path="stname" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Fathar's Name" type="text" path="stfathername" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Mother's Name" type="text" path="stmothername" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Present Address" type="text" path="presentaddress" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Parmanent Address" type="text" path="parmanentaddress" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Age" type="text" path="stage" required="true"></form:input>
                                                        </div>


                                                        <div class="form-group input-field col s6">

                                                            <select class="form-control" ng-model="gen" required="true">
                                                                <option value="">--Select Gender --</option>

                                                                <option value="Male"> Male</option>
                                                                <option value="Female"> Female</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{gen}}" path="stgender"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Dath of Birth" type="text" path="stdob" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input class="form-control"
                                                                    Placeholder=" Contact" type="text" path="stcontact" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">

                                                        <form:input type="file" name="fileToUpload" id="fileToUpload" class="btn btn-info"
                                                                    path="stimage" required="true"></form:input>
                                                        </div>
                                                    <form:button id="editbuttons" type="submit" class="btn btn-warning " name="Edit">Edit Student</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger ">Reset Details</form:button>
                                                </form:form>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="card mb-3">
                                        <div class="card-title card-header">
                                            <i class="fas fa-table"></i>
                                            Student List
                                        </div>

                                        <div class="card-body">
                                            <div class="form-group input-field col s12">
                                                <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table table-striped table-dark table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <th>St. Photo</th>
                                                            <th>St.Id</th>
                                                            <th>Name</th>
                                                            <th>Father</th>
                                                            <th>Mother</th>
                                                            <th>Present</th>
                                                            <th>permanent</th>
                                                            <th>Age</th>
                                                            <th>Gender</th>
                                                            <th>DOB</th>
                                                            <th>Contact</th>
                                                            <th>Status</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-repeat="student in studentlists| filter:test">
                                                            <td><img class="img-responsive" style="width:75px ;height:90px;border-radius: 0;" src="resources/stimage/{{student.stid}}.jpg" /></td>
                                                            <td>{{student.stid}}</td>
                                                            <td>{{student.stname}}</td>
                                                            <td>{{student.stfathername}}</td>
                                                            <td>{{student.stmothername}}</td>
                                                            <td>{{student.presentaddress}}</td>
                                                            <td>{{student.parmanentaddress}}</td>
                                                            <td>{{student.stage}}</td>
                                                            <td>{{student.stgender}}</td>
                                                            <td>{{student.stdob}}</td>
                                                            <td>{{student.stcontact}}</td>
                                                            <td>{{student.ststatus}}</td>
                                                            <td><a href="editingstudent?getsid={{student.stid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> <a href="removingstudent/{{student.stid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a><a href="studentprofilelink?getsid={{student.stid}}"><button id="editbuttons" type="submit" class="btn btn-info"><i class="far fa-user"></i></button></a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <jsp:include page="/WEB-INF/views/partial/footer.jsp"></jsp:include>
                        <!-- partial -->
                    </div>
                    <!-- main-panel ends -->
                </div>
                <!-- page-body-wrapper ends -->
            </div>
            <!-- container-scroller -->

        <jsp:include page="/WEB-INF/views/partial/jsinclude.jsp"></jsp:include>


        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

        <script>
                                                                        $(document).ready(function () {
                                                                            var date_input = $('input[name="stdob"]'); //our date input has the name "date"
                                                                            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                                                                            date_input.datepicker({
                                                                                format: 'dd-mm-yyyy',
                                                                                container: container,
                                                                                todayHighlight: true,
                                                                                autoclose: true,
                                                                            })
                                                                        })
        </script>
    </body>
</html>
