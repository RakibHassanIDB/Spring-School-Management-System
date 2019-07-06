<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher Information Page</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var teacherlist = ${teacherlist};
                var sublist = ${sublist};
                angular.module('myapp', []).controller('teacherController',
                        function ($scope) {
                            $scope.teachers = teacherlist;
                            $scope.subject = sublist;
                            console.log($scope.subject);
                        });
        </script>

    </head>
    <body ng-app="myapp" ng-controller="teacherController">
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
                                            <center><span class="card title-text"><h4>Add Teacher</h4></span></center>
                                            <div class="box">
                                            <c:if test="${check}">
                                                <form:form commandName="newTeacherObject" action="teacheradd" enctype="multipart/form-data">


                                                    <div class="form-group input-field col s6">

                                                        <form:input class="form-control" Placeholder="Teacher Name"
                                                                    type="text" path="tname" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                            <select class="form-control" ng-model="subjectid" ng-options="x.subjectid as x.subjectname for x in subject" required="true">
                                                                <option value="">-- choose a Subject --</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{subjectid}}" path="subjectid"></form:hidden>
                                                        </div>

                                                        <div class="form-group input-field col s6">

                                                        <form:input type="text" class="form-control"
                                                                    Placeholder="Address" path="taddress" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input type="text" class="form-control"
                                                                    placeholder="Email" path="temail" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input type="text" class="form-control"
                                                                    placeholder="Contact No" path="tcontact" required="true"></form:input>
                                                        </div>



                                                        <div class="form-group input-field col s6">

                                                        <form:input type="text" class="form-control"  path="tjoindate" placeholder="Joining Date" required="true" id="date" ></form:input>

                                                        </div>

                                                        <div class="form-group input-field col s6">

                                                            <select class="form-control" ng-model="gen" required="true">
                                                                <option value="">--Select Gender --</option>

                                                                <option value="Male"> Male</option>
                                                                <option value="Female"> Female</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{gen}}" path="tgender"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                            <select class="form-control" ng-model="sta" required="true">
                                                                <option value="">--Select Status --</option>
                                                                <option value="Assisten Teacher Part Time"> Part Time Teacher</option>
                                                                <option value="Assisten Teacher full Time"> Permanent Teacher</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{sta}}" path="tstatus"></form:hidden>
                                                        </div>



                                                        <div class="form-group input-field col s6">

                                                        <form:input type="file" name="fileToUpload" id="fileToUpload"
                                                                    path="timage" required="true"></form:input>
                                                        </div>
                                                    <form:button type="submit" class="btn btn-primary" id="editbuttons" name="Add">Submit</form:button>
                                                    <form:button type="reset" class="btn btn-danger" id="removebuttons">Reset Details</form:button>
                                                </form:form>
                                            </c:if>
                                            <c:if test="${!check}">
                                                <form:form commandName="newTeacherObject" action="teacheradd"
                                                           enctype="multipart/form-data">


                                                    <div class="form-group input-field col s6">

                                                        <form:input class="form-control" Placeholder="Teacher Id" style="display:none"
                                                                    type="text" path="tid" required="true"></form:input>
                                                        </div>


                                                        <div class="form-group input-field col s6">


                                                        <form:input class="form-control" Placeholder="Teacher Name"
                                                                    type="text" path="tname" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                            <select class="form-control" ng-model="subjectid" ng-options="x.subjectid as x.subjectname for x in subject" required="true">
                                                                <option value="">-- choose a Subject --</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:hidden  class="form-control" value="{{subjectid}}" path="subjectid"></form:hidden>
                                                        </div>

                                                        <div class="form-group input-field col s6">

                                                        <form:input type="text" class="form-control"
                                                                    Placeholder="Address" path="taddress" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input type="text" class="form-control"
                                                                    placeholder="Email" path="temail" required="true"></form:input>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                        <form:input type="text" class="form-control"
                                                                    placeholder="Contact No" path="tcontact" required="true"></form:input>
                                                        </div>



                                                        <div class="form-group input-field col s6">
                                                        <form:input type="text" class="form-control"  path="tjoindate" placeholder="Joining Date" required="true" id="date" ></form:input>

                                                        </div>

                                                        <div class="form-group input-field col s6">

                                                            <select class="form-control" ng-model="gen" required="true">
                                                                <option value="">--Select Gender --</option>
                                                                <option value="Male"> Male</option>
                                                                <option value="Female"> Female</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{gen}}" path="tgender"></form:hidden>
                                                        </div>
                                                        <div class="form-group input-field col s6">

                                                            <select class="form-control" ng-model="sta" required="true">
                                                                <option value="">--Select Status --</option>
                                                                <option value=" Part Time"> Part Time Teacher</option>
                                                                <option value=" full Time"> Permanent Teacher</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group input-field col s6">
                                                        <form:hidden  class="form-control" value="{{sta}}" path="tstatus"></form:hidden>
                                                        </div>



                                                        <div class="form-group input-field col s6">

                                                        <form:input type="file" name="fileToUpload" id="fileToUpload"
                                                                    path="timage" required="true"></form:input>
                                                        </div>
                                                    <form:button id="editbuttons" type="submit" class="btn btn-warning " name="Edit">Edit </form:button>
                                                    <form:button id="removebuttons" type="reset" class="btn btn-danger ">Reset Details</form:button>
                                                </form:form>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="card mb-3">
                                        <div class="card-header">
                                            <i class="fas fa-table"></i>
                                            Teacher List</div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-dark table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <th>Photo</th>
                                                            <th>Id</th>
                                                            <th>Name</th>
                                                            <th>Subject</th>
                                                            <th>Address</th>
                                                            <th>Email</th>
                                                            <th>Contact</th>
                                                            <th>Joining Date</th>
                                                            <th>Gender</th>
                                                            <th>Status</th>
                                                            <th>Manage </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr  ng-repeat="teacher in teachers">
                                                            <td><img class="img-responsive" style="width:75px ;height:90px;border-radius: 0;"  src="resources/timage/{{teacher.tid}}.jpg" /></td>
                                                            <td>{{teacher.tid}}</td>
                                                            <td>{{teacher.tname}}</td>
                                                            <td>{{teacher.subjectid}}</td>
                                                            <td>{{teacher.taddress}}</td>
                                                            <td>{{teacher.temail}}</td>
                                                            <td>{{teacher.tcontact}}</td>
                                                            <td>{{teacher.tjoindate}}</td>
                                                            <td>{{teacher.tgender}}</td>
                                                            <td>{{teacher.tstatus}}</td>
                                                            <td><a href="editingteacher?gettid={{teacher.tid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> <a  href="removingteacher/{{teacher.tid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a><a href="teacherprofilelink?gettid={{teacher.tid}}"><button id="editbuttons" type="submit" class="btn btn-info"><i class="far fa-user"></i></button></a>
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
                                                                            var date_input = $('input[name="tjoindate"]'); //our date input has the name "date"
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
