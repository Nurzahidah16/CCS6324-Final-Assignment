<?php

session_start();

include('../dbConnection.php');

if(isset($_POST['parentEmail']))
{

    $email=$_POST['parentEmail'];
    $password=$_POST['parentPass'];

    $sql="
    SELECT *
    FROM parent
    WHERE parent_email='$email'
    AND parent_pass='$password'
    ";

    $result=$conn->query($sql);

    if($result->num_rows==1)
    {

        $_SESSION['parentEmail']=$email;

        header("Location: dashboard.php");
        exit();

    }
    else
    {

        echo "
        <script>

        alert('Invalid Parent Login');

        window.location='../index.php';

        </script>
        ";

    }

}

?>