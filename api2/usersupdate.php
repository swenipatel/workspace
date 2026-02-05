<?php
include 'usersconnect.php';
header('Content-Type: application/json');

$id     = $_POST['id'] ?? null;
$pname  = $_POST['name'] ?? null;
$pprice = $_POST['email'] ?? null;
$pdes   = $_POST['pass'] ?? null;

if (!$id) {
    echo json_encode(["message" => "ID is required"]);
    exit;
}

$sql = "UPDATE s_users SET name=?, email=?, pass=? WHERE id=?";
$stmt = mysqli_prepare($con, $sql);

mysqli_stmt_bind_param($stmt, "sdsi", $pname, $pprice, $pdes, $id);

if (mysqli_stmt_execute($stmt)) {
    echo json_encode(["message" => "Product updated"]);
} else {
    echo json_encode(["message" => "Error: " . mysqli_error($con)]);
}

mysqli_stmt_close($stmt);
mysqli_close($con);
?>