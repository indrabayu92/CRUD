<?php
  require_once("koneksi.php");
  $no_barang = $_POST['NoBarang'] ;
  $nama_barang = $_POST['NamaBarang'] ;
  $jenis_barang = $_POST['JenisBarang'] ;
  $stock_barang = $_POST['StockBarang'] ;
  $harga_barang = $_POST['HargaBarang'] ;
  $conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name) or die ("Koneksi gagal");
  $mysqli = "UPDATE tb_barang SET nama_barang='$nama_barang',jenis_barang='$jenis_barang',stock_barang='$stock_barang',harga_barang='$harga_barang' WHERE no_barang='$no_barang'";
  $result = mysqli_query($conn, $mysqli); 
  mysqli_close($conn);
  header("location:data.php");
?>