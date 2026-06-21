<?php

session_start();

include('../dbConnection.php');

if(!isset($_SESSION['parentEmail']))
{
    header("Location: ../index.php");
    exit();
}

$email=$_SESSION['parentEmail'];

$courseQuery="
SELECT COUNT(courseorder.co_id) AS totalCourses
FROM parent
JOIN student
ON parent.student_email=student.stu_email
JOIN courseorder
ON student.stu_email=courseorder.stu_email
WHERE parent.parent_email='$email'
";

$courseResult=$conn->query($courseQuery);
$totalCourses=$courseResult->fetch_assoc()['totalCourses'];


$paymentQuery="
SELECT SUM(courseorder.amount) AS totalPayment
FROM parent
JOIN student
ON parent.student_email=student.stu_email
JOIN courseorder
ON student.stu_email=courseorder.stu_email
WHERE parent.parent_email='$email'
";

$paymentResult=$conn->query($paymentQuery);
$totalPayment=$paymentResult->fetch_assoc()['totalPayment'];

$attendanceQuery="
SELECT AVG(attendance.attendance_percentage)
AS avgAttendance

FROM parent

JOIN student
ON parent.student_email=student.stu_email

JOIN attendance
ON student.stu_email=attendance.stu_email

WHERE parent.parent_email='$email'
";

$attendanceResult=$conn->query($attendanceQuery);

$attendanceData=
$attendanceResult->fetch_assoc();

$attendance=
round($attendanceData['avgAttendance']);

if(!$attendance)
{
    $attendance=0;
}

if(!$totalPayment)
{
    $totalPayment=0;
}

?>

<!DOCTYPE html>

<html>

<head>

<title>Parent Dashboard</title>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/all.min.css">
<link rel="stylesheet" href="../css/adminstyle.css">

</head>

<body>

<nav class="navbar navbar-dark fixed-top p-0 shadow"
style="background-color:#225470;">

<a class="navbar-brand col-sm-3 col-md-2 mr-0"
href="../index.php">

MyEduConnect Parent Portal

</a>

</nav>

<div class="container-fluid mb-5"
style="margin-top:40px;">

<div class="row">

<nav class="col-sm-2 bg-light sidebar py-5">

<div class="sidebar-sticky">

<ul class="nav flex-column">

<li class="nav-item">

<a class="nav-link active"
href="dashboard.php">

<i class="fas fa-tachometer-alt"></i>

Dashboard

</a>

</li>

<li class="nav-item">

<a class="nav-link"
href="logout.php">

<i class="fas fa-sign-out-alt"></i>

Logout

</a>

</li>

</ul>

</div>

</nav>

<div class="col-sm-9 mt-5">

<div class="row mx-5 text-center">

<div class="col-sm-4 mt-5">

<div class="card text-white bg-primary mb-3">

<div class="card-header">

Enrolled Courses

</div>

<div class="card-body">

<h4>

<?php echo $totalCourses; ?>

</h4>

</div>

</div>

</div>

<div class="col-sm-4 mt-5">

<div class="card text-white bg-success mb-3">

<div class="card-header">

Attendance

</div>

<div class="card-body">

<h4>

<?php echo $attendance; ?>%

</h4>

</div>

</div>

</div>

<div class="col-sm-4 mt-5">

<div class="card text-white bg-info mb-3">

<div class="card-header">

Payments

</div>

<div class="card-body">

<h4>

RM <?php echo $totalPayment; ?>
    
</h4>

</div>

</div>

</div>

</div>

<div class="mx-5 mt-5">

<p class="bg-dark text-white p-2">

Student Learning Progress

</p>

<table class="table">

<thead>

<tr>

<th>Student</th>

<th>Course</th>

<th>Payment</th>

<th>Attendance</th>

</tr>

</thead>

<tbody>

<?php

$email=$_SESSION['parentEmail'];

$sql="
SELECT
student.stu_name,
student.stu_email,
course.course_name,
course.course_id,
courseorder.amount

FROM parent

JOIN student
ON parent.student_email=student.stu_email

JOIN courseorder
ON student.stu_email=courseorder.stu_email

JOIN course
ON course.course_id=courseorder.course_id

WHERE parent.parent_email='$email'
";

$result=$conn->query($sql);

while($row=$result->fetch_assoc())
{

$stuEmail=$row['stu_email'];

$courseID=$row['course_id'];

$att="
SELECT attendance_percentage
FROM attendance

WHERE stu_email='$stuEmail'

AND course_id='$courseID'
";

$attResult=$conn->query($att);

$attendanceRow=$attResult->fetch_assoc();

$courseAttendance=
$attendanceRow['attendance_percentage']
?? 0;

echo "

<tr>

<td>".$row['stu_name']."</td>

<td>".$row['course_name']."</td>

<td>RM ".$row['amount']."</td>

<td>".$courseAttendance."%</td>

</tr>

";

}

?>

</tbody>

</table>

</div>

</div>

</div>

</div>

<script src="../js/jquery.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>

</body>

</html>