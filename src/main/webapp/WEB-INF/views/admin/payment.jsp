<%-- 
    Document   : addClass
    Created on : Nov 24, 2018, 6:26:51 PM
    Author     : C7
--%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Studetn Fee Page</title>
        <!--Angular Js-->
        <script src="resources/js/angular.min.js" type="text/javascript"></script>
        <jsp:include page="/WEB-INF/views/partial/head.jsp"></jsp:include>
            <!-- inject:css -->
            <link rel="stylesheet" href="resources/css/style.css">
            <link href="resources/css/customstyle.css" rel="stylesheet" type="text/css"/>
            <link href="resources/css/all.css" rel="stylesheet" type="text/css"/>
            <script src="resources/js/all.js" type="text/javascript"></script>
            <script>
                var payamounts = ${payamount};
                var stregistrations = ${stregistration};
                var yearmodelobjects = ${yearmodelobject};
                angular.module('myApp', []).controller('StudentFeeCtrl',
                        function ($scope) {
                            $scope.payamount = payamounts;
                            $scope.stregistration = stregistrations;
                            $scope.yearmodelobject = yearmodelobjects;
                            console.log($scope.payamount);
                        });
        </script>


    </head>
    <body ng-app="myApp" ng-controller="StudentFeeCtrl">

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
                                            <center><span class="card title-text"><h4>Collect Student Fees</h4></span></center>
                                            <div class="box">
                                            <form:form commandName="paymentObject" action="paymentadd"
                                                       enctype="multipart/form-data">

                                                <c:if test="${!check}">
                                                    <div class="form-group input-field col s6">
                                                        <form:input class="form-control" Placeholder="Pament id" style="display:none"
                                                                    type="text" path="payid" readonly="true" required="true"></form:input>
                                                        </div>
                                                </c:if>



                                                <div class="form-group input-field col s6">
                                                    <select class="form-control" ng-model="strid" ng-options="x.regid  as x.regid for x in stregistration" required="true">
                                                        <option value="">-- Registration No--</option>
                                                    </select>
                                                </div>
                                                <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{strid}}" path="regid"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                    <form:input id="name" class="form-control"
                                                                Placeholder="Pament Ammount" type="text" path="payammount" required="true"></form:input>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:input id="name" class="form-control"
                                                                Placeholder="Pament Date" type="text" path="paydate" required="true"></form:input>
                                                    </div>


                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="mon" required="true">
                                                            <option value="">--Select Month --</option>
                                                            <option value="January">January</option>
                                                            <option value="February">February</option>
                                                            <option value="March">March</option>
                                                            <option value="April">April</option>
                                                            <option value="May">May</option>
                                                            <option value="June">June</option>
                                                            <option value="July">July</option>
                                                            <option value="August">August</option>
                                                            <option value="September">September</option>
                                                            <option value="October">October</option>
                                                            <option value="November">November</option>
                                                            <option value="December">December</option>

                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{mon}}" path="payofmonth"></form:hidden>
                                                    </div>

                                                    <div class="form-group input-field col s6">
                                                    <form:input id="name" class="form-control"
                                                                Placeholder="Payment Description" type="text" path="description" required="true"></form:input>
                                                    </div>


                                                    <div class="form-group input-field col s6">
                                                        <select class="form-control" ng-model="yid" ng-options="x.yearid as x.accyear for x in yearmodelobject" required="true">
                                                            <option value="">-- Select Academic Year --</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group input-field col s6">
                                                    <form:hidden  class="form-control" value="{{yid}}" path="yearid"></form:hidden>
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
                                                <a href="showpaymentpage"><button id="show" type="button" class="btn btn-info">Cancel</button></a>        
                                            </form:form>
                                        </div>
                                    </div>
                                    <div class="card table-card">
                                        <center><span class="card title-text"><h4>Collected Fee List</h4></span></center>
                                        <div class="form-group input-field col s12">
                                            <input type="text" ng-model="test" class="form-control" placeholder="Search">
                                        </div>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-dark">
                                                <thead>
                                                    <tr>
                                                        <th>Pay id</th>
                                                        <th>Registration id</th>
                                                        <th>Pay Amount</th>
                                                        <th>Pay Date</th>
                                                        <th>Month</th>
                                                        <th>Academic year</th>
                                                        <th>Action</th>
                                                    </tr >
                                                </thead>
                                                <tbody>
                                                    <tr ng-repeat="pa in payamount| filter:test">
                                                        <td>{{pa.payid}}</td>
                                                        <td>{{pa.regid}}</td>
                                                        <td>{{pa.payammount}}</td>
                                                        <td>{{pa.paydate}}</td>
                                                        <td>{{pa.payofmonth}}</td>
                                                        <td>{{pa.yearid}}</td>
                                                        <td>
                                                            <a href="editingpaymayment?getpayid={{pa.payid}}"><button id="editbuttons" type="submit" class="btn btn-primary"><i class="far fa-edit"></i></button></a> 
                                                            <a href="removingpayment/{{pa.payid}}"><button  id="removebuttons" type="button" class="btn btn-danger"><i class="fas fa-trash"></i></button></a>
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
                                                                            var date_input = $('input[name="paydate"]'); //our date input has the name "date"
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
