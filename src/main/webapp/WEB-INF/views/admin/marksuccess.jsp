<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Marks Page</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var exammark = ${exammarksgson};
                var markdetail = ${markdetailgson};

                angular.module('myapp', []).controller('SuccessController',
                        function ($scope) {

                            $scope.markList = exammark;
                            $scope.mdList = markdetail;

                        });
        </script>
    </head>
    <body ng-app="myapp" ng-controller="SuccessController">

        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center auth px-0">
                    <div class="row w-100 mx-0">
                        <div class="col-lg-4 mx-auto">
                            <div class="auth-form-light text-left py-5 px-4 px-sm-5 text-center">
                                <h5>Student Marks Added Successfully</h5>
                                <div class="brand-logo">
                                    <img class="img-responsive" style="width:50px ;height:60px;border-radius: 0; boder:none;" src="resources/stimage/${sessionScope.regstudentlist.stid}.jpg" alt="Student Photo">
                                </div>

                                <br>
                                <table class="table table-sm table-striped text-left">
                                    <tbody>
                                        <tr>
                                            <td>Name :</td> <td>${sessionScope.studentinfo.stname}</td>
                                        </tr>
                                        <tr>
                                            <td>Class Name :</td> <td>${sessionScope.classnm.classname}</td>
                                        </tr>
                                        <tr>
                                            <td>Academic Year :</td> <td>${sessionScope.academic.accyear}</td>
                                        </tr>
                                        <tr>
                                            <td>Section Name :</td> <td><span class="text-success">${sessionScope.section.secname}</span></td>
                                        </tr>
                                        <tr>
                                            <td>Group Name :</td> <td><span class="text-success">${sessionScope.group.groupname}</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br><br>
                                <table class="table table-dark,table-striped" style="width: 100%;" align="center">
                                    <thead style="text-align:center;">
                                        <tr scope="row">
                                            <th>Subject Id</th>
                                            <th>Marks Obtain</th>
                                            <th>Marks Grade</th>
                                        </tr>
                                    </thead>

                                    <tbody ng-repeat="items in mdList">
                                        <tr scope="row" style="text-align: center;padding:10px;">

                                            <td>{{items.subjectid}}</td>
                                            <td>{{items.markobtain}}</td>
                                            <td>{{items.markgrade}}</td>
                                        </tr>
                                    </tbody>



                                </table>
                                <br><br>
                                <p class="text-black">
                                    <a href="reportMarksheet" class="btn btn-block btn-primary btn-md font-weight-medium auth-form-btn" target="_blank">Print Marksheet</a>
                                    <br> or <br>
                                    <br><a href="${pageContext.request.contextPath}/studentmarksaddpage" class="btn btn-sm btn-outline-secondary">Add Another Marksheet</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>


        <jsp:include page="/WEB-INF/views/partial/jsinclude.jsp"></jsp:include>

    </body>
</html>