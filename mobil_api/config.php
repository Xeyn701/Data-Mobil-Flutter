<?php
$namaserver = "localhost";
$userdb = "root";
$passdb = "";
$namadb = "db_mobil";
 

$koneksi = mysqli_connect($namaserver, $userdb, $passdb, $namadb);
if (!$koneksi) {
    die("koneksi ke Database gagal!!!: " . mysqli_connect_error());
}

?>