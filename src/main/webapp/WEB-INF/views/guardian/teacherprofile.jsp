<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Teacher Profile Page</title>
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
                var teacher = ${singleT};
                console.log(teacher);

                angular.module('myApp', []).controller('teacherProfileCtrl',
                        function ($scope) {
                            $scope.tTe = teacher;

                            console.log($scope.tTe);
                        });
        </script>
        <!-- endinject -->

    </head>
    <body ng-app="myApp" ng-controller="teacherProfileCtrl">
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <jsp:include page="/WEB-INF/views/partial/teacher/topnav.jsp"></jsp:include>
                <!-- partial -->
                <div class="container-fluid page-body-wrapper">
                    <!-- partial:partials/_sidebar.html -->
                <jsp:include page="/WEB-INF/views/partial/teacher/sidebar.jsp"></jsp:include>
                    <!-- partial -->
                    <div class="main-panel">
                        <div class="content-wrapper">
                            <div class="row">
                                <div class="col-md-12">
                                        <center><span class="card title-text"><h2 class="text-success" style="margin-top: 10px;">Welcome {{tTe.tname}}</h2></span></center>
                                    </div>
                                <div class="col-md-4  grid-margin">
                                    <div class="card">
                                        <div class="card-body">
                                            <p class="card-title">Teacher Profile of: <span class="text-primary">{{tTe.tname}}</p>
                                            <div class="card">
                                                <center><img class="img-responsive" style="width:275px ;height:290px;border-radius: 0; boder:none;" src="resources/timage/{{tTe.tid}}.jpg" /></center>
                                            </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8  grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title">Teacher Profile of : <span class="text-primary">{{tTe.tname}}</span></p>
                                        <div class="text-gray">
                                            <label class="card-title">Name: </label> {{tTe.tname}}
                                            <br>
                                            <label class="card-title">Subject Name:</label> {{tTe.subjectname}} 
                                            <br>
                                            <label class="card-title">Address:</label> {{tTe.taddress}} 
                                            <br>
                                            <label class="card-title">Email Address:</label> {{tTe.temail}} 
                                            <br>
                                            <lable class="card-title">Contact:</lable> {{tTe.tcontact}}
                                            <br><br>
                                            <label class="card-title">Gender:</label> {{tTe.tgender}}  
                                            <br>
                                            <label class="card-title">Joining Date:</label> {{tTe.tjoindate}}
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

