<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Marks Add</title>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> 
        <style>
            th,td{
                text-align: center;
                padding: 10px;
            }
        </style>
        <script>
            var subjects = ${subList};
            var cartmarkslist =${itemsincart}
            angular.module('myApp', []).controller('ExamMarkCtrl',
                    function ($scope) {
                        $scope.sList = subjects;
                        $scope.citems = cartmarkslist;
                    });
        </script>
    </head>
    <body ng-app="myApp" ng-controller="ExamMarkCtrl">
        <h1 class="card-title" style="text-align:center;">Add Student Marks</h1>
        <div class="container card col-sm-4">
            <div class="card-body">
                <form:form  commandName="MarkObject" action="addmarks2cart"
                           enctype="multipart/form-data">


                    <div class="col-sm-12 form-group">
                        <select class="form-control" ng-model="subject" ng-options="x.subjectname for x in sList">
                            <option value="">-- choose  Subject name--</option>
                        </select>
                    </div>

                    <form:hidden  class="form-control" value="{{subject.subjectid}}" path="subjectid"></form:hidden>


                        <div class="col-sm-12 form-group">
                        <form:input class="form-control" Placeholder="Mark Obtain"
                                    type="text" path="markobtain"  required="true"></form:input>
                        </div>  

                        <div class="col-sm-12 form-group">
                        <form:input class="form-control" Placeholder="Mark Grade"
                                    type="text" path="markgrade"  required="true"></form:input>
                        </div>



                    <c:if test="${check}">
                        <div class="reset-button">
                            <form:button id="editbuttons" type="submit" name="Add"
                                         class="btn btn-outline-primary" style="margin-left:15px;">Add Marks</form:button>
                        </c:if>


                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <div  style="min-height: 400px;">
        <h3 style="text-align: center; color: #689f38"
            style=" border-radius: 5px">Selected Exam Marks</h3>

        <c:if test="${cartempty}">
            <div class="jumbotron container h4 animated fadeInDown delay-05s" id="jumbotrondiv" align="center">
                There are No Exam Mark selected yet<br>


            </div>
        </c:if>
        <c:if test="${!cartempty}">
            <table class="table-dark  table-striped col-sm-6" align="center">
                <thead>
                    <tr scope="row">
                        <th style="width: 10%">Subject Id</th>
                        <th style="width: 10%">Marks Obtain</th>
                        <th style="width: 10%">Marks Grade</th>
                        <th style="width: 10%">Action</th>
                    </tr>
                </thead>

                <tbody ng-repeat="items in citems">
                    <tr scope="row" style="text-align: center;padding:10px;">

                        <td>{{items.subjectid}}</td>
                        <td>{{items.markobtain}}</td>
                        <td>{{items.markgrade}}</td>
                        <td><a href="deletemarkfromcart?getsubjectid={{items.subjectid}}"
                               id="removebtn" class="btn btn-outline-danger"> <span
                                    class="glyphicon glyphicon-remove"></span> Remove
                            </a></td>
                    </tr>
                </tbody>



            </table>

        </c:if>

</body>
</html>
