<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Student Page</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var accyear = ${acList};
                var classlist = ${clList};
                var section = ${secList};
                var search = ${s};
                angular.module('myApp', []).controller('searchCtrl',
                        function ($scope) {
                            $scope.ayList = accyear;
                            $scope.cList = classlist;
                            $scope.scList = section;
                            $scope.searchList = search;
                            console.log($scope.searchList);
                        });
        </script>
        <style>
            th,td{
                text-align: center;
            }
        </style>

    </head>
    <body ng-app="myApp" ng-controller="searchCtrl">

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
                                    <center><span class="card title-text"><h2 class="text-success" style="margin-top: 10px;">Search Student</h2></span></center>
                                </div>

                                <!--search div-->


                                <div class="col-12 grid-margin float-right stretch-card" style="margin-bottom: 5px;">
                                    <div class="card">
                                        <div class="card-body">
                                            <form action="searchstudent" class="form-inline">

                                                <div class="input-group mb-2 mr-sm-4">
                                                    <select class="form-control" style="width:220px;" ng-model="year" ng-options="x.accyear for x in ayList">
                                                        <option value="">-- choose  Academic Year --</option>
                                                    </select>
                                                    <input type="hidden" value="{{year.yearid}}" name="yearid">

                                                </div>


                                                <div class="input-group mb-2 mr-sm-4">
                                                    <select class="form-control" ng-model="cls" ng-options="x.classname for x in cList">
                                                        <option value="">-- choose  Class--</option>
                                                    </select>

                                                    <input type="hidden" class="form-control" value="{{cls.classid}}" name="classid">

                                                </div>
                                                <div class="input-group mb-2 mr-sm-4">
                                                    <select class="form-control" ng-model="section" ng-options="x.secname for x in scList">
                                                        <option value="">-- choose  Section --</option>
                                                    </select>

                                                    <input type="hidden" class="form-control" value="{{section.secid}}" name="secid">

                                                </div>
                                                <div class="input-group mb-2 mr-sm-4">
                                                    <div class="reset-button">
                                                        <button type="submit" value="Search"
                                                                class="btn btn-outline-primary" style="margin-left:15px;padding: 15px 40px;"><i class="fas fa-search" style="font-size:20px;"></i></button>
                                                    </div>

                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>


                                <!--Search Result-->
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h2 class="title-text text-primary" style="font-size: 25px;"><center>Students List</center></h2>
                                                
                                                    <input type="text" ng-model="test" class="form-control" style="background-color: #f1f8e9; margin-bottom: 10px;" placeholder="Search Student.......">


                                                <div class="table-responsive">
                                                <c:if test="${check}">
                                                    <table id="recent-purchases-listing" class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>St. Photo</th>
                                                                <th>St. Id</th>
                                                                <th>St.roll</th>
                                                                <th>Registration Date</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr ng-repeat="st in searchList | filter:test">
                                                                <td><img class="img-responsive" style="width:75px ;height:80px;border-radius: 0;" src="resources/stimage/{{st.stid}}.jpg" /></td>
                                                                <td>{{st.stid}}</td>
                                                                <td>{{st.stroll}}</td>
                                                                <td>{{st.regdate}}</td>
                                                                <td><a href="studentprofilelink?getsid={{st.stid}}"><button id="editbuttons" type="submit" class="btn btn-outline-info" style="padding:10px 20px;"><i class="far fa-user" style="font-size: 22px"></i></button></a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </c:if>
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

