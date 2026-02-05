<?php
include 'ecconnect.php';

$id  = $_POST["id"];
$category_name = $_POST["category_name"];


if ($id == "" || $category_name == "" ) {
    echo "All fields are required.";
    exit;
}

$sql = "INSERT INTO s_expense_category (category_name) VALUES ('$category_name')";
if(mysqli_query($con, $sql)){
    echo "Record inserted successfully";
} else {
    echo "Error: " . mysqli_error($con);
}

mysqli_close($con);
?>