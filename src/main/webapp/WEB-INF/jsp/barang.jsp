<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
  	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
  	<script src="assets/js/jquery.min.js"></script>
  	<script src="assets/js/popper.min.js"></script>
  	<script src="assets/js/bootstrap.min.js"></script>
</head>

<body class="bg-light">
    <div class="container">
        <div class="row">
            
            <div class="col-md-3">
            	<h4 class="mb-3 mt-3" >Form Barang</h4>
            	<form id="form-barang">
                <div class="mb-3">
                    Kode Barang <input type="text" class="form-control" id="kodeBarang" name="kodeBarang">
                </div>
                <div class="mb-3">
                    Nama Barang <input type="text" class="form-control" id="namaBarang" name="namaBarang">
                </div>
                <div class="mb-3">
                    Harga <input type="text" class="form-control" id="harga" name="harga">
                </div>
                <div class="mb-3">
                    Satuan <input type="text" class="form-control" id="satuan" name="satuan">
                </div>
                <hr class="mb-4">
                <input class="btn btn-primary btn-lg" type="button" value="Submit" onclick="simpan()">
                </form>
            </div>
            
            <div class="col-md-9">
            	<h4 class="mb-3 mt-3">Data Barang</h4>
				<div class="table-responsive">
				  <table class="table table-striped table-sm">
				    <thead>
				      <tr>
				        <th>Kode Barang</th>
				        <th>Nama Barang</th>
				        <th>Harga</th>
				        <th>Satuan</th>
				        <th>Action</th>
				      </tr>
				    </thead>
				    <tbody id="data-barang">
				    </tbody>
				  </table>
				</div>    
            </div>
            
        </div>
    </div>
	<script>

		var modeSubmit = 'insert';

		function getFormData($form){
		    var unindexed_array = $form.serializeArray();
		    var indexed_array = {};
		    $.map(unindexed_array, function(n, i){
		        indexed_array[n['name']] = n['value'];
		    });
		    return indexed_array;
		}
		
		function tampilkanData(d) {
			var s = '';
			$(d).each(function(index, element) {
				s += '<tr>';
				s += '<td>' + element.kodeBarang + '</td>';
				s += '<td>' + element.namaBarang + '</td>';
				s += '<td>' + element.harga + '</td>';
				s += '<td>' + element.satuan + '</td>';
				s += '<td>' + 
						'<input class="btn btn-secondary btn-sm" type="button" value="Edit" onclick="load(\'' + element.kodeBarang + '\')"> &nbsp;' +
						'<input class="btn btn-danger btn-sm" type="button" value="Hapus" onclick="hapus(\'' + element.kodeBarang + '\')">' +
				     '</td>';
			    s += '</tr>';
			})
            $('#data-barang').html(s);
		}

        function loadData() {
            $.ajax({
                type: 'get',
                url: 'barang/',
                success: function(d) {
                    tampilkanData(d);
                },
                error: function(d) {
					console.log('Error');
                }
            });
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
        });

	</script>
</body>
</html>
