<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Barang</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	
<!--CSS File-->
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<!--Bootstrap 3.3.7-->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<!--Ionicons-->
	<link rel="stylesheet" href="assets/css/ionicons.css">
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
                <span class="logo-mini"><b>S</b>P</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>Spring</b>POS</span>
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
					<li class="active"><a href="barang"><i class="fa fa-tags"></i><span>Barang</span></a></li>
					<li><a href="order"><i class="fa fa-shopping-cart"></i><span>Order</span></a></li>
				</ul>
			</section>
		</aside>


		<!--Content Wrapper-->
		<div class="content-wrapper">
			<!--Content Header-->
			<section class="content-header">
				<h1>Barang</h1>
			</section>

			<!--Main Content-->
			<section class="content">
			
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<form id="form-barang">
								<div class="box-body">
									<div class="row">
										<div class="col-md-6">
										<div class="form-group">
											Kode Barang <input type="text" class="form-control" name="kodeBarang" id="kodeBarang">
										</div>
										<div class="form-group">
											Nama Barang <input type="text" class="form-control" name="namaBarang" id="namaBarang">
										</div>
										</div>
										<div class="col-md-6">	
										<div class="form-group">
											Harga Barang 
											<div class="input-group">
                       							<span class="input-group-addon">Rp</span>
                          						<input type="number" class="form-control" name="harga" id="harga">
                        					</div>
										</div>
										<div class="form-group">
											Satuan <input type="text" class="form-control" name="satuan" id="satuan">
										</div>
									</div>
								</div>
							</div>	
							<div class="box-footer">
								<button type="button" class="btn btn-primary" onclick="simpan()">Submit</button>
							</div>
							</form>		
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">Table Data Barang</h3>
								<div class="box-tools">
									<div class="input-group input-group-sm" style="width: 150px;">
										<input type="text" id="search" class="form-control pull-right" placeholder="Search">
										<div class="input-group-btn">
											<button type="button" class="btn btn-default" onclick="loadData()">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="box-body">
								<table id="tabelBarang" class="table table-bordered table-striped">
									<thead>
										<tr>
										  <th>Kode Barang</th>
										  <th>Nama Barang</th>
										  <th>Harga Barang</th>
										  <th>Satuan</th>
								 	 	  <th>Action</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
   
	<script>
		var modeSubmit = 'insert';
		var tabelBarang;

		function getFormData($form){
		    var unindexed_array = $form.serializeArray();
		    var indexed_array = {};
		    $.map(unindexed_array, function(n, i){
		        indexed_array[n['name']] = n['value'];
		    });
		    return indexed_array;
		}

		function loadData() {
			var search = $('#search').val();
			var url = '';
			if (search == '') {
				url = 'barang/'
			} else {
				url = 'barang/search/?namaBarang=' + search
			}
			$.ajax({
				type: 'get',
				url: url,
				success: function(d) {
					tampilkanData(d);
				},
				error: function(d) {
					console.log('Error');
				}
			});
		}
		
		function tampilkanData(d) {
			tabelBarang.clear().draw();
			$(d).each(function(index, element) {
				tabelBarang.row.add([
					element.kodeBarang,
					element.namaBarang,
					element.harga,
					element.satuan,
						'<input class="btn btn-default btn-sm" type="button" value="Edit" onclick="load(\'' + element.kodeBarang + '\')"> &nbsp;' +
         				'<input class="btn btn-danger btn-sm" type="button" value="Hapus" onclick="hapus(\'' + element.kodeBarang + '\')">'
				]).draw();
			})
		}

        function simpan() {
            var method;
            var data = getFormData($('#form-barang'));
			if(modeSubmit == 'insert') {
				method = 'post';
			} else {
				method = 'put';
			}
			$.ajax({
                type: method,
                url: 'barang/',
                data: JSON.stringify(data),
                contentType: 'application/json',
                success: function(d) {
                    loadData();
                    modeSubmit = 'insert';
                    $('#kodeBarang, #namaBarang, #harga, #satuan').val('');
                },
                error: function(d) {
					console.log('Error');
                }
            });
        }

        function hapus(kodeBarang) {
            $.ajax({
                type: 'delete',
                url: 'barang/' + kodeBarang,
                success: function(d) {
                    loadData();
                },
                error: function(d) {
					console.log('Error');
                }
            });
        }

        function load(kodeBarang) {
			$.ajax({
				type: 'get',
				url: 'barang/' + kodeBarang,
				success: function(d) {
					$('#kodeBarang').val(d.kodeBarang);
					$('#namaBarang').val(d.namaBarang);
					$('#harga').val(d.harga);
					$('#satuan').val(d.satuan);
					modeSubmit = 'update';
				},
                error: function(d) {
					console.log('Error');
                }
			});
        }

        $(document).ready(function() {
			loadData();
			tabelBarang = $('#tabelBarang').DataTable({
				'searching' : false,
				'lengthChange' : false,
				'lengthMenu' : [10]
			});
        });
	</script>
</body>
</html>
