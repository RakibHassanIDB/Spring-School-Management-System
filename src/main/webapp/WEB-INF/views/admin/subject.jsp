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
        <title>Subject Page</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var sub = ${subjectmodelobject};
                console.log(sub);
                angular.module('myApp', []).controller('subCtrl',
                        function ($scope) {
                            $scope.subjects = sub;
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
                                    <div ng-controller="subCtrl">
                                        <div class="card">
                                            <center><span class="card title-text"><h4>Add Subject</h4></span></center>
                                            <div class="box">
                                            <c:if test="${check}">
                                                <form:form name="addSubjectobject"
                                                           modelAttribute="addSubjectObject1" action="addingsubject"
                                                           method="post">
                                                    <div class="form-group input-field col s6">
                                                        <form:input id="name" class="form-control"
                                                                    Placeholder="Subject Code" type="text" path="subjectcode"  required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="subject Name" type="text" path="subjectname" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="subject Status" type="text" path="status" required="true"></form:input>
                                                        </div>

                                                    <form:button id="editbuttons" type="submit" name="addsubject"
                                                                 class="btn btn-primary">Add Subject</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                        Details</form:button>

                                                </form:form>
                                            </c:if>

                                            <c:if test="${!check}">
                                                <form:form name="addSubjectobject"
                                                           modelAttribute="addSubjectObject1" action="addingsubject"
                                                           method="post">
                                                    <div class="form-group input-field col s6">
                                                        <form:input id="id" class="form-control" style="display:none"
                                                                    Placeholder="Subjeci ID" type="text" path="subjectid" readonly="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:input id="name" class="form-control"
                                                                    Placeholder="Subject Code" type="text" path="subjectcode"  required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="subject Name" type="text" path="subjectname" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="subject Status" type="text" path="status" required="true"></form:input>
                                                        </div>

                                                    <form:button id="editbuttons" type="submit" name="Editsubject"
                                                                 class="btn btn-warning">Edit Subject</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                        Details</form:button>
                                                </form:form>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="card table-card">
                                        <center><span class="card title-text"><h4>Subject List</h4></span></center>
                                        <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-dark">
                                                <thead>
                                                    <tr>
                                                        <th>Subject Id</th>
                                                        <th>Subject Code</th>
                                                        <th>Subject Name</th>
                                                        <th>Subject Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="x in subjects| filter:test">
                                                        <td>{{x.subjectid}}</td>
                                                        <td>{{x.subjectcode}}</td>
                                                        <td>{{x.subjectname}}</td>
                                                        <td>{{x.status}}</td>
                                                        <td>
                                                            <a href="editsubjectbutton?getsubid={{x.subjectid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> 
                                                            <a href="removesubject/{{x.subjectid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a>
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
