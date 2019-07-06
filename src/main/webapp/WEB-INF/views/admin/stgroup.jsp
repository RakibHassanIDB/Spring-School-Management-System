
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Group Page</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var stgroup = ${stgroupmodelobject};
                console.log(stgroup);
                angular.module('myApp', []).controller('stgroupCtrl',
                        function ($scope) {
                            $scope.stgroupList = stgroup;
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
                                    <div ng-controller="stgroupCtrl">
                                        <div class="card">
                                            <center><span class="card title-text"><h4>Add Student Group</h4></span></center>
                                            <div class="box">
                                            <c:if test="${check}">
                                                <form:form name="addStgroupobject"
                                                           modelAttribute="addStgroupObject1" action="addingstgroup"
                                                           method="post">
                                                    <div class="form-group input-field col s6">
                                                        <form:input id="name" class="form-control"
                                                                    Placeholder="Group Name" type="text" path="groupname"  required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Status" type="text" path="status" required="true"></form:input>
                                                        </div>

                                                    <form:button id="editbuttons" type="submit" name="addstgroup"
                                                                 class="btn btn-primary">Add Studentgroup</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                        Details</form:button>

                                                </form:form>
                                            </c:if>

                                            <c:if test="${!check}">
                                                <form:form name="addStgroupobject"
                                                           modelAttribute="addStgroupObject1" action="addingstgroup"
                                                           method="post">
                                                    <div class="form-group input-field col s6">
                                                        <form:input id="id" class="form-control" style="display:none"
                                                                    Placeholder="Group ID" type="text" path="groupid" readonly="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:input id="name" class="form-control"
                                                                    Placeholder="Group Name" type="text" path="groupname"  required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control"
                                                                    Placeholder="Status" type="text" path="status" required="true"></form:input>
                                                        </div>

                                                    <form:button id="editbuttons" type="submit" name="Editstgroup"
                                                                 class="btn btn-warning">Edit Academicyear</form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                        Details</form:button>
                                                </form:form>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="card table-card">
                                        <center><span class="card title-text"><h4>Student Group List</h4></span></center>
                                        <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-dark">
                                                <thead>
                                                    <tr>
                                                        <th>Group ID</th>
                                                        <th>Group Name</th>
                                                        <th>Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="x in stgroupList| filter:test">
                                                        <td>{{x.groupid}}</td>
                                                        <td>{{x.groupname}}</td>
                                                        <td>{{x.status}}</td>
                                                        <td>
                                                            <a href="editstgroupbutton?getgroupid={{x.groupid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> 
                                                            <a href="removestgroup/{{x.groupid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a>
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
