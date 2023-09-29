<?php
session_start();
    include_once "../config/dbconnect.php";

    

    if(isset($_POST['upload']))

    {

       

        $product = $_POST['product'];

        $size= $_POST['size'];

        $qty = $_POST['qty'];
        $email = $_SESSION['SESSION_EMAIL'];



         $insert = mysqli_query($conn,"INSERT INTO product_size_variation

         (product_id,size_id,quantity_in_stock,email) VALUES ('$product','$size','$qty','$email')");

 

         if(!$insert)

         {

             
             header("Location: ../index.php?variation=error");
             echo mysqli_error($conn);

         }

         else

         {

             
             header("Location: ../index.php?variation=success");
             echo "Records added successfully.";

         }

     

    }

        

?>