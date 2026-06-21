<?php
  include('./dbConnection.php');
  // Header Include from mainInclude 
  include('./mainInclude/header.php'); 
?>  
    <div class="container-fluid bg-dark"> <!-- Start Course Page Banner -->
      <div class="row">
        <img src="./image/coursebanner.jpg" alt="courses" style="height:500px; width:100%; object-fit:cover; box-shadow:10px;"/>
      </div> 
    </div> <!-- End Course Page Banner -->

    <div class="container mt-5">

<h1 class="text-center">All Courses</h1>

<form method="GET" class="mb-4">

<div class="input-group">

<input
type="text"
name="search"
class="form-control shadow-sm"
placeholder="Search by course name..."

value="<?php
if(isset($_GET['search']))
{
echo $_GET['search'];
}
?>">

<div class="input-group-append">

<button
class="btn btn-primary"
type="submit">

Search

</button>

</div>

</div>

</form>
        
      <div class="row mt-4"> <!-- Start All Course Row -->
          
      <?php

if(isset($_GET['search']))
{

    $search=
    $conn->real_escape_string(
    $_GET['search']
    );

    $sql="
    SELECT *
    FROM course

    WHERE LOWER(course_name)
    LIKE LOWER('%$search%')

    OR LOWER(course_desc)
    LIKE LOWER('%$search%')
    ";

}
else
{

    $sql="
    SELECT *
    FROM course
    ";

}

$result=$conn->query($sql);

if($result->num_rows > 0){

    while($row=$result->fetch_assoc()){

        $course_id=$row['course_id'];

        echo '

        <div class="col-sm-4 mb-4">

        <a href="coursedetails.php?course_id='.$course_id.'"
        class="btn"
        style="text-align:left;padding:0px;">

        <div class="card">

        <img
        src="'.str_replace('..','.',
        $row['course_img']).'"
        class="card-img-top"
        alt="Course">

        <div class="card-body">

        <h5 class="card-title">

        '.$row['course_name'].'

        </h5>

        <p class="card-text">

        '.$row['course_desc'].'

        </p>

        </div>

        <div class="card-footer">

        <p class="card-text d-inline">

        Price:

        <small>

        <del>

        &#8377 '.$row['course_original_price'].'

        </del>

        </small>

        <span class="font-weight-bolder">

        &#8377 '.$row['course_price'].'

        </span>

        </p>

        <a
        class="btn btn-primary text-white font-weight-bolder float-right"
        href="coursedetails.php?course_id='.$course_id.'">

        Enroll

        </a>

        </div>

        </div>

        </a>

        </div>

        ';

    }

}
else{

echo "

<div class='col-12'>

<div class='alert alert-warning text-center'>

No courses found.

</div>

</div>

";

}

?>

        </div><!-- End All Course Row -->   
      </div><!-- End All Course -->   
     
<?php 
  // Contact Us
  include('./contact.php'); 
?> 

<?php 
  // Footer Include from mainInclude 
  include('./mainInclude/footer.php'); 
?>  
