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
                var exammark = ${exammarksgson};
                var markdetail = ${markdetailgson};

                angular.module('myapp', []).controller('SuccessController',
                        function ($scope) {

                            $scope.markList = exammark;
                            $scope.mdList = markdetail;

                        });
        </script>

    </head>
    <body>
        <div class="col-md-12">
            <center><span class="card title-text"><h2 class="text-success" style="margin-top: 10px;">Student Marksheet</h2></span></center>
        </div>
        <div class="row">
            <div class="col-md-4  grid-margin">
                <div class="card">
                    <div class="card-body">
                        <p class="card-title">Exam Marks of : <span class="text-primary">${sessionScope.studentinfo.stname}</p>
                        <div class="card">
                            <center><img class="img-responsive" style="width:50px ;height:60px;border-radius: 0; boder:none;" src="resources/stimage/${sessionScope.regstudentlist.stid}.jpg" /></center>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8  grid-margin">
                <div class="card">
                    <div class="card-body">
                        <p class="card-title">Exam Marks of : <span class="text-primary">${sessionScope.studentinfo.stname}</span></p>
                        <div class="text-gray">
                            <label class="card-title">Name: </label> ${sessionScope.studentinfo.stname}
                            <br>
                            <label class="card-title">Class Name: </label> ${sessionScope.classnm.classname} 
                            <br>
                            <label class="card-title">Academic Year: </label> ${sessionScope.academic.accyear}
                            <br>
                            <label class="card-title">Section Name: </label> ${sessionScope.section.secname}
                            <br>
                            <label class="card-title">Group Name: </label> ${sessionScope.group.groupname}
                            <br>
                        </div>                                        
                    </div>
                </div>
            </div>
        </div>

        <div class="row col-md-12" ng-app="myapp" ng-controller="SuccessController">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h2 class="title-text text-primary" style="font-size: 25px;"><center>Student Exam Marks</center></h2>
                        <div class="table-responsive">
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <p class="text-black">
            <a href="reportMarksheet" class="btn btn-sm btn-outline-secondary form-inline" target="_blank">Print Marks Sheet</a>
            <br>
            <br><a href="${pageContext.request.contextPath}/studentmarksaddpage" class="btn btn-sm btn-outline-secondary">Add Mark</a>
        </p>

    </body>
</html>
