<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Student Guardian Page</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <!--Custom Javascript-->
            <script>
                var guardian = ${guardianList};
                var student = ${studentList};
                console.log(student);
                angular.module('myApp', []).controller('guardianCtrl',
                        function ($scope) {
                            $scope.gnList = guardian;
                            $scope.sList = student;
                        });
        </script>
        <!-- endinject -->

    </head>
    <body ng-app="myApp" ng-controller="guardianCtrl">
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
                                            <center><span class="card-title title-text"><h4>Add Student Guardian</h4></span></center>
                                            <div class="box">
                                            <c:if test="${check}">
                                                <form:form name="guardianObject"
                                                           modelAttribute="addGuardianObject" action="addingguardian"
                                                           method="post">
                                                    <div class="form-group input-field col s6">
                                                        <form:input id="name" class="form-control"
                                                                    Placeholder="First Name" type="text" path="fname"  required="true"></form:input>

                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Last Name" type="text" path="lname" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Email Id" type="text" path="emailid" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Occupation" type="text" path="occupation" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Mobile" type="text" path="contact" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">                                                            
                                                            <select class="form-control combobox" ng-model="gen" required="true">
                                                                <option value="">--Select Gender --</option>
                                                                <option value="Male"> Male</option>
                                                                <option value="Female"> Female</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group input-field col s6">

                                                        <form:hidden  class="form-control" value="{{gen}}" path="gender"></form:hidden>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="stuid" ng-options="x.stid as x.stname for x in sList" required="true" >
                                                                <option value="">--choose Student--</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{stuid}}" path="stid"></form:hidden>
                                                        </div>

                                                    <form:button id="editbuttons" type="submit" name="Add"
                                                                 class="btn btn-outline-primary">Add Guardian</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-outline-danger">Reset
                                                        Details</form:button>

                                                </form:form>
                                            </c:if>

                                            <c:if test="${!check}">
                                                <form:form name="guardianObject"
                                                           modelAttribute="addGuardianObject" action="addingguardian"
                                                           method="post">

                                                    <div class="form-group input-field col s6">
                                                        <form:input class="form-control" style="display:none"
                                                                    Placeholder="Profile ID" type="text" path="profileid" required="true"></form:input>
                                                        </div>   

                                                        <div class="form-group input-field col s6">
                                                        <form:input id="name" class="form-control"
                                                                    Placeholder="First Name" type="text" path="fname"  required="true"></form:input>

                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Last Name" type="text" path="lname" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Email Id" type="text" path="emailid" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Occupation" type="text" path="occupation" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Mobile" type="text" path="contact" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">                                                            
                                                            <select class="form-control combobox" ng-model="gen" required="true">
                                                                <option value="">--Select Gender --</option>
                                                                <option value="Male"> Male</option>
                                                                <option value="Female"> Female</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group input-field col s6">

                                                        <form:hidden  class="form-control" value="{{gen}}" path="gender"></form:hidden>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="stuid" ng-options="x.stid as x.stname for x in sList" required="true" >
                                                                <option value=""> choose Student Id</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{stuid}}" path="stid"></form:hidden>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Status" type="text" path="status" required="true"></form:input>
                                                        </div>

                                                    <form:button id="editbuttons" type="submit" name="Edit"
                                                                 class="btn btn-outline-warning">Edit Guardian</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-outline-danger">Reset
                                                        Details</form:button>
                                                </form:form>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="card">
                                        <center><span class="card title-text"><h4>Student Guardian List</h4></span></center>
                                        <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-dark">
                                                <thead>
                                                    <tr>
                                                        <th>Profile ID</th>
                                                        <th>First Name</th>
                                                        <th>Last Name</th>
                                                        <th>Email Id</th>
                                                        <th>Occupation</th>
                                                        <th>Gender</th>
                                                        <th>Mobile</th>
                                                        <th>Student ID</th>
                                                        <th>Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="x in gnList| filter:test">
                                                        <td>{{x.profileid}}</td>
                                                        <td>{{x.fname}}</td>
                                                        <td>{{x.lname}}</td>
                                                        <td>{{x.emailid}}</td>
                                                        <td>{{x.occupation}}</td>
                                                        <td>{{x.gender}}</td>
                                                        <td>{{x.contact}}</td>
                                                        <td>{{x.stid}}</td>
                                                        <td>{{x.status}}</td>
                                                        <td>
                                                            <a href="editguardianbutton?getProfileid={{x.profileid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> 
                                                            <a href="removeguardian/{{x.profileid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a>
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
    </body>

</html>

