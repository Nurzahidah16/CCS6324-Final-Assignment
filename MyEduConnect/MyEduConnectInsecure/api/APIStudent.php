<?php

include('../dbConnection.php');

header("Content-Type: application/json");

$sql="
SELECT
stu_id,
stu_name,
stu_email
FROM student
";

$result=$conn->query($sql);

$data=[];

while($row=$result->fetch_assoc())
{
    $data[]=$row;
}

echo json_encode($data);

?>