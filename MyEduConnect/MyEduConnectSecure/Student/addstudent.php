<?php 
if(!isset($_SESSION)){ 
  session_start(); 
}
include_once('../dbConnection.php');

// setting header type to json, We'll be outputting a Json data
header('Content-type: application/json');

// Checking Email already Registered
if(isset($_POST['stuemail']) && isset($_POST['checkemail'])){
  $stuemail = $_POST['stuemail'];
  
  // FIX: Using Prepared Statements to safely check existing records
  $sql = "SELECT stu_email FROM student WHERE stu_email = ?";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("s", $stuemail);
  $stmt->execute();
  $result = $stmt->get_result();
  $row = $result->num_rows;
  
  echo json_encode($row);
  $stmt->close();
}
 
  // Inserting or Adding New Student
  if(isset($_POST['stusignup']) && isset($_POST['stuname']) && isset($_POST['stuemail']) && isset($_POST['stupass'])){
    $stuname = $_POST['stuname'];
    $stuemail = $_POST['stuemail'];
    $stupass = $_POST['stupass']; // Matches form variable name
    
    // FIX: Hash the plaintext password using Argon2id
    $hashedPassword = password_hash($stupass, PASSWORD_ARGON2ID);
    
    // FIX: Added the proper INSERT SQL query structure using placeholder bindings
    $sql = "INSERT INTO student (stu_name, stu_email, stu_pass) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $stuname, $stuemail, $hashedPassword);
    
    if($stmt->execute()){
      echo json_encode("OK");
    } else {
      echo json_encode("Failed");
    }
    $stmt->close();
  }

  // Student Login Verification
  if(!isset($_SESSION['is_login'])){
    if(isset($_POST['checkLogemail']) && isset($_POST['stuLogEmail']) && isset($_POST['stuLogPass'])){
      $stuLogEmail = $_POST['stuLogEmail'];
      $stuLogPass = $_POST['stuLogPass'];
      
      // FIX: Query the user profile record strictly by their email criteria
      $sql = "SELECT stu_email, stu_pass FROM student WHERE stu_email = ?";
      $stmt = $conn->prepare($sql);
      $stmt->bind_param("s", $stuLogEmail);
      $stmt->execute();
      $result = $stmt->get_result();
      
      if($result->num_rows === 1){
        $userRow = $result->fetch_assoc();
        
        // FIX: Extract the secure database hash string and verify via password_verify()
        if(password_verify($stuLogPass, $userRow['stu_pass'])){
          $_SESSION['is_login'] = true;
          $_SESSION['stuLogEmail'] = $stuLogEmail;
          echo json_encode(1); // Return 1 indicating a successful single row match
        } else {
          echo json_encode(0); // Authentication failed due to password mismatch
        }
      } else {
        echo json_encode(0); // Authentication failed due to email not found
      }
      $stmt->close();
    }
  }

?>