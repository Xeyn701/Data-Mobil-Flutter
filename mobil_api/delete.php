<?php
header('Access-Control-allow-Origin: *');

include "config.php";

$id = $_POST['id'];


$result = mysqli_query($koneksi, "DELETE FROM mobil WHERE id='$id'");
if($result){
    echo json_encode([
        'message' => 'Success'
    ]);
}else{
    echo json_encode([
        'message' => 'Failed'
    ]);
}
?>