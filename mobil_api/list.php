<?php
header('Access-Control-allow-Origin: *');

include "config.php";

$data = mysqli_query($koneksi, "SELECT * FROM mobil");
$data = mysqli_fetch_all($data, MYSQLI_ASSOC);

echo json_encode($data);

?>