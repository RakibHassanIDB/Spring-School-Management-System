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
                var subjects = ${subList};
                var exam = ${einfoList};
                var cartmarkslist =${itemsincart}
                angular.module('myApp', []).controller('ExamMarkCtrl',
                        function ($scope) {
                            $scope.sList = subjects;
                            $scope.exList = exam;
                            $scope.citems = cartmarkslist;
                        });
        </script>

        <style>
            th{
                padding: 10px 5px;
            }
            tr{
                height: 20px;
            }
        </style>


    </head>
    <body ng-app="myApp" ng-controller="ExamMarkCtrl">

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
                                    <center><span class="card title-text"><h2 class="text-success" style="margin-top: 10px;">Student Exam Marks  Information</h2></span></center>
                                </div>
                                <div class="col-md-4  grid-margin">
                                    <div class="card">
                                        <div class="card-body">
                                            <p class="card-title">Exam Marks of : <span class="text-primary">${sessionScope.studentinfo.stname}</p>
                                        <div class="card">
                                            <center><img class="img-responsive" style="width:190px ;height:205px;border-radius: 0; boder:none;" src="resources/stimage/${sessionScope.regstudentlist.stid}.jpg" /></center>
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
                                        </div>                                        
                                    </div>
                                </div>
                            </div>







                            <!--marks add div-->
                            <div class="col-12 grid-margin float-right stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Add Subject Marks</h4>
                                        <form:form class="form-inline" commandName="MarkObject" action="addmarks2cart"
                                                   enctype="multipart/form-data">

                                            <div class="input-group mb-2 mr-sm-2">
                                                <select class="form-control" ng-model="subject" ng-options="x.subjectname for x in sList">
                                                    <option value="">-- choose  Subject name--</option>
                                                </select>
                                                <form:hidden  class="form-control" value="{{subject.subjectid}}" path="subjectid"></form:hidden>

                                                </div>


                                                <div class="input-group mb-2 mr-sm-2">
                                                <form:input class="form-control" Placeholder="Mark Obtain"
                                                            type="text" path="markobtain"  required="true"></form:input>

                                                </div>
                                                <div class="input-group mb-2 mr-sm-2">
                                                <form:input class="form-control" Placeholder="Mark Grade"
                                                            type="text" path="markgrade"  required="true"></form:input>

                                                </div>
                                                <div class="input-group mb-2 mr-sm-2">
                                                <c:if test="${check}">
                                                    <div class="reset-button">
                                                        <form:button id="editbuttons" type="submit" name="Add"
                                                                     class="btn btn-outline-primary" style="margin-left:15px;"><i class="fas fa-plus-circle" style="font-size:18px;"></i></form:button>
                                                        </div>
                                                </c:if>
                                            </div>

                                        </form:form>
                                    </div>
                                </div>
                            </div>

                            <div class="row col-md-12">
                                <div class="col-md-8">
                                    <div class="card">
                                        <div class="card-body">
                                            <h2 class="title-text text-primary" style="font-size: 25px;"><center>Selected Exam Marks</center></h2>
                                            <div class="table-responsive">
                                                <c:if test="${cartempty}">
                                                    <div class="jumbotron container h4 animated fadeInDown delay-05s" id="jumbotrondiv" align="center">
                                                        There are No Exam Mark selected yet<br>


                                                    </div>
                                                </c:if>
                                                <c:if test="${!cartempty}">
                                                    <table class="table" align="center">
                                                        <thead style="text-align:center;">
                                                            <tr scope="row">
                                                                <th>Subject Id</th>
                                                                <th>Marks Obtain</th>
                                                                <th>Marks Grade</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody ng-repeat="items in citems">
                                                            <tr scope="row" style="text-align: center;padding:10px;">

                                                                <td>{{items.subjectid}}</td>
                                                                <td>{{items.markobtain}}</td>
                                                                <td>{{items.markgrade}}</td>
                                                                <td><a href="deletemarkfromcart?getsubjectid={{items.subjectid}}"
                                                                       id="removebtn" class="btn btn-outline-danger"> <i class="fas fa-trash"></i>
                                                                    </a></td>
                                                            </tr>
                                                        </tbody>



                                                    </table>

                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--save marks list-->

                            <div class="col-md-12  grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title"><span class="text-primary">Select Exam Name</span></p>
                                        <form:form class="form-inline" commandName="MarkObject" action="marksadd" enctype="multipart/form-data">
                                            <div class="text-gray">
                                                <form:hidden  class="form-control" value="${sessionScope.academic.yearid}" path="yearid"></form:hidden>
                                                <form:hidden  class="form-control" value="${sessionScope.section.secid}" path="secid"></form:hidden>
                                                <form:hidden  class="form-control" value="${sessionScope.group.groupid}" path="groupid"></form:hidden>
                                                <form:hidden  class="form-control" value="${sessionScope.studentinfo.stid}" path="stid"></form:hidden>
                                                <form:hidden  class="form-control" value="${sessionScope.classnm.classid}" path="classid"></form:hidden>
                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="selectedExam" ng-options="x.examtitle for x in exList" required="true">
                                                            <option value="">--Exam Name--</option>
                                                        </select>

                                                    </div>
                                                <form:hidden  class="form-control" value="{{selectedExam.examid}}" path="examid"></form:hidden>
                                                </div>

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

                                        </form:form>
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
