<?php
@session_start();
include_once "./config/dbconnect.php";
if (!isset($_SESSION['SESSION_EMAIL'])) {
    header("Location: index.php");
    die();
}

$query = mysqli_query($conn, "SELECT * FROM restaurants WHERE email='{$_SESSION['SESSION_EMAIL']}'");

if (mysqli_num_rows($query) > 0) {

    $row = mysqli_fetch_assoc($query);

    $name = $row['name'];
    $finalName = str_replace(" ", "_", $name);
?>
       
 <!-- nav -->
 <nav  class="navbar navbar-expand-lg navbar-light px-5" style="background-color: #3B3131;">
    
    <a class="navbar-brand ml-5" href="./index.php">
        <img src="./assets/images/logo.png" width="80" height="80" alt="Swiss Collection">
    </a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0"></ul>
    
    <div class="user-cart">  
        <?php           
        if(isset($_SESSION['user_id'])){
          ?>
          <a href="" style="text-decoration:none;">
            <i class="fa fa-user mr-5" style="font-size:30px; color:#fff;" aria-hidden="true"></i>
         </a>
          <?php
        } else {
            ?>
            <a href="https://dineease.000webhostapp.com/registration/restaurants/<?php echo $finalName;?>.php" style="text-decoration:none;">
                    <i class="fa-solid fa-globe mr-3" style="font-size:10px; color:#fff;" aria-hidden="true">   Visit Restaurant</i>
            </a>
            <a href="../../logout.php" style="text-decoration:none;">
                    <i class="fa fa-sign-in mr-5" style="font-size:10px; color:#fff;" aria-hidden="true">   Log Out</i>
            </a>
            <?php
        } ?>
    </div>  
</nav>
<?php 
}
?>