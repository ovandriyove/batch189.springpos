<!doctype html>
<html lang="en">
<head>
	<title>Order</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

</head>		
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
									<button type="button" class="btn btn-primary" onclick="simpanOrder()">Submit Order</button>
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