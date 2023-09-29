<?php
    include_once "../config/dbconnect.php";
    
    // Start the session
    session_start();

    if(isset($_POST['upload'])) {
        $catname = $_POST['c_name'];
        
        // Check if 'email' is set in the session
        if(isset($_SESSION['SESSION_EMAIL'])) {
            $email = $_SESSION['SESSION_EMAIL'];

            // Update your SQL query to properly format the values
            $query = "INSERT INTO category (category_name, email) VALUES ('$catname', '$email')";
            
            $insert = mysqli_query($conn, $query);

            if(!$insert) {
                echo mysqli_error($conn);
                header("Location: ../index.php?category=error");
                exit(); // Exit the script after setting the header
            } else {
                header("Location: ../index.php?category=success");
                exit(); // Exit the script after setting the header
            }
        } else {
            // Handle the case where 'email' is not set in the session
            echo "Email not found in the session.";
        }
    }
?>
