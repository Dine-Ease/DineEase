<?php
session_start();
include_once "../config/dbconnect.php";

if (isset($_POST['upload'])) {
    $size = $_POST['size'];
    $email = $_SESSION['SESSION_EMAIL'];

    $insert = mysqli_query($conn, "INSERT INTO sizes (size_name,email) VALUES ('$size','$email')");

    if (!$insert) {
        header("Location: ../index.php?size=error");
        echo mysqli_error($conn);
        exit; // Terminate script after sending the header
    } else {
        header("Location: ../index.php?size=success");
        echo "Records added successfully.";
        exit; // Terminate script after sending the header
    }
}
?>
