<?php
header('Access-Control-Allow-Origin: *');

include "config.php";

$id = $_POST['id'];
$merk = $_POST['merk'];
$model = $_POST['model'];
$tahun = $_POST['tahun'];
$warna = $_POST['warna'];
$harga = $_POST['harga'];
$bahan_bakar = $_POST['bahan_bakar'];
$deskripsi = $_POST['deskripsi'];

$result = mysqli_query($koneksi, "UPDATE mobil SET merk='$merk', model='$model', tahun='$tahun', warna='$warna', harga='$harga', bahan_bakar='$bahan_bakar', deskripsi='$deskripsi' WHERE id='$id'");

if ($result) {
    echo json_encode([
        'message' => 'Data berhasil diubah'
    ]);
} else {
    echo json_encode([
        'message' => 'Gagal mengubah data'
    ]);
}
?>
