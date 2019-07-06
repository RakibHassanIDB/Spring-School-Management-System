<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Exam Marks</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var studentlist = ${StList};
                angular.module('myApp', []).controller('ExamMarkCtrl',
                        function ($scope) {
                            $scope.sList = studentlist;
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
                                <div class="col-md-12">
                                    <center><span class="card title-text"><h2 class="text-success" style="margin-top: 10px;">Add Student Exam Marks</h2></span></center>
                                </div>
                                <div class="row col-md-12">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h2 class="title-text text-primary" style="font-size: 25px;"><center>Students List</center></h2>
                                                <div class="form-group input-field col-md-12">
                                                    <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                                </div>
                                                <div class="table-responsive">
                                                    <table id="recent-purchases-listing" class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>St. Photo</th>
                                                                <th>St.Id</th>
                                                                <th>Name</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr ng-repeat="student in sList | filter:test">
                                                                <td><img class="img-responsive" style="width:175px ;height:190px;border-radius: 0;" src="resources/stimage/{{student.stid}}.jpg" /></td>
                                                                <td>{{student.stid}}</td>
                                                                <td>{{student.stname}}</td>
                                                                <td><a href="marksaddbutton?getregid={{student.stid}}"><button id="editbuttons" type="submit" style="padding: 15px;" class="btn btn-danger"><i class="fas fa-plus" style="font-size: 20px;"></i> <span style="font-size: 20px; padding-left: 10px;">Add Marks</span></button></a>
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
    </body>
</html>
