<html>
    <head>
    	<title>Mini Market</title>  
        <link rel="stylesheet" type="text/css" href="minimarket.css">
        <script type="text/javascript" src="jquery.js"></script>
    </head>
    <body>
        <header>
            <center><h1>MINI MARKET</h1></center>    
        </header>
        <main>
            <div class="wrapper">
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
								<input type="hidden" size="50px" name="NoBarang" value="<?php echo $data['no_barang'] ?>">
								<input type="text" size="50px" name="NamaBarang" value="<?php echo $data['nama_barang'] ?>">
							</td>					
						</tr>	
						<tr>
							<td>Jenis Barang</td>
							<td><input type="text" size="50px" name="JenisBarang" value="<?php echo $data['jenis_barang'] ?>">
                			</td>					
						</tr>	
						<tr>
							<td>Stock Barang</td>
							<td><input type="text" size="50px" name="StockBarang" value="<?php echo $data['stock_barang'] ?>">
                			</td>					
						</tr>
            			<tr>
							<td>Harga Barang</td>
							<td><input type="text" size="50px" name="HargaBarang" value="<?php echo $data['harga_barang'] ?>">
                		</td>					
						</tr>				
					</table>
        			<input type="submit" nama="insert" value="Simpan">			
					<input type="reset" name="clear" value="Clear">	
				</form>
				<?php } ?>
        		<center><a href="data.php"><button id="">Tampilkan Data</button></a></center>
        	</div><br>
        	<div class="right">
            	<img src="kisspng-superette-logo-mini-market-5b238a9eee7b93.5761073515290559029768.png"  width="480" height="400">
        	</div>
        </main>
    </body>
</html> 