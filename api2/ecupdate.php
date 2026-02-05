<?php
include 'ecconnect.php';
header('Content-Type: application/json');

$id     = $_POST['id'] ?? null;
$category_name   = $_POST['category_name'] ?? null;

if (!$id) {
    echo json_encode(["message" => "ID is required"]);
    exit;
}

$sql = "UPDATE s_expense_category SET category_name=? WHERE id=?";
$stmt = mysqli_prepare($con, $sql);

mysqli_stmt_bind_param($stmt, "sdsi", $category_name, $id);

if (mysqli_stmt_execute($stmt)) {
    echo json_encode(["message" => "Product updated"]);
} else {
    echo json_encode(["message" => "Error: " . mysqli_error($con)]);
}

mysqli_stmt_close($stmt);
mysqli_close($con);
?>