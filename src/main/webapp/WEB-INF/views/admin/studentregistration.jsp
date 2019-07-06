
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Registration Page</title>
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var streglist = ${streglists};
                var classlist = ${classlists};
                var classseclist = ${classseclists};
                var stgrouplist = ${stgrouplists};
                var stinfolist = ${stinfolists};
                var yearlist = ${yearlists};
                angular.module('myapp', []).controller('regController',
                        function ($scope) {
                            $scope.streglists = streglist;
                            $scope.classlists = classlist;
                            $scope.classseclists = classseclist;
                            $scope.stgrouplists = stgrouplist;
                            $scope.stinfolists = stinfolist;

                            $scope.yearlists = yearlist;


                            console.log($scope.classlist);
                        });
        </script>


    </head>
    <body ng-app="myapp" ng-controller="regController">
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
                                        <div class="card">
                                            <center><span class="card title-text"><h4>Student Registration</h4></span></center>
                                            <div class="box">

                                            <c:if test="${check}">
                                                <form:form commandName="stregistrationObject" action="registrationpage"
                                                           enctype="multipart/form-data">

                                                    <div class="form-group input-field col s6">
                                                        <form:input class="form-control" Placeholder="Registration NO" style="display:none"
                                                                    type="text" path="regid" readonly="true" required="true"></form:input>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="stuid" ng-options="x.stid as x.stid for x in stinfolists" required="true" >
                                                                <option value=""> choose Student Id</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{stuid}}" path="stid"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="yid" ng-options="x.yearid as x.accyear for x in yearlists" >
                                                                <option value="">-- choose an Academic year --</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{yid}}" path="yearid"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="cid" ng-options="x.classid as x.classname for x in classlists" required="true" >
                                                                <option value="">-- choose Class name --</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{cid}}" path="classid"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="stgroup" ng-options="x.groupid as x.groupname for x in stgrouplists"  >
                                                                <option value="">-- choose  Group name--</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{stgroup}}" path="groupid"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="sec" ng-options="x.secid as x.secname for x in classseclists"  >
                                                                <option value="">-- choose Section name --</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{sec}}" path="secid"></form:hidden>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control" Placeholder="Registration Date"
                                                                    type="text" path="regdate" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control" Placeholder="Roll No"
                                                                    type="text" path="stroll" required="true"></form:input>
                                                        </div>
                                                    <form:button type="submit" class="btn btn-primary" id="editbuttons" name="Add">Register Student</form:button>
                                                    <form:button type="reset" class="btn btn-danger" id="removebuttons">Reset Details</form:button>
                                                </form:form>
                                            </c:if>
                                            <c:if test="${!check}">
                                                <form:form commandName="stregistrationObject" action="registrationpage"
                                                           enctype="multipart/form-data">

                                                    <div class="form-group input-field col s6">
                                                        <form:input class="form-control" Placeholder="Registration NO" style="display:none"
                                                                    type="text" path="regid" readonly="true" required="true"></form:input>
                                                        </div>


                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="stuid" ng-options="x.stid as x.stid for x in stinfolists" required="true" >
                                                                <option value=""> choose Student Id</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{stuid}}" path="stid"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="yid" ng-options="x.yearid as x.academicYear for x in yearlists" >
                                                                <option value="">-- choose an Academic year --</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{yid}}" path="yearid"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="cid" ng-options="x.classid as x.classname for x in classlists" required="true" >
                                                                <option value="">-- choose Class name --</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{cid}}" path="classid"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="stgroup" ng-options="x.groupid as x.groupname for x in stgrouplists"  >
                                                                <option value="">-- choose  Group name--</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{stgroup}}" path="groupid"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="sec" ng-options="x.secid as x.secname for x in classseclists"  >
                                                                <option value="">-- choose Section name --</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{sec}}" path="secid"></form:hidden>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control" Placeholder="Registration Date"
                                                                    type="text" path="regdate" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:input class="form-control" Placeholder="Roll No"
                                                                    type="text" path="stroll" required="true"></form:input>
                                                        </div>
                                                    <form:button id="editbuttons" type="submit" class="btn btn-warning " name="Edit">Edit </form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger ">Reset Details</form:button>
                                                    <a href="showregistrationpage"><form:button id="show" type="button" class="btn btn-info">Cancel</form:button></a>
                                                </form:form>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="card mb-3" >
                                        <div class="card-header">
                                            <i class="fas fa-table"></i>
                                            Registared Student List</div>
                                        <div class="form-group input-field col s12">
                                                <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                            </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-dark table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <th>Registration NO</th>
                                                            <th>Student Id</th>
                                                            <th> Academic year id</th>
                                                            <th>Class id</th>
                                                            <th>Group id</th>
                                                            <th>Section id</th>
                                                            <th>Registration Date</th>
                                                            <th>Student Roll no</th>                                        
                                                            <th>Manage </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr ng-repeat="rg in streglists | filter:test">
                                                            <td>{{rg.regid}}</td>
                                                            <td>{{rg.stid}}</td>
                                                            <td>{{rg.yearid}}</td>
                                                            <td>{{rg.classid}}</td>
                                                            <td>{{rg.groupid}}</td>
                                                            <td>{{rg.secid}}</td>
                                                            <td>{{rg.regdate}}</td>
                                                            <td>{{rg.stroll}}</td>
                                                            <td><a href="editingreg?getregid={{rg.regid}}"><button id="editbuttons" type="submit" class="btn btn-outline-primary"><i class="far fa-edit"></i></button></a> <a href="removingreg/{{rg.regid}}"><button  id="removebuttons" type="button" class="btn btn-outline-danger"><i class="fas fa-trash"></i></button></a>
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
                                                                        var date_input = $('input[name="regdate"]'); //our date input has the name "date"
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
