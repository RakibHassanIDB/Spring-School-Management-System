<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Academic year</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <style>
                th{
                    text-align: center;
                }
            </style>
            <!--Custom Javascript-->
            <script>
                var academic = ${academicyearmodelobject};
                console.log(academic);
                angular.module('myApp', []).controller('academicCtrl',
                        function ($scope) {
                            $scope.academicList = academic;
                        });
        </script>
        <!-- endinject -->

    </head>
    <body ng-app="myApp" ng-controller="academicCtrl">
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
                                <div class="col-md-6  grid-margin">
                                    <!-- left column -->
                                    <div class="card">
                                        <div class="card-body">
                                            <p class="card-title">Add / Edit Academic year</p>
                                            <br>
                                        <c:if test="${check}">
                                            <form:form name="addAcademicyearobject"
                                                       modelAttribute="addAcademicyearObject1" action="addingacademicyear"
                                                       method="post">
                                                <div class="form-group input-field col s6">
                                                    <form:input id="name" class="form-control"
                                                                Placeholder="Academic year" type="text" path="accyear"  required="true"></form:input>

                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                    <form:input class="form-control" style="display:none"
                                                                Placeholder="Status" type="text" path="status" required="true"></form:input>
                                                    </div>

                                                <form:button id="editbuttons" type="submit" name="addacademicyear"
                                                             class="btn btn-primary">Add Academicyear</form:button>
                                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                    Details</form:button>

                                            </form:form>
                                        </c:if>

                                        <c:if test="${!check}">
                                            <form:form name="addAcademicyearobject"
                                                       modelAttribute="addAcademicyearObject1" action="addingacademicyear"
                                                       method="post">
                                                <div class="form-group input-field col s6">
                                                    <form:input id="id" class="form-control" style="display:none"
                                                                Placeholder="Year ID" type="text" path="yearid" readonly="true"></form:input>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:input id="name" class="form-control"
                                                                Placeholder="Academic year" type="text" path="accyear"  required="true"></form:input>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                    <form:input class="form-control" style="display:none"
                                                                Placeholder="Status" type="text" path="status" required="true"></form:input>
                                                    </div>

                                                <form:button id="editbuttons" type="submit" name="Editacademicyear"
                                                             class="btn btn-warning">Edit Academicyear</form:button>
                                                <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                    Details</form:button>
                                            </form:form>
                                        </c:if>        
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6  grid-margin">
                                <!-- right column -->
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title">Academic year List</p>
                                        <div class="table-responsive">
                                            <table class="table table-dark table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Aca. Year</th>
                                                        <th>Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="x in academicList| filter:test">
                                                        <td>{{x.yearid}}</td>
                                                        <td>{{x.accyear}}</td>
                                                        <td>{{x.status}}</td>
                                                        <td>
                                                            <a href="editacademicyearbutton?getYearid={{x.yearid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> 
                                                            <a href="removesubject/{{x.yearid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a>
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

