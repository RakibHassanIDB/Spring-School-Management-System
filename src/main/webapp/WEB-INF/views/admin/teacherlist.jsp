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
                var teacherlist = ${tList};
                angular.module('myApp', []).controller('teacherListCtrl',
                        function ($scope) {
                            $scope.teachers = teacherlist;

                        });
        </script>

    </head>
    <body ng-app="myApp" ng-controller="teacherListCtrl">
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

                                        <span class="card title-text" style="margin-bottom: 15px;"><h2 class="text-success" style="margin-top: 10px;text-align: center;">Teacher List</h2></span>

                                        <p><input type="text" ng-model="test" class="form-control" placeholder="Search Teacher "></p>
                                        <!-- end panel2 heading -->
                                        <div class="panel-body">
                                            <ul class="list-group">
                                                <li class="list-group-item" height="45px"
                                                    ng-repeat="teacher in teachers| filter:test ">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td><img class="img-responsive" style="width:125px ;height:150px" src="resources/timage/{{teacher.tid}}.jpg" />
                                                            </td>
                                                            <td>
                                                                <a href="teacherprofilelink?gettid={{teacher.tid}}" style="text-decoration: none;color:black;">
                                                                    <ul>
                                                                        <li><span><b>Teacher Id: </b></span>{{teacher.tid}}</li>
                                                                        <li><span><b>Teacher Name: </b></span>{{teacher.tname}}</li>
                                                                        <li><span><b>Address: </b></span>{{teacher.taddress}}</li>
                                                                        <li><span><b>Email: </b></span>{{teacher.temail}}</li>
                                                                        <li><span><b>Contact no: </b></span>{{teacher.tcontact}}</li>
                                                                        <li><span><b>Joining Date: </b></span>{{teacher.tjoindate}}</li>
                                                                        <li><span><b>Gender: </b></span>{{teacher.tgender}}</li>
                                                                        <li><span><b>Status: </b></span>{{teacher.tstatus}}</li>
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


