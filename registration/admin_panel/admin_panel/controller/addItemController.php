<?php
session_start();
    include_once "../config/dbconnect.php";
    $query = mysqli_query($conn, "SELECT * FROM restaurants WHERE email = '{$_SESSION['SESSION_EMAIL']}'");
    $row = mysqli_fetch_assoc($query);

    
    if(isset($_POST['upload']))
    {
        $ProductName = $_POST['p_name'];
        $desc= $_POST['p_desc'];
        $price = $_POST['p_price'];
        $category = $_POST['category'];
        $email = $_SESSION['SESSION_EMAIL'];
        $restaurantName = $row['name'];
       
            
        $name = $_FILES['file']['name'];
        $temp = $_FILES['file']['tmp_name'];
    
        $location="uploads/";
        $image=$location.$name;

        $target_dir="../uploads/";
        $finalImage=$target_dir.$name;

        move_uploaded_file($temp,$finalImage);

         $insert = mysqli_query($conn,"INSERT INTO product
         (product_name,product_image,price,product_desc,category_id,email, restaurant_name) 
         VALUES ('$ProductName','$image',$price,'$desc','$category','$email','$restaurantName')");
 
         if(!$insert)
         {
             echo mysqli_error($conn);
         }
         else
         {
             echo "Records added successfully.";
         }

         $error = $_FILES['file']['error'];
     
    }
        
?>