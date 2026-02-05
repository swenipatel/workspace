<?php
include 'usersconnect.php';

$name  = $_POST["name"];
$email = $_POST["email"];
$pass   = $_POST["pass"];

if ($name == "" || $email == "" || $pass == "") {
    echo "All fields are required.";
    exit;
}

$sql = "INSERT INTO s_users (`name`, `email`, `pass`) VALUES ('$name','$email','$pass')";
if(mysqli_query($con, $sql)){
    echo "Record inserted successfully";
} else {
    echo "Error: " . mysqli_error($con);
}

mysqli_close($con);
?>