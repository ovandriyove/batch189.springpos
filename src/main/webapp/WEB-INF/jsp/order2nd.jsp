<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Order</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	
	<!--CSS File-->
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!--Bootstrap 3.3.7-->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<!--Font Awesome-->
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<!--Ionicons-->
	<link rel="stylesheet" href="assets/css/ionicons.min.css">
	<!--DataTables-->
	<link rel="stylesheet" href="assets/css/dataTables.bootstrap.min.css">
	<!-- bootstrap datepicker -->
	<link rel="stylesheet" href="assets/css/bootstrap-datepicker.min.css">
	<!--Theme style-->
	<link rel="stylesheet" href="assets/css/AdminLTE.min.css">
	<!--AdminLTE Skins-->
	<link rel="stylesheet" href="assets/css/skin-black.min.css">
	<!--Google font-->
	<link rel="stylesheet" href="assets/css/fonts.googleapis.css">

	<!--JS File-->
	<!--jQuery 3-->
	<script src="assets/js/jquery.min.js"></script>
	<!--Bootstrap 3.3.7-->
	<script src="assets/js/bootstrap.min.js"></script>
	<!--DataTables-->
	<script src="assets/js/jquery.dataTables.min.js"></script>
	<script src="assets/js/dataTables.bootstrap.min.js"></script>
	<!-- bootstrap datepicker -->
	<script src="assets/js/bootstrap-datepicker.min.js"></script>
	<!--AdminLTE App-->
	<script src="assets/js/adminlte.min.js"></script>
</head>

<body class="hold-transition skin-black sidebar-mini">
  <div class="wrapper">

        <header class="main-header">

            <!-- Logo -->
            <a href="index2.html" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>POS</b></span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>Point </b>of Sale</span>
            </a>

            <!-- Header Navbar -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- User Account Menu -->
                        <li class="dropdown user user-menu">
                            <!-- Menu Toggle Button -->
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <!-- The user image in the navbar-->
                                <img src="${pageContext.request.contextPath}/assets/img/iHateMyLife.jpg" class="user-image" alt="User Image">
                                <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                <span class="hidden-xs">iHateMyLife</span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- The user image in the menu -->
                                <li class="user-header">
                                    <img src="${pageContext.request.contextPath}/assets/img/iHateMyLife.jpg" class="img-circle" alt="User Image">

                                    <p>
										iHateMyLife
										<small>Bootcamp Trainee</small>
                                    </p>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" class="btn btn-default btn-flat">Sign Out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
		</header>

		<!--Left side column, contains the logo and sidebar-->
		<aside class="main-sidebar">
			<!--sidebar: style can be found in sidebar.less-->
			<section class="sidebar">
				<!--Sibar Menu-->
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">Menu</li>
					<li>
						<a href="barang">
							<i class="fa fa-tags"></i>
							<span>Barang</span>
						</a>
					</li>
					<li class="active">
						<a href="order">
							<i class="fa fa-shopping-cart"></i>
							<span>Order</span>
						</a>
					</li>
				</ul>
			</section>
		</aside>


		<!--Content Wrapper-->
		<div class="content-wrapper">
			<!--Content Header-->
			<section class="content-header">
				<h1>Order</h1>
			</section>
			
			<!--Main Content-->
			<section class="content">
			
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<form id="form-order">
								<div class="box-body">
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												Kode Transaksi <input type="text" class="form-control" name="kode" id="kode">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												Nama Pelanggan <input type="text" class="form-control" name="namaPelanggan" id="namaPelanggan">
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												Tanggal Transaksi
												<div class="input-group date">
													<div class="input-group-addon">
														<i class="fa fa-calendar"></i>
													</div>
													<input type="text" class="form-control" name="tglTransaksi" id="tglTransaksi">
												</div>
											</div>
										</div>										
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												Barang <select class="form-control" name="barang" id="barang"></select>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												Jumlah Barang <input type="number" class="form-control" name="jumlahBarang" id="jumlahBarang" value="1">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												&nbsp<br> <button type="button" class="btn btn-primary" onclick="tambahOrderDetail()">Tambah Barang</button>
											</div>
										</div>
										<div class="col-md-1">
											<div class="form-group"></div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				
			<div class="row">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Tabel Order Detail</h3>
						</div>
						<div class="box-body">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
									 <th>Kode Barang</th>
									 <th>Nama Barang</th>
									 <th>Harga Satuan</th>
									 <th>Jumlah Barang</th>
									 <th>Subtotal</th>
									 <th>Action</th>
									</tr>
								</thead>
								<tbody id="tabelOrderDetail"></tbody>
							</table>
						</div>
						<div class="box-footer">
							<div class="row" style="display: flex; align-items: flex-end">
								<div class="col-xs-8">
									<button type="buttin" class="btn btn-primary" onclick="simpanOrder()">Submit Order</button>
								</div>
								<div class="col-xs-4">
									Total
									<div class="input-group">
										<span class="input-group-addon">Rp</span>
										<input type="number" class="form-control" name="total" id="total" readonly>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
  		</section>
    </div>
</div>	

	<script>
        // fungsi utk membuat detailOrder yg akan disubmit 
        var orderDetails = [];
        function tambahOrderDetail() {
            var orderDetailBaru = true;
            $.each(orderDetails, function(index, element) {
                if (element.id.kodeBarang == $('#barang').val()) {
                    element.jumlahBarang = Number(element.jumlahBarang) + Number($('#jumlahBarang').val());
                    elementBaru = false;
                }
            });
            if (orderDetailBaru) {
                var orderDetail = {};
                orderDetail.id  = {};
                orderDetail.id.kodeOrder  = '';
                orderDetail.id.kodeBarang = $('#barang').val();
                orderDetail.hargaSatuan   = $('#barang > option:selected').data('harga');
                orderDetail.jumlahBarang  = $('#jumlahBarang').val();
                orderDetail.h_namaBarang  = $('#barang > option:selected').data('nama');

                orderDetails.push(orderDetail);
            }
            refreshDaftarBarang();
        }
        // fungsi utk input detailOrder ke object order & kirim data order
        var order = {};
        function simpanOrder() {
            $.each(orderDetails, function(index, element){
                element.id.kodeOrder  = $('#kode').val();
            });
			order.kode = $('#kode').val();
			order.namaPelanggan = $('#namaPelanggan').val();
			order.tglTransaksi = $('#tglTransaksi').val();
            order.orderDetails = orderDetails;
 
			$.ajax({
                type: 'POST',
                url: 'order/',
                data: JSON.stringify(order),
                contentType: 'application/json',
                success: function(d) {
                    order = {};
                    orderDetails = [];
                    refreshDaftarBarang();
                    $('#kode, #namaPelanggan, #tglTransaksi').val('');
                    $('#jumlahBarang').val('1');
                },
                error: function(d) {
					console.log('Error - simpan');
                }
            });
        }
        // fungsi utk refresh daftar barang & nilai total
        function refreshDaftarBarang() {
            var subTotal = 0;
            var total = 0;
            var s = '<tr>';
            $.each(orderDetails, function(index, element) {
                subTotal = element.hargaSatuan * element.jumlahBarang;
                s += '<td>' + element.id.kodeBarang + '</td>';
                s += '<td>' + element.h_namaBarang + '</td>';
                s += '<td>' + element.hargaSatuan + '</td>';
                s += '<td>' + element.jumlahBarang + '</td>';
                s += '<td>Rp' + subTotal + '</td>';
                s += '</tr>';
                total += subTotal;
            });
            $('#tabelOrderDetail').html(s);
            $('#total').val(total);
            $('#jumlahBarang').val('1');
        }	
		// fungsi awal utk load & data dropdown
		var dataBarang =[];
        function loadData() {
            $.ajax({
                type: 'GET',
                url: 'barang/',
                success: function(d) {
                    tampilkanData(d);
                },
                error: function(d) {
					console.log('Error - loadData');
                }
            });
        }
        function tampilkanData(d) {
			var s = '';
			$(d).each(function(index, element) {
                s += '<option value="' + element.kodeBarang 
                    + '" data-nama="' + element.namaBarang
                    + '" data-harga="' + element.harga + '">' 
                    + element.kodeBarang + ' - ' 
                    + element.namaBarang + ' - Rp' 
                    + element.harga 
                    + '</option>';
			});
            $('#barang').html(s);
        }
        // document.ready
        $(document).ready(function() {
			$('#tglTransaksi').datepicker({
				autoclose: true,
				format: 'yyyy-mm-dd'
			});
            loadData();
        });
	</script>
</body>
</html>