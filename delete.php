<?php
    include 'koneksi.php';
    $no_barang = $_POST['no_barang'] ;
    $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name) or die ("Koneksi gagal");
    $query = "DELETE FROM tb_barang";
    $result = mysqli_query($conn, $query);
    mysqli_close($conn);
    header("location:tampilan.php");
?>