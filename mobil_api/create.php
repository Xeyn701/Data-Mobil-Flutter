<?php
header('Access-Control-Allow-Origin: *');

include "config.php";

$merk = $_POST['merk'];
$model = $_POST['model'];
$tahun = $_POST['tahun'];
$warna = $_POST['warna'];
$harga = $_POST['harga'];
$bahan_bakar = $_POST['bahan_bakar'];
$deskripsi = $_POST['deskripsi'];

$result = mysqli_query($koneksi, "INSERT INTO mobil (merk, model, tahun, warna, harga, bahan_bakar, deskripsi) VALUES ('$merk', '$model', '$tahun', '$warna', '$harga', '$bahan_bakar', '$deskripsi')");

if ($result) {
    echo json_encode([
        'message' => 'Success'
    ]);
} else {
    echo json_encode([
        'message' => 'Failed'
    ]);
}
?>
