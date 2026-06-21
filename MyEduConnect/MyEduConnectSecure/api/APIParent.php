<?php

include('../dbConnection.php');

header("Content-Type: application/json");

$sql="
SELECT
parent_name,
parent_email,
student_email
FROM parent
";

$result=$conn->query($sql);

$data=[];

while($row=$result->fetch_assoc())
{
    $data[]=$row;
}

echo json_encode($data);

?>