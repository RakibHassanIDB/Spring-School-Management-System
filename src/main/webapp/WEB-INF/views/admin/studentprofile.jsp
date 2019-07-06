<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Student Profile Page</title>
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
                var student = ${singleStd};
                console.log(student);

                angular.module('myApp', []).controller('studentProfileCtrl',
                        function ($scope) {
                            $scope.sStd = student;

                            console.log($scope.sStd);
                        });
        </script>
        <!-- endinject -->

    </head>
    <body ng-app="myApp" ng-controller="studentProfileCtrl">
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
                                        <center><span class="card title-text"><h2 class="text-success" style="margin-top: 10px;">Student Profile Information</h2></span></center>
                                    </div>
                                <div class="col-md-4  grid-margin">
                                    <div class="card">
                                        <div class="card-body">
                                            <p class="card-title">Student Profile of: <span class="text-primary">{{sStd.stname}}</p>
                                            <div class="card">
                                                <center><img class="img-responsive" style="width:275px ;height:290px;border-radius: 0; boder:none;" src="resources/stimage/{{sStd.stid}}.jpg" /></center>
                                            </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8  grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title">Student Profile of : <span class="text-primary">{{sStd.stname}}</span></p>
                                        <div class="text-gray">
                                            <label class="card-title">Name: </label> {{sStd.stname}}
                                            <br>
                                            <label class="card-title">Father Name:</label> {{sStd.stfathername}} 
                                            <br>
                                            <label class="card-title">Mother Name:</label> {{sStd.stmothername}} 
                                            <br>
                                            <label class="card-title">Present Address:</label> {{sStd.presentaddress}} 
                                            <br>
                                            <lable class="card-title">Parmanent Address:</lable> {{sStd.parmanentaddress}}
                                            <br><br>
                                            <label class="card-title">Age:</label> {{sStd.stage}}  
                                            <br>
                                            <label class="card-title">Gender:</label> {{sStd.stgender}}
                                            <br>
                                            <lable class="card-title">Date of Birth:</lable> {{sStd.stdob}}
                                            <br><br>
                                            <label class="card-title">Phone:</label> {{sStd.stcontact}}
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

