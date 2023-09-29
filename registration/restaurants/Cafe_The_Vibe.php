<?php

session_start();

include '../config.php';

// Get the current script name (e.g., Aquinas_Villa.php)
$currentScript = basename(__FILE__, '.php');

// Use the current script name as the restaurant name
$restaurantName = str_replace('_', ' ', $currentScript);

$query = mysqli_query($conn, "SELECT * FROM restaurants WHERE name = '$restaurantName'");


if ($query) {

    if (mysqli_num_rows($query) > 0) {

        $row = mysqli_fetch_assoc($query);

        $restaurantName = $row['name'];

    } else {

        // Handle the case where no rows were returned

        $restaurantName = "Restaurant Name Not Found";

    }

} else {

    // Handle the case where the query failed

    $restaurantName = "Error fetching restaurant name";

}

?>

<!DOCTYPE html>

<html lang='en'>

<head>

<!-- Meta Tags -->

<meta charset='utf-8' />

<meta http-equiv='X-UA-Compatible' content='IE=edge' />

<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no' />

<meta name='description'

content='This is the Web Application of DineEase App. We are giving you a help to take food at anytime from a restaurant without telling them to a waiter.' />

<meta name='author' content='DineEase' />

<meta name='keywords' content='Your Profile' />



<!-- Facebook OG Tags -->

<meta property='og:title' content='DineEase' />

<meta property='og:type' content='website' />

<meta property='og:url' content='https://yoshitharathnayake.github.io/DineEase-Application' />

<meta property='og:image' content='assets/img/logo.png' alt='DineEase Logo' />

<meta property='og:description'

content='This is the Web Application of DineEase App. We are giving you a help to take food at anytime from a restaurant without telling them to a waiter.' />

<meta property='og:site_name' content='DineEase' />

<meta property='og:locale' content='en_US' />



<!-- Font Awesome -->

<link rel='stylesheet'

href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css'

integrity='sha384-jLKHWM3JRmfMU0A5x5AkjWkw/EYfGUAGagvnfryNV3F9VqM98XiIH7VBGVoxVSc7' crossorigin='anonymous' />

<link rel='stylesheet'

href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css' />

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css' />

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css'>



<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css' rel='stylesheet'

integrity='sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC' crossorigin='anonymous' />



<!-- Jquery -->

<script src='https://code.jquery.com/jquery-1.10.2.js'></script>

<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.1/animate.min.css'

integrity='sha512-E5hbw9GiuYofTcrbba1gAU64dn/54A9nmk4IEMzmp+YmiLc0WnRLOfzofb/r6spu5CVilyob07HWGhXq7Ht7dQ=='

crossorigin='anonymous' referrerpolicy='no-referrer' />



<!-- Swipers JS -->

<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css' />



<!-- AOS -->

<link rel='stylesheet' href='https://unpkg.com/aos@next/dist/aos.css' />



<!-- Scroll Reveal -->

<script src='https://unpkg.com/scrollreveal'></script>



<!-- LineIcons -->

<link href='your-project-dir/icon-font/lineicons.css' rel='stylesheet' />

<link href='https://cdn.lineicons.com/3.0/lineicons.css' rel='stylesheet' />



<!-- Google -->

<link rel='preconnect' href='https://fonts.googleapis.com'>

<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>



<!-- Google Fonts -->

<link href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap' rel='stylesheet' />

<!-- Favicon -->

<link rel='icon' type='image/png' href='assets/img/favicon.png' alt='Favicon' />



<!-- CSS-->

<!--<link rel='stylesheet' type='text/CSS' href='../css/style.css' />-->



<!-- Favicon -->

<link rel='icon' type='image/png' href='../assets/img/favicon.png' alt='Favicon' />


   <!-- custom css file link  -->
   <link rel="stylesheet"  type='text/CSS' href="../css/menu.css">




<!-- Title -->

<title><?php echo $restaurantName; ?></title>

</head>

<body>
<!-- Image and text -->

<nav class='navbar navbar-light bg-light'>

  <a class='navbar-brand' href='#'>

  <?php echo $restaurantName; ?>

  </a>

</nav>
<?php

$sql="SELECT * from product, category WHERE product.category_id=category.category_id AND product.restaurant_name='$restaurantName'";

$result=$conn-> query($sql);

$count=1;

if ($result->num_rows > 0) {
    // Initialize the count for the outer loop
    $outerCount = 1;

    while ($row = $result->fetch_assoc()) {
        ?>
        <div class="container">
            <div class="products-container">
                <?php
                // Initialize the count for the inner loop
                $innerCount = 1;

                // Rewind the result set to the beginning
                $result->data_seek(0);

                while ($innerRow = $result->fetch_assoc()) {
                    ?>
                    <div class="product" data-name="p-<?php echo $innerCount; ?>">
                        <img src="../admin_panel/admin_panel/<?= $innerRow["product_image"] ?>" alt="">
                        <h3><?= $innerRow["product_name"] ?></h3>
                        <div class="price">Rs.<?= $innerRow["price"] ?></div>
                    </div>
                    <?php
                    $innerCount = $innerCount + 1;
                }
                ?>
            </div>
        </div>

        <?php
        $outerCount = $outerCount + 1;
    }
}
?>

<div class="products-preview">
    <!-- This is outside the loop -->
    <?php
    // Reset the count for the inner loop
    $innerCount = 1;

    // Rewind the result set to the beginning
    $result->data_seek(0);

    while ($innerRow = $result->fetch_assoc()) {
        ?>
        <div class="preview" data-target="p-<?php echo $innerCount; ?>">
            <i class="fas fa-times"></i>
            <img src="../admin_panel/admin_panel/<?= $innerRow["product_image"] ?>" alt="">
            <h3><?= $innerRow["product_name"] ?></h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <span>( 250 )</span>
            </div>
            <p><?= $innerRow["product_desc"] ?></p>
            <div class="price">Rs.<?= $innerRow["price"] ?></div>
            <div class="buttons">
                <a href="#" class="cart" onclick="addToCart('<?php echo $restaurantName; ?>', <?php echo $user_id; ?>, <?php echo $variation_id; ?>, 1, <?php echo $price; ?>)">Add to Plate</a>
            </div>
        </div>
        <?php
        $innerCount = $innerCount + 1;
    }
    ?>
</div>
   <!-- custom js file link  -->
   <script src="../js/menu.js" defer></script>
</body>

</html>