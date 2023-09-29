<?php
session_start();
if (!isset($_SESSION['SESSION_EMAIL'])) {
    header("Location: index.php");
    die();
}

include 'config.php';



// Initialize variables to store form data
$restaurantName = $contactNo = $addressLine1 = $addressLine2 = $city = $zipcode = "";
$errors = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if the form has been submitted
    if (isset($_POST['save_profile'])) {
        // Retrieve the updated data from the form
        $newName = $_POST['new_name'];
        $newMobileNumber = $_POST['new_mobile_number'];

        // Update the database with the new data
        $updateQuery = "UPDATE users1 SET name='$newName', mobile_number='$newMobileNumber' WHERE email='{$_SESSION['SESSION_EMAIL']}'";
        mysqli_query($conn, $updateQuery);

        // Redirect to a success page or refresh the current page
        // You can add appropriate redirection logic here
    }
    if (isset($_POST['add_restaurant'])) {
        
        // Validate and sanitize user input
        $restaurantName = mysqli_real_escape_string($conn, $_POST['restaurant_name']);
        $contactNo = mysqli_real_escape_string($conn, $_POST['contact_no']);
        $addressLine1 = mysqli_real_escape_string($conn, $_POST['address_line1']);
        $addressLine2 = mysqli_real_escape_string($conn, $_POST['address_line2']);
        $city = mysqli_real_escape_string($conn, $_POST['city']);
        $zipcode = mysqli_real_escape_string($conn, $_POST['zipcode']);
        $email = $_SESSION['SESSION_EMAIL'];

        $profileImageData = file_get_contents($_FILES['profile_image']['tmp_name']);

        if (!empty($profileImageData)) {
            // Profile image uploaded successfully
            // Insert the image data into the database
            $insertImageQuery = "INSERT INTO restaurants (name, contact_no, address_line1, address_line2, city, zipcode, email, profile_image) 
                                 VALUES ('$restaurantName', '$contactNo', '$addressLine1', '$addressLine2', '$city', '$zipcode', '$email', ?)";

            $stmt = mysqli_prepare($conn, $insertImageQuery);
            mysqli_stmt_bind_param($stmt, 's', $profileImageData);
            
            if (mysqli_stmt_execute($stmt)) {
                // Image data inserted successfully
            } else {
                $errors[] = "Error inserting profile image data into the database";
            }

            mysqli_stmt_close($stmt);
        } else {
            $errors[] = "Profile image is required";
        }

        // ... Continue with the rest of the form processing ...

        // Check if required fields are empty
        if (empty($restaurantName) || empty($contactNo) || empty($addressLine1) || empty($city) || empty($zipcode)) {
            $errors[] = "All fields are required";
        } else {
            // Insert data into the database

                // Update the user's restaurant_added flag in the users1 table
                $updateUserQuery = "UPDATE users1 SET restaurant_added = 1 WHERE email='{$_SESSION['SESSION_EMAIL']}'";
                mysqli_query($conn, $updateUserQuery);

                // Create a new PHP file for the restaurant
                $restaurantFileName = "restaurants/" . str_replace(' ', '_', $restaurantName) . ".php";
                $restaurantContent = "<?php\n";
                $restaurantContent .= "\$restaurantName = '$restaurantName';\n";
                $restaurantContent .= "\$contactNo = '$contactNo';\n";
                $restaurantContent .= "\$addressLine1 = '$addressLine1';\n";
                $restaurantContent .= "\$addressLine2 = '$addressLine2';\n";
                $restaurantContent .= "\$city = '$city';\n";
                $restaurantContent .= "\$zipcode = '$zipcode';\n";
                $restaurantContent .= "\$email = '$email';\n";
                $restaurantContent .= "?>\n";
                $restaurantContent = file_get_contents("template.php"); // Load the HTML template
                
                file_put_contents($restaurantFileName, $restaurantContent);
                            
                // Set a session variable to indicate that a restaurant has been added
                $_SESSION['restaurant_added'] = true;

                // Update the user's restaurant_added flag in the users1 table
                $updateUserQuery = "UPDATE users1 SET restaurant_added = 1 WHERE email='{$_SESSION['SESSION_EMAIL']}'";
                mysqli_query($conn, $updateUserQuery);

                // Redirect to welcome.php with the success parameter
                header("Location: welcome.php?add_restaurant_success=1");
                exit();
            }
        }
    }

$query = mysqli_query($conn, "SELECT * FROM users1 WHERE email='{$_SESSION['SESSION_EMAIL']}'");

if (mysqli_num_rows($query) > 0) {
    $row = mysqli_fetch_assoc($query);
    $name = $row['name'];
    $email = $row['email'];
    $mobileNumber = $row['mobile_number'];
// Your HTML code for the restaurant form goes here
}
?>
<html>
<head>
 <!-- Meta Tags -->

 <meta charset='utf-8' />

<meta http-equiv='X-UA-Compatible' content='IE=edge' />

<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no' />

<meta name='description'

    content='This is the Web Application of DineEase App. We are giving you a help to take food at anytime from a restaurant without telling them to a waiter.' />

<meta name='author' content='DineEase' />

<meta name='keywords' content='Register' />



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

<link rel='icon' type='image/png' href='../assets/img/favicon.png' alt='Favicon' />

<link rel="stylesheet" href="css/style.css">

</head>
<body>
    <div class='container profile bg-white mt-5 mb-5' style='font-size: 120%;'>
        <form method='POST' action='add_restaurant.php' style='font-size: 130%;' enctype="multipart/form-data">
            <!-- Display validation errors if any -->
            <?php if (!empty($errors)) { ?>
                <div class="alert alert-danger">
                    <ul>
                        <?php foreach ($errors as $error) { ?>
                            <li><?php echo $error; ?></li>
                        <?php } ?>
                    </ul>
                </div>
            <?php } ?>
            
            
            <!-- Your restaurant form content goes here -->
            <div class='row'>
                <div class='col-md-6 form-field'>
                    <label style='font-size: 120%;' class='labels mt-4'>Restaurant Name</label>
                    <input style='font-size: 100%;' type='text' class='form-control mt-2' name='restaurant_name' required>
                </div>
                <div class='col-md-6 form-field'>
                    <label style='font-size: 120%;' class='labels mt-4'>Contact No</label>
                    <input style='font-size: 100%;' type='text' class='form-control mt-2' name='contact_no' required>
                </div>
                <div class='col-md-12 form-field'>
                    <label style='font-size: 120%;' class='labels mt-3'>Address Line 1</label>
                    <input style='font-size: 100%;' type='text' class='form-control mt-2' name='address_line1' required>
                </div>
                <div class='col-md-12 form-field'>
                    <label style='font-size: 120%;' class='labels mt-3'>Address Line 2</label>
                    <input style='font-size: 100%;' type='text' class='form-control mt-2' name='address_line2'>
                </div>
                <div class='col-md-6 form-field'>
                    <label style='font-size: 120%;' class='labels mt-3'>City</label>
                    <input style='font-size: 100%;' type='text' class='form-control mt-2' name='city' required>
                </div>
                <div class='col-md-6 form-field'>
                    <label style='font-size: 120%;' class='labels mt-3'>Zipcode</label>
                    <input style='font-size: 100%;' type='text' class='form-control mt-2' name='zipcode' required>
                </div>
                <div class='col-md-12 form-field'>
                    <label style='font-size: 120%;' class='labels mt-3'>Restaurant Logo</label>
                    <input style='font-size: 100%;' type='file' class='form-control mt-2' name='profile_image'>
                </div>
                <div class='d-flex' style='width: 150%;'>
                <div class='mt-5 text-center'>
                    <button class='btn btn-primary profile-button mt-3' type='submit' name='add_restaurant' style='font-size: 100%;'>Add Restaurant</button>
                </div>
            </div>
            </div>
        </form>
    </div>
    <!-- Include your HTML footer and script tags here -->
</body>
</html>