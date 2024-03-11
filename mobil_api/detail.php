<?php
header('Access-Control-allow-Origin: *');

include "config.php";

$data = mysqli_query($koneksi, "SELECT * FROM mobil WHERE id=" .$_GET['id']);
$data = mysqli_fetch_array($data, MYSQLI_ASSOC);

echo json_encode($data);

?>