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
    WHERE parent_email=?
    AND parent_pass=?
    ";

    //Prepare the SQL statement
    if($stmt = $conn->prepare($sql))
    {
        //Bind parameters ('ss' means two strings) to secure the input against SQL Injection
        $stmt->bind_param("ss", $email, $password);
        
        $stmt->execute();
        
        $result = $stmt->get_result();

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
        
      
        $stmt->close();
    }
}

?>