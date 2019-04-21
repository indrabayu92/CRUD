<!DOCTYPE html>
<html>
<head>
	<title>Membuat CRUD Dengan PHP Dan MySQL - Menampilkan data dari database</title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="judul">		
		<h1>Membuat CRUD Dengan PHP Dan MySQL</h1>
		<h2>Menampilkan data dari database</h2>
		<h3>www.malasngoding.com</h3>
	</div>
	
	<br/>
	
	<a href="data.php">Lihat Semua Data</a>
 
	<br/>
	<h3>Edit data</h3>
 
	<?php
	include 'koneksi.php';
	$conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name) or die ("Koneksi gagal");
	$id= $_GET['no_barang'];
    $query_mysql = "SELECT * FROM tb_barang ORDER BY '$id'";
	$result= mysqli_query($conn, $query_mysql); 
	$no_barang = 1;
	while($data = mysqli_fetch_array($result)){
	?>
	<form action="update.php" method="POST">		
		<table>
			<tr>
				<td>Nama Barang</td> 
				<td>
					<input type="hidden" name="NoBarang" value="<?php echo $data['no_barang'] ?>">
					<input type="text" name="NamaBarang" value="<?php echo $data['nama_barang'] ?>">
				</td>					
			</tr>	
			<tr>
				<td>Jenis Barang</td>
				<td><input type="text" name="JenisBarang" value="<?php echo $data['jenis_barang'] ?>">
                </td>					
			</tr>	
			<tr>
				<td>Stock Barang</td>
				<td><input type="text" name="StockBarang" value="<?php echo $data['stock_barang'] ?>">
                </td>					
			</tr>
            <tr>
				<td>Harga Barang</td>
				<td><input type="text" name="HargaBarang" value="<?php echo $data['harga_barang'] ?>">
                </td>					
			</tr>	
			<tr>
				<td></td>
				<td><input type="submit" value="Simpan"></td>					
			</tr>				
		</table>
	</form>
	<?php } ?>
    
</body>
</html>