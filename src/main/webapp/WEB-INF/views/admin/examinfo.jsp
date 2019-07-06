
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Information Page</title>
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var examinfo = ${examinfomodelobject};
                console.log(examinfo);
                angular.module('myApp', []).controller('examinfoCtrl',
                        function ($scope) {
                            $scope.examinfoList = examinfo;
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
                                    <div ng-controller="examinfoCtrl">
                                        <div class="card">
                                            <center><span class="card title-text"><h4>Add Exam information</h4></span></center>
                                            <div class="box">
                                            <c:if test="${check}">
                                                <form:form name="addExaminfoobject"
                                                           modelAttribute="addExaminfoObject1" action="addingexaminfo"
                                                           method="post">
                                                    <div class="form-group input-field col s6">
                                                        <form:input id="name" class="form-control"
                                                                    Placeholder="Exam Date" type="text" path="examdate"  required="true"></form:input>

                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Exam Title" type="text" path="examtitle" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Exam Description" type="text" path="examdesc" required="true"></form:input>
                                                        </div>

                                                    <form:button id="editbuttons" type="submit" name="addexaminfo"
                                                                 class="btn btn-primary">Add Exam</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                        Details</form:button>

                                                </form:form>
                                            </c:if>

                                            <c:if test="${!check}">
                                                <form:form name="addExaminfoobject"
                                                           modelAttribute="addExaminfoObject1" action="addingexaminfo"
                                                           method="post">
                                                    <div class="form-group input-field col s6">
                                                        <form:input id="id" class="form-control" style="display:none"
                                                                    Placeholder="Exam ID" type="text" path="examid" readonly="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:input id="name" class="form-control"
                                                                    Placeholder="Exam Date" type="text" path="examdate"  required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Exam Title" type="text" path="examtitle" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Exam Description" type="text" path="examdesc" required="true"></form:input>
                                                        </div>
                                                    <form:button id="editbuttons" type="submit" name="Editexaminfo"
                                                                 class="btn btn-warning">Edit Exam</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                        Details</form:button>
                                                </form:form>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="card table-card">
                                        <center><span class="card title-text"><h4>Exam List</h4></span></center>
                                        <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-dark">
                                                <thead>
                                                    <tr>
                                                        <th>Exam ID</th>
                                                        <th>Exam Date</th>
                                                        <th>Exam Title</th>
                                                        <th>Exam Description</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="x in examinfoList| filter:test">
                                                        <td>{{x.examid}}</td>
                                                        <td>{{x.examdate}}</td>
                                                        <td>{{x.examtitle}}</td>
                                                        <td>{{x.examdesc}}</td>
                                                        <td>
                                                            <a href="editexaminfobutton?getExamid={{x.examid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> 
                                                            <a href="removeexaminfo/{{x.examid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a>
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

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

        <script>
                                                                $(document).ready(function () {
                                                                    var date_input = $('input[name="examdate"]'); //our date input has the name "date"
                                                                    var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                                                                    date_input.datepicker({
                                                                        format: 'dd-mm-yyyy',
                                                                        container: container,
                                                                        todayHighlight: true,
                                                                        autoclose: true,
                                                                    })
                                                                })
        </script>

    </body>
</html>
