<!doctype html>
<html lang="en">
<head>
	<title>Barang</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	
</head>
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