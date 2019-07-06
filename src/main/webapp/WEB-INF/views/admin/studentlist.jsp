<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Teacher List</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->

            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>

            <style>
                li{
                    list-style: none;
                }
                span{
                    text-align: left;
                }
                a{
                    text-decoration: none;

                }
            </style>
            <!--Custom Javascript-->
            <script>
                var student = ${studentlists};
                angular.module('myApp', []).controller('studentlistCtrl',
                        function ($scope) {
                            $scope.sList = student;

                        });
        </script>

    </head>
    <body ng-app="myApp" ng-controller="studentlistCtrl">
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
                                <div class="container-fluid"
                                     style="margin-top: 10px; margin-bottom: 10px">

                                    <!-- panel end -->
                                    <div>

                                        <span class="card title-text" style="margin-bottom: 15px;"><h2 class="text-success" style="margin-top: 10px;text-align: center;">Student List</h2></span>

                                        <p><input type="text" ng-model="test" class="form-control" placeholder="Search Student "></p>
                                        <!-- end panel2 heading -->
                                        <div class="panel-body">
                                            <ul class="list-group">
                                                <li class="list-group-item" height="45px"
                                                    ng-repeat="s in sList| filter:test ">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td><img class="img-responsive" style="width:135px ;height:150px" src="resources/stimage/{{s.stid}}.jpg" />
                                                            </td>
                                                            <td>
                                                                <a href="studentprofilelink?getsid={{s.stid}}" style="text-decoration: none;color:black;">
                                                                    <ul>
                                                                        <li><span><b>Teacher Id: </b></span>{{s.stid}}</li>
                                                                        <li><span><b>Teacher Name: </b></span>{{s.stname}}</li>
                                                                        <li><span><b>Subject: </b></span>{{s.stfathername}}</li>
                                                                        <li><span><b>Address: </b></span>{{s.stmothername}}</li>
                                                                        <li><span><b>Email: </b></span>{{s.stdob}}</li>
                                                                        <li><span><b>Contact no: </b></span>{{s.stcontact}}</li>
                                                                        <li><span><b>Joining Date: </b></span>{{s.presentaddress}}</li>
                                                                        <li><span><b>Gender: </b></span>{{s.parmanentaddress}}</li>
                                                                        <li><span><b>Status: </b></span>{{s.stage}}</li>
                                                                        <li><span><b>Status: </b></span>{{s.emailid}}</li>
                                                                    </ul>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- panel2 body end -->
                                    </div>
                                    <!-- panel2 end -->
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


