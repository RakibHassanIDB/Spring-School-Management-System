<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Marks Page</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var marklists = ${marklist};
                var studentlists = ${studentlist};
                var grouplists = ${grouplist};
                var yearlists = ${yearlist};
                var subjectlists = ${subjectlist};
                var classlists = ${classlist};
                var sectionlists = ${sectionlist};
                var examlists = ${examlist};
                angular.module('myApp', []).controller('ExamMarkCtrl',
                        function ($scope) {
                            $scope.marklist = marklists;
                            $scope.stList = studentlists;
                            $scope.gList = grouplists;
                            $scope.yList = yearlists;
                            $scope.subList = subjectlists;
                            $scope.cList = classlists;
                            $scope.secList = sectionlists;
                            $scope.examList = examlists;
                            console.log($scope.examList);
                        });
        </script>


    </head>
    <body ng-app="myApp" ng-controller="ExamMarkCtrl">

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
                                            <center><span class="card-title title-text"><h4>Add Student Exam Marks</h4></span></center>
                                            <div class="box">
                                            <form:form commandName="exammarkObject" action="examMarkadd"
                                                       enctype="multipart/form-data">

                                                <c:if test="${!check}">
                                                    <div class="form-group input-field col s6">
                                                        <form:input class="form-control" Placeholder="Mark ID" sytle="display:none"
                                                                    type="text" path="markid" readonly="true" required="true"></form:input>
                                                        </div>
                                                </c:if>

                                                <div class="form-group input-field col s6">
                                                    <select class="form-control" ng-model="yId" ng-options="x.yearid as x.accyear for x in yList" required="true">
                                                        <option value="">-- Choose Academic Year--</option>
                                                    </select>
                                                </div>

                                                <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{yId}}" path="yearid"></form:hidden>
                                                    </div>


                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="cId" ng-options="x.classid as x.classname for x in cList" required="true">
                                                            <option value="">-- Choose Class name--</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{cId}}" path="classid"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="section" ng-options="x.secid as x.secname for x in secList" required="true">
                                                            <option value="">-- choose Section --</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{section}}" path="secid"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="gid" ng-options="x.groupid as x.groupname for x in gList" required="true">
                                                            <option value="">-- choose group --</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{gid}}" path="groupid"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="stuid" ng-options="x.stid as x.stname for x in stList" required="true">
                                                            <option value="">-- Choose Student id--</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{stuid}}" path="stid"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="sub" ng-options="x.subjectid as x.subjectname for x in subList" required="true">
                                                            <option value="">-- choose Subject name --</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{sub}}" path="subjectid"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="ex" ng-options="x.examid as x.examtitle for x in examList" required="true">
                                                            <option value="">--choose Exam--</option>
                                                        </select>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{ex}}" path="examid"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                    <form:input class="form-control" Placeholder="Mark Obtain"
                                                                type="text" path="markobtain" required="true"></form:input>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                    <form:input class="form-control" Placeholder="Mark Grade"
                                                                type="text" path="markgrade" required="true"></form:input>
                                                    </div>




                                                <c:if test="${check}">
                                                    <form:button id="editbuttons" type="submit" name="Add" class="btn btn-outline-primary">Add
                                                        Marks</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-outline-danger">Reset
                                                        Details</form:button>
                                                </c:if>
                                                <c:if test="${!check}">
                                                    <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-outline-warning">Edit
                                                        Marks</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-outline-danger">Reset
                                                        Details</form:button>
                                                </c:if>
                                                <a href="showexammarkpage"><button id="show" type="button" class="btn btn-outline-info">Cancel</button></a>        
                                            </form:form>

                                        </div>
                                    </div>
                                    <div class="card table-card">
                                        <center><span class="card title-text"><h4>Exam Mark List</h4></span></center>
                                        <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-dark table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Mark Id</th>
                                                        <th>Year Id</th>                                   
                                                        <th>Class Id</th>
                                                        <th>Section Id</th>
                                                        <th>Group Id</th>
                                                        <th>Student Id</th>                                   
                                                        <th>Subject Id</th>
                                                        <th>Exam Id</th>
                                                        <th>Mark Obtain</th>
                                                        <th>Mark Grade</th>                                    
                                                        <th>Action</th>
                                                    </tr >
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="em in marklist| filter:test">
                                                        <td>{{em.markid}}</td>
                                                        <td>{{em.yearid}}</td>
                                                        <td>{{em.classid}}</td>
                                                        <td>{{em.secid}}</td>
                                                        <td>{{em.groupid}}</td>
                                                        <td>{{em.stid}}</td>
                                                        <td>{{em.subjectid}}</td>                                                                  
                                                        <td>{{em.examid}}</td>                                                                  
                                                        <td>{{em.markobtain}}</td>
                                                        <td>{{em.markgrade}}</td>
                                                        <td>
                                                            <a href="editingexammark?getemid={{em.markid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> 
                                                            <a href="removingexammark/{{em.markid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a>
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
