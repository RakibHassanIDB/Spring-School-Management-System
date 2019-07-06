<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/adminpanel">
                <i class="mdi mdi-home menu-icon"></i>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#academic" aria-expanded="false" aria-controls="academic">
                <i class="mdi mdi-school menu-icon"></i>
                <span class="menu-title">Academic</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="academic">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="showingacademicyearpage">Academic Year</a></li>
                    <li class="nav-item"> <a class="nav-link" href="showingclassnamepage">Classes</a></li>
                    <li class="nav-item"> <a class="nav-link" href="showclassroutinpage">Class Routin</a></li>
                    <li class="nav-item"> <a class="nav-link" href="showclassteacherpage">Class Teacher</a></li>
                    <li class="nav-item"> <a class="nav-link" href="showsectionpage">Section</a></li>
                    <li class="nav-item"> <a class="nav-link" href="showingstgrouppage">Student Group</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#exam" aria-expanded="false" aria-controls="exam">
                <i class="mdi mdi-near-me menu-icon"></i>
                <span class="menu-title">Exam</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="exam">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="showingexaminfopage">Exam Information</a></li>
                    <li class="nav-item"> <a class="nav-link" href="studentmarksaddpage">Add Exam Marks</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#teacher" aria-expanded="false" aria-controls="teacher">
                <i class="mdi mdi-menu menu-icon"></i>
                <span class="menu-title">Teacher</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="teacher">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="showteacherpage">Teacher</a></li>
                    <li class="nav-item"> <a class="nav-link" href="showclassteacherpage">Class Teacher</a></li>
                    <li class="nav-item"> <a class="nav-link" href="showteacher">Show Teachers</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#student" aria-expanded="false" aria-controls="student">
                <i class="mdi mdi-account-multiple-plus menu-icon"></i>
                <span class="menu-title">Student</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="student">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="studentinfoepage">Student Information</a></li>
                    <li class="nav-item"> <a class="nav-link" href="showregistrationpage">Student Registration</a></li>
                    <li class="nav-item"> <a class="nav-link" href="attendencpage">Student Attendence</a></li>
                    <li class="nav-item"> <a class="nav-link" href="showStudentlist">Student List</a></li>
                    <li class="nav-item"> <a class="nav-link" href="searchstd">Search Student</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/showguardianpage">
                <i class="mdi mdi-marker-check menu-icon"></i>
                <span class="menu-title">Guardian</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#payment" aria-expanded="false" aria-controls="payment">
                <i class="mdi mdi-coin menu-icon"></i>
                <span class="menu-title">Fees Payment</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="payment">
                <ul class="nav flex-column sub-menu">
                    <li class="nav-item"> <a class="nav-link" href="showpaymentpage">Fee Payment</a></li>
                </ul>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/showingnoticepage">
                <i class="mdi mdi-script menu-icon"></i>
                <span class="menu-title">Notice</span>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#report" aria-expanded="false" aria-controls="report">
                <i class="mdi mdi-chart-areaspline menu-icon"></i>
                <span class="menu-title">Reports</span>
                <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="report">
                <ul class="nav flex-column sub-menu">
                    
                </ul>
            </div>
        </li>
    </ul>
</nav>