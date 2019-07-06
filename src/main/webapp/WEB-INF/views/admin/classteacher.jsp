<%-- 
    Document   : addClass
    Created on : Nov 24, 2018, 6:26:51 PM
    Author     : C7
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class Teacher Page</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var classteacherlists = ${classteacherlists};
                var teacherlist = ${teacherlist};
                var grouplists = ${grouplists};
                var classlists = ${classlists};
                var sectionlists = ${sectionlists};
                var yearslists = ${yearslists};

                angular.module('myApp', []).controller('classTeacherCtrl',
                        function ($scope) {
                            $scope.classteacherlists = classteacherlists;
                            $scope.teacherlist = teacherlist;
                            $scope.grouplists = grouplists;
                            $scope.classlists = classlists;
                            $scope.sectionlists = sectionlists;
                            $scope.yearslists = yearslists;
                            console.log($scope.teacherlist);
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
                                    <div ng-controller="classTeacherCtrl">
                                        <div class="card">
                                            <center><span class="card title-text"><h4>Add Class Teacher</h4></span></center>
                                            <div class="box">
                                            <form:form commandName="classteacherObject" action="classteacheradd"
                                                       enctype="multipart/form-data">
                                                <c:if test="${check}">
                                                    <div class="form-group input-field col s6">

                                                        <form:input class="form-control" Placeholder="Assign Id" style="display:none"
                                                                    type="text" path="assignid" required="true"></form:input>
                                                        </div>
                                                </c:if>
                                                <c:if test="${!check}">
                                                    <div class="form-group input-field col s6">
                                                        <form:input class="form-control" Placeholder="Assign Id" style="display:none"
                                                                    type="text" path="assignid" readonly="true" required="true"></form:input>
                                                        </div>
                                                </c:if>



                                                <div class="form-group input-field col s6">
                                                    <select class="form-control" ng-model="teacherid" ng-options="x.tid as x.tname for x in teacherlist" required="true">
                                                        <option value="">-- Teacher Name--</option>
                                                    </select>
                                                </div>
                                                <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{teacherid}}" path="tid"></form:hidden>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="cId" ng-options="x.classid as x.classname for x in classlists" required="true">
                                                            <option value="">-- Choose Class --</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{cId}}" path="classid"></form:hidden>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="gid" ng-options="x.groupid as x.groupname for x in grouplists" required="true">
                                                            <option value="">-- choose Group --</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{gid}}" path="groupid"></form:hidden>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="section" ng-options="x.secid as x.secname for x in sectionlists" required="true">
                                                            <option value="">-- choose Section--</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{section}}" path="secid"></form:hidden>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="acyearid" ng-options="x.yearid as x.accyear for x in yearslists" required="true">
                                                            <option value="">-- Academic Year --</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{acyearid}}" path="yearid"></form:hidden>
                                                    </div>





                                                <c:if test="${check}">
                                                    <form:button id="editbuttons" type="submit" name="Add" class="btn btn-primary">Add
                                                        Details</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                        Details</form:button>
                                                </c:if>
                                                <c:if test="${!check}">
                                                    <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit
                                                        Classteacher</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                        Details</form:button>
                                                </c:if>
                                                <a href="showclassteacherpage"><button id="show" type="button" class="btn">Cancel</button></a>        
                                            </form:form>
                                        </div>
                                    </div>
                                    <div class="card table-card">
                                        <center><span class="card title-text"><h4>Class Teacher List</h4></span></center>
                                        <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                        <div class="table-responsive">
                                        <table class="table table-striped table-dark">
                                            <thead>
                                                <tr>
                                                    <th>Assign Id</th>
                                                    <th>Teacher Id</th>
                                                    <th>Class Id</th>
                                                    <th>Group Id</th>
                                                    <th>Section Id</th>
                                                    <th>Year Id</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr ng-repeat="ct in classteacherlists| filter:test">
                                                    <td>{{ct.assignid}}</td>
                                                    <td>{{ct.tid}}</td>
                                                    <td>{{ct.classid}}</td>
                                                    <td>{{ct.groupid}}</td>
                                                    <td>{{ct.secid}}</td>
                                                    <td>{{ct.yearid}}</td>
                                                    <td>
                                                        <a href="editingclassteacher?getctid={{ct.assignid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> 
                                                        <a href="removingclassteacher/{{ct.assignid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a>
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
