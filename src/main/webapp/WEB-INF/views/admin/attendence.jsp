
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Attendence Page</title>
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var attendencelist = ${attendencelists};
                var studentlist = ${studentlists};
                var streglist = ${streglists};
                var classlist = ${classlists};
                var grouplist = ${grouplists};
                var sectiontlist = ${sectiontlists};

                angular.module('organocartpackage', []).controller('ProductController',
                        function ($scope) {
                            $scope.attendencelists = attendencelist;
                            $scope.studentlists = studentlist;
                            $scope.streglists = streglist;
                            $scope.classlists = classlist;
                            $scope.grouplists = grouplist;
                            $scope.sectiontlists = sectiontlist;


                            console.log($scope.studentlists);
                        });
        </script>


    </head>
    <body ng-app="organocartpackage" ng-controller="ProductController">
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
                                            <center><span class="card title-text"><h4>Student Attendence</h4></span></center>
                                            <div class="box">
                                            <form:form commandName="attendenceObject" action="addingattendence"
                                                       enctype="multipart/form-data">


                                                <div class="form-group input-field col s6">
                                                    <select class="form-control" ng-model="stuid" ng-options="x.stid  as x.stid for x in studentlists" required="true">
                                                        <option value="">-- Choose Student id--</option>
                                                    </select>
                                                </div>
                                                <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{stuid}}" path="stid"></form:hidden>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="strid" ng-options="x.regid as x.regid for x in streglists">
                                                            <option value="">-- Registration No--</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{strid}}" path="regid"></form:hidden>
                                                    </div>



                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="cId" ng-options="x.classid as x.classname for x in classlists" required="true">
                                                            <option value="">-- Choose Class name--</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{cId}}" path="classid"></form:hidden>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="gid" ng-options="x.groupid as x.groupname for x in grouplists" >
                                                            <option value="">-- choose group --</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{gid}}" path="groupid"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="section" ng-options="x.secid as x.secname for x in sectiontlists" >
                                                            <option value="">-- choose Section --</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{section}}" path="secid"></form:hidden>
                                                    </div>


                                                <c:if test="${check}">
                                                    <form:button id="editbuttons" type="submit" name="Add" class="btn btn-primary">Add
                                                        Attendence</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                        Details</form:button>
                                                </c:if>
                                                <c:if test="${!check}">
                                                    <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit
                                                        Details</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                        Details</form:button>
                                                </c:if>
                                                <a href="attendencpage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>        
                                            </form:form>
                                        </div>
                                    </div>
                                    <div class="card table-card">
                                        <center><span class="card title-text"><h4>Student Attendence List</h4></span></center>
                                        <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-dark">
                                                <thead>
                                                    <tr>
                                                        <th>Attendance id</th>
                                                        <th>Student id</th>
                                                        <th>Reg. No</th>
                                                        <th>Class id</th>
                                                        <th>Group</th>
                                                        <th>Section</th>
                                                        <th>Date</th>
                                                        <th>Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="atten in attendencelists| filter:test">
                                                        <td>{{atten.atid}}</td>
                                                        <td>{{atten.stid}}</td>
                                                        <td>{{atten.regid}}</td>
                                                        <td>{{atten.classid}}</td>
                                                        <td>{{atten.groupid}}</td>
                                                        <td>{{atten.secid}}</td>
                                                        <td>{{atten.atdate}}</td>
                                                        <td>{{atten.atstatus}}</td>
                                                        <td>
                                                            <a href="editingattendence?getatid={{atten.atid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> 
                                                            <a href="removingattendence/{{atten.atid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a>
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
                                                                            var date_input = $('input[name="atdate"]'); //our date input has the name "date"
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
