
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class Routin Page</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var routinlists = ${routinlists};
                var teacherlists = ${teacherlists};
                var subjectlists = ${subjectlists};
                var classlists = ${classlists};
                var sectionlists = ${sectionlists};

                angular.module('myApp', []).controller('classRoutineCtrl',
                        function ($scope) {
                            $scope.routinlists = routinlists;
                            $scope.teacherlists = teacherlists;
                            $scope.subjectlists = subjectlists;
                            $scope.classlists = classlists;
                            $scope.sectionlists = sectionlists;

                            console.log($scope.teacherlists);
                        });
            </script>


    </head>
    <body ng-app="myApp">

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
                                    <div ng-controller="classRoutineCtrl">
                                        <div class="card">
                                            <center><span class="card title-text"><h4>Add Class Routin</h4></span></center>
                                            <div class="box">
                                            <form:form commandName="classroutinObject" action="classroutinadd"
                                                       enctype="multipart/form-data">

                                                <c:if test="${!check}">
                                                    <div class="form-group">
                                                        <form:input class="form-control" Placeholder="ClassRoutine ID"
                                                                    type="text" path="routineid" readonly="true" required="true"></form:input>
                                                        </div>
                                                </c:if>

                                                <div class="form-group input-field col s6">
                                                    <select class="form-control" ng-model="dname" required="true">
                                                        <option value="">--Select Day Name--</option>
                                                        <option value="Saturday">Saturday</option>
                                                        <option value="Sunday">Sunday</option>
                                                        <option value="Monday">Monday</option>
                                                        <option value="Tuesday">Tuesday</option>
                                                        <option value="Wednesday">Wednesday</option>
                                                        <option value="Thursday">Thursday</option>

                                                    </select>
                                                </div>
                                                <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{dname}}" path="dayname"></form:hidden>
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
                                                        <select class="form-control" ng-model="section" ng-options="x.secid as x.secname for x in sectionlists" required="true">
                                                            <option value="">-- choose Section --</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{section}}" path="secid"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="pname" required="true">
                                                            <option value="">--Select Period --</option>
                                                            <option value="1st">1st</option>
                                                            <option value="2nd">2nd</option>
                                                            <option value="3rd">3rd</option>
                                                            <option value="4th">4th</option>
                                                            <option value="5th">5th</option>
                                                            <option value="6th">6th</option>
                                                            <option value="7th">7th</option>
                                                            <option value="8th">8th</option>

                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{pname}}" path="periodname"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="sid" ng-options="x.subjectid as x.subjectname for x in subjectlists" required="true">
                                                            <option value="">-- choose Subject name --</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{sid}}" path="subjectid"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="teacherid" ng-options="x.tid as x.tname for x in teacherlists" required="true">
                                                            <option value="">-- Teacher Name--</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{teacherid}}" path="tid"></form:hidden>
                                                    </div>



                                                    <div class="form-group input-field col s6">
                                                    <form:input class="form-control" Placeholder="Period Time"
                                                                type="text" path="periodtime" required="true"></form:input>
                                                    </div>


                                                <c:if test="${check}">
                                                    <form:button id="editbuttons" type="submit" name="Add" class="btn btn-primary">Add
                                                        Routine</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                        Details</form:button>
                                                </c:if>
                                                <c:if test="${!check}">
                                                    <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit
                                                        Routine</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn">Reset
                                                        Details</form:button>
                                                </c:if>
                                                <a href="showclassroutinpage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>        
                                            </form:form>
                                        </div>
                                    </div>
                                    <div class="panel animated fadeInUp delay-05s" id="panel-2">
                                        <div class="panel-heading card-header">
                                            <i class="fas fa-table"></i>
                                            <span class="lead">Class Routine Chart</span>
                                        </div>
                                        <p><input type="text" ng-model="test" class="form-control" placeholder="Search Class Routine"></p>
                                        <!-- end panel2 heading -->
                                        <div class="table-responsive panel-body">

                                            <table class="table table-striped table-dark table-bordered" style="width: 100%">
                                                <tr>
                                                    <th>Routine Id</th>
                                                    <th>Day name</th>
                                                    <th>Class Id</th>
                                                    <th>Section Id</th>
                                                    <th>Period name</th>
                                                    <th>Subject Id</th>
                                                    <th>Teacher Id</th>
                                                    <th>Period time</th>
                                                    <th>Action</th>
                                                </tr >
                                                <tr ng-repeat="cr in routinlists| filter:test" border="1">

                                                    <td>{{cr.routineid}}</td>
                                                    <td>{{cr.dayname}}</td>
                                                    <td>{{cr.classid}}</td>
                                                    <td>{{cr.secid}}</td>
                                                    <td>{{cr.periodname}}</td>
                                                    <td>{{cr.subjectid}}</td>
                                                    <td>{{cr.tid}}</td>
                                                    <td>{{cr.periodtime}}</td>
                                                    <td><a href="editingclassroutin?getcrid={{cr.routineid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> <a
                                                            href="removingclassroutin/{{cr.routineid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a></td>
                                                </tr>
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
