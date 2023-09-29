<?php
session_start();
include '../config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get product details from the POST request
    $productId = $_POST['product_id'];
    $ipAddress = $_SERVER['REMOTE_ADDR'];
    $quantity = $_POST['quantity'];
    $productImage = $_POST['product_image'];

    // Debugging: Output the received values
    echo "Product ID: " . $productId . "<br>";
    echo "IP Address: " . $ipAddress . "<br>";
    echo "Quantity: " . $quantity . "<br>";

    // Perform the database insert
    $sql = "INSERT INTO cart (product_id, client_ip, quantity, product_image) VALUES ('$productId', '$ipAddress', '$quantity', '$productImage')";

    if (mysqli_query($conn, $sql)) {
        echo "Product added to cart successfully!";
    } else {
        echo "Error adding product to cart: " . mysqli_error($conn);
    }
} else {
    echo "Invalid request method!";
}
?>