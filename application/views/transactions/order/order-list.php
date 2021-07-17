<?php
defined('BASEPATH') or exit('No direct script access allowed');
$this->load->view('_partials/header');
?>
<!-- Main Content -->
<div class="main-content">
	<section class="section">
		<div class="section-header">
			<h1><?= $title ?></h1>
			<div class="section-header-breadcrumb">
				<div class="breadcrumb-item active"><a href="<?= site_url('Dashboard') ?>">Dashboard</a></div>
				<div class="breadcrumb-item">Transaksi</div>
				<div class="breadcrumb-item"><?= $title ?></div>
			</div>
		</div>

		<div class="section-body" id="list-data">
			<button class="btn btn-primary" id="btn-pluss"><i class="fas fa-plus"></i> Buat <?= $title ?> Baru</button>
			<div class="row mt-4">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-striped" id="table-order">
									<thead>
										<tr>
											<th>#</th>
											<th>Kode Pesanan</th>
											<th>Tanggal</th>
											<th>Deskripsi</th>
											<th>Pelanggan</th>
											<th class="text-center">Total</th>
											<th class="text-right">DP</th>
											<th>Pembayaran</th>
											<th>Kunci</th>
											<th>Status</th>

											<th class="text-center">Aksi</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- BEGIN FORM ADD CONTENT -->
		<div class="section-body" id="form-create">
			<div class="row mt-4">
				<div class="col-md-12">
					<div class="text-left">
						<button type="button" class="btn btn-primary" id="btn-back"><i class="fa fa-arrow-left"></i> Kembali</button>
					</div>
					<div class="text-right">

					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-12">

					<div class="card">
						<div class="card-header">
							<div class="card-title" id="header-form">
							</div>
						</div>
						<form action="" id="createOrder" class="needs-validation" novalidate>
							<div class="card-body">
								<!-- form start -->
								<div class="row">
									<div class="col-4">
										<div class="form-group">
											<label for="trans_id">Kode Pesanan</label>
											<input type="text" name="trans_id" id="trans_id" class="form-control" disabled>
										</div>
									</div>
									<div class="col-4">
										<div class="form-group">
											<label for="tanggal">Tanggal</label>
											<input type="date" name="tanggal" id="tanggal" class="form-control" required min="<?= date('Y-m') . '-01' ?>" max="<?= date('Y-m-d') ?>" value="<?= date('Y-m-d') ?>">
										</div>
									</div>
									<div class="col-4">
										<div class="form-group">
											<label for="customer_id">Pelanggan</label>
											<select name="customer_id" id="customer_id" class="form-control" required>
												<option value="">-</option>
												<?php foreach ($customers as $rowData) : ?>
													<option value="<?= $rowData['customer_id'] ?>"><?= $rowData['customer_id'] . ' ' . $rowData['cus_name'] ?></option>
												<?php endforeach ?>
											</select>
										</div>
									</div>





									<div class="col-8">
										<label for="keterangan">Keterangan</label>
										<textarea name="description" id="keterangan" cols="30" rows="5" class="form-control" required></textarea>
									</div>

									<div class="col-12 mt-4">
										<div class="table-responsive">
											<table class="table table-bordered table-sm" id="tbl_posts">
												<thead>
													<tr>
														<th class="text-center">#</th>
														<th style="width: 30%;">Produk</th>
														<th>Ukuran</th>
														<th>Harga @</th>
														<th>Qty</th>
														<th>Satuan</th>
														<th>Jumlah</th>
														<th class="no-content"></th>
													</tr>
												</thead>

												<tbody id="tbl_posts_body" class="contents"> </tbody>

											</table>
											<a href="#" class="btn btn-secondary btn-sm btn-block add-record" data-added="0"><i class="fa fa-plus"></i> Tambah Baris</a>
										</div>
									</div>
								</div>

							</div>

							<div class="card-footer">
								<div class="row">
									<div class="col-6">
										<div class="form-group">
											<label for="total">Total</label>
											<input type="text" name="total" id="total" class="form-control total" required readonly>
										</div>
									</div>
									<div class="col-6">
										<div class="form-group">
											<label for="dp">DP (Down Payment) / Uang Muka (30%)</label>
											<input type="text" name="dp" id="dp" class="form-control dp" data-type='currency' required readonly>
										</div>
									</div>
								</div>


								<div class="text-right">
									<button type="button" class="btn btn-secondary" id="btn-cancel">Batal</button>
									<button type="submit" class="btn btn-primary" id="btn-submit">Simpan</button>
								</div>
							</div>
						</form>
						<!-- form end -->
					</div>
				</div>
			</div>
		</div>
		<!-- BEGIN FORM ADD CONTENT -->
	</section>
</div>




<div class="invisible">
	<table id="sample_table">
		<tr class="item">
			<td class="text-center">
				<span class="sn"></span>
			</td>
			<td>
				<select name="product_id[]" class="form-control form-calc product_id" id="product_id-" data-id="0" required>
					<option value="">-pilih produk-</option>
					<?php foreach ($product as $rowData) : ?>
						<option value="<?= $rowData['product_id'] ?>"><?= $rowData['product_id'] . ' ' . $rowData['product_name'] ?></option>
					<?php endforeach ?>
				</select>
			</td>
			<td>
				<input type="text" name="ukuran[]" id="ukuran" class="form-control" required>
			</td>
			<td>
				<input type="text" name="unit_price[]" id="unit_price-" class="form-control form-calc unit_price" readonly required up-ke='0'>
			</td>
			<td>
				<input type="number" name="qty[]" class="form-control form-calc qty" min="1" id="qty-" value="1" required>
			</td>
			<td>
				<input type="text" name="unit[]" class="form-control form-calc unit" readonly required>
			</td>
			<td>
				<input type="text" name="jumlah[]" id="jumlah-" class="form-control form-line jumlah" readonly required>
			</td>

			<td class="text-center" style="vertical-align: middle;">
				<a href="#" class="text-danger  btn-icon delete-record" data-id="0">
					<i class="fa fa-trash-alt"></i>
				</a>
			</td>
		</tr>
	</table>
</div>

<div id="previewData">
	<div class="downupPopup-content" id="previewHere">

	</div>
</div>


<?php $this->load->view('transactions/order/script'); ?>