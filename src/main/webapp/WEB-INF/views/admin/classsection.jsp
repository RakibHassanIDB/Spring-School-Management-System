
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class Section</title>
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>

            <script>
            var sectionlist = ${sectionlist};
            var ClassServicelist = ${ClassServicelist};


            angular.module('organocartpackage', []).controller('ProductController',
                    function ($scope) {
                        $scope.sectionlist = sectionlist;
                        $scope.ClassServicelist = ClassServicelist;

                        console.log($scope.sectionlist);
                    });
        </script>
    </head>
    <body ng-app="organocartpackage" ng-controller="ProductController">
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
                                    <div>

                                        <div class="card panel animated fadeInDown delay-05s" id="panel-1">
                                            <div class="panel-heading">
                                                <center><span class="card title-text"><h4>Add Secttion</h4></span></center>
                                            </div>
                                            <!-- end panel heading -->
                                            <div class="panel-body">
                                                <div class="formcontainer ">

                                                <form:form commandName="newClasssectionObject" action="sectionadd"
                                                           enctype="multipart/form-data">

                                                    <c:if test="${!check}">
                                                        <div class="form-group input-field">
                                                            <form:input class="form-control" Placeholder="sec Id" style="display:none"
                                                                        type="text" path="secid" readonly="true" required="true"></form:input>
                                                            </div>
                                                    </c:if>

                                                    <div class="form-group input-field">
                                                        <select class="form-control" ng-model="classid" ng-options="x.classid as x.classname for x in ClassServicelist" required="true">
                                                            <option value="">-- Select Class --</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field">
                                                        <form:hidden  class="form-control" value="{{classid}}" path="classid"></form:hidden>
                                                        </div>

                                                        <div class="form-group input-field">
                                                        <form:input class="form-control" Placeholder="sec Name" type="text" path="secname" required="true"></form:input>
                                                        </div>





                                                        <!--                            <input class="form-control" id="date" name="date" placeholder="MM/DD/YYY" type="text"/>-->

                                                    <c:if test="${check}">
                                                        <form:button id="editbuttons" type="submit" name="Add" class="btn btn-primary">Add
                                                            Details</form:button>
                                                        <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                            Details</form:button>
                                                    </c:if>
                                                    <c:if test="${!check}">
                                                        <form:button id="editbuttons" type="submit" name="Edit" class="btn btn-warning">Edit
                                                            Details</form:button>
                                                        <form:button id="removebuttons" type="reset" class="btn btn-danger">Reset
                                                            Details</form:button>
                                                    </c:if>
                                                    <a href="showsectionpage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>        
                                                </form:form>
                                            </div>
                                            <!-- panel body end -->
                                        </div>
                                    </div>
                                    <!-- panel end -->
                                    <div class="panel animated fadeInUp delay-05s" id="panel-2">
                                        <div class="panel-heading">
                                            <center><span class="card title-text"><h4>List Section</h4></span></center>   
                                        </div>
                                        <p><input type="text" ng-model="test" class="form-control" placeholder="Search"></p>
                                        <!-- end panel2 heading -->
                                        <div class="table-responsive panel-body">

                                            <table class="table table-striped table-dark">
                                                <thead>
                                                    <tr>
                                                        <th>Section Id:</th>
                                                        <th>Class Id</th>
                                                        <th>Section Name</th>
                                                        <th>Section Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="p in sectionlist| filter:test">
                                                        <td>{{p.secid}}</td>
                                                        <td>{{p.classid}}</td>
                                                        <td>{{p.secname}}</td>
                                                        <td>{{p.secstatus}}</td>
                                                        <td>
                                                            <a href="editingproduct?getpid={{p.secid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> 
                                                            <a href="removingproduct/{{p.secid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- panel2 body end -->
                                    </div>
                                    <!-- panel2 end -->
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
