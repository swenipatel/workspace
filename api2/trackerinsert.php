<?php
include 'trackerconnect.php';

$date= $_POST["date"];
$amount = $_POST["amount"];
$category   = $_POST["category"];

if ($date == "" || $amount == "" || $category == "") {
    echo "All fields are required.";
    exit;
}

$sql = "INSERT INTO s_tracker (`date`, `amount`, `category`) VALUES ('$date','$amount','$category')";
if(mysqli_query($con, $sql)){
    echo "Record inserted successfully";
} else {
    echo "Error: " . mysqli_error($con);
}

mysqli_close($con);
?>