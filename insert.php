<?php
  require_once("koneksi.php");
  if($_POST['type'] == "input"){
	  $no_barang = $_POST['no_barang'] ;
    $nama_barang = $_POST['nama_barang'] ;
    $jenis_barang = $_POST['jenis_barang'] ;
    $stock_barang = $_POST['stock_barang'] ;
    $harga_barang = $_POST['harga_barang'] ;
    $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name) or die ("Koneksi gagal"); 
    $mysqli = "INSERT INTO tb_barang (no_barang, nama_barang, jenis_barang, stock_barang, harga_barang) VALUES ('$no_barang', '$nama_barang', '$jenis_barang', '$stock_barang', '$harga_barang')";
    $result = mysqli_query($conn, $mysqli); 
    mysqli_close($conn);
  }
?>

  