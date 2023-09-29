<?php

$server = "localhost";
$user = "id21264864_root";
$password = "sl5J*SE#";
$db = "id21264864_login";

$conn = mysqli_connect($server,$user,$password,$db);

if(!$conn) {
    die("Connection Failed:".mysqli_connect_error());
}

?>