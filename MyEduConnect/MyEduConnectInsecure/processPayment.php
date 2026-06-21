<?php

include('./dbConnection.php');

session_start();

if(!isset($_SESSION['stuLogEmail']))
{
    header("Location: loginorsignup.php");
}

$orderID=$_POST['ORDER_ID'];
$studentEmail=$_POST['CUST_ID'];
$amount=$_POST['TXN_AMOUNT'];

$courseID=$_SESSION['course_id'];

$sql="
INSERT INTO courseorder
(order_id,stu_email,course_id,amount)

VALUES

(
'$orderID',
'$studentEmail',
'$courseID',
'$amount'
)
";

if($conn->query($sql))
{

echo "

<script>

alert('Enrollment Successful');

window.location='paymentstatus.php';

</script>

";

}
else
{

echo "

<script>

alert('Payment Failed');

window.location='courses.php';

</script>

";

}

?>