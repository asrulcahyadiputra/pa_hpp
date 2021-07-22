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
				<div class="breadcrumb-item">Laporan</div>
				<div class="breadcrumb-item"><?= $title ?></div>
			</div>
		</div>

		<div class="section-body">
			<?php if ($this->session->flashdata('success')) : ?>
				<div class="alert alert-success alert-dismissible fade show mt-3 col-md-4" role="alert">
					<strong>Berhasil !</strong> <?= $this->session->flashdata('success') ?>
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			<?php endif ?>
			<?php if ($this->session->flashdata('error')) : ?>
				<div class="alert alert-danger alert-dismissible fade show mt-3 col-md-4" role="alert">
					<strong>Gagal !</strong> <?= $this->session->flashdata('error') ?>
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			<?php endif ?>
			<?php if ($this->session->flashdata('warning')) : ?>
				<div class="alert alert-warning alert-dismissible fade show mt-3 col-md-4" role="alert">
					<strong>Peringatan !</strong> <?= $this->session->flashdata('warning') ?>
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			<?php endif ?>
			<div class="row mt-4">
				<div class="col-6">
					<div class="card mb-4">
						<div class="card-body">
							<form class="form-inline" method="POST" action="<?= site_url('laporan/buku_besar') ?>">
								<div class="input-group mb-2 mr-sm-2">
									<div class="input-group-prepend">
										<div class="input-group-text"><i class="fa fa-list"></i></div>
									</div>
									<select name="account_name" id="account_name" class="form-control">
										<option value="">--pilih--</option>
										<?php foreach ($list_akun as $ls) : ?>
											<option value="<?= $ls['account_name'] ?>"><?= $ls['account_name'] ?></option>
										<?php endforeach ?>
									</select>
								</div>
								<div class="input-group mb-2 mr-sm-2">
									<div class="input-group-prepend">
										<div class="input-group-text"><i class="fa fa-calendar"></i></div>
									</div>
									<input type="month" class="form-control" id="periode" placeholder="periode" name="periode">
								</div>
								<button type="submit" class="btn btn-primary mb-2"><i class="fa fa-search"></i></button>
							</form>
						</div>
					</div>
				</div>
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-12 mb-4" style="border-bottom: double;">
									<div class="text-center">
										<h4>KONVEKSI KEN JR</h4>
										<h6>Buku Besar <?= $akun ?></h6>
										<h6>Periode <?= bulan($month) . ' ' . $year ?></h6>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-12">
									<div class="table-responsive">
										<table class="table table-sm  table-bordered">
											<thead style="background-color: #4361ee; color: #fff">
												<tr class="text-center">
													<th style="vertical-align: middle;" rowspan="2">Tanggal</th>
													<th style="vertical-align: middle;" rowspan="2">Keterangan</th>
													<th style="vertical-align: middle;" rowspan="2">Ref</th>
													<th style="vertical-align: middle;" rowspan="2">Debet</th>
													<th style="vertical-align: middle;" rowspan="2">Kredit</th>
													<th style="vertical-align: middle;" colspan="2">Saldo</th>
												</tr>
												<tr class="text-center">
													<th>Debet</th>
													<th>Kredit</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><?= '01-' . $month . '-' . $year  ?></td>
													<td><?= 'Saldo Awal ' . $akun ?></td>
													<td colspan="3" class=" table-active "></td>

													<td>
														<span class="text-left">Rp</span>
														<span style="float:right;">
															<?php if ($first['saldo_normal'] == 'd') {
																$saldo_awal_debet = $first['opening_debet'] - $first['opening_kredit'];
															} else {
																$saldo_awal_debet = 0;
															} ?>

															<?php
															if ($saldo_awal_debet > 0) {
																echo nominal1($saldo_awal_debet);
															} else {
																echo nominal1(0);
															}

															?>
														</span>
													</td>
													<td>
														<span class="text-left">Rp</span>
														<span style="float:right;">
															<?php if ($first['saldo_normal'] == 'k') {
																$saldo_awal_kredit = $first['opening_kredit'] - $first['opening_debet'];
															} else {
																$saldo_awal_kredit = 0;
															} ?>
															<?php

															if ($saldo_awal_kredit > 0) {
																echo nominal1($saldo_awal_kredit);
															} elseif ($saldo_awal_debet < 0) {
																echo nominal1($saldo_awal_debet * -1);
															} else {
																echo nominal1(0);
															}

															?>

														</span>
													</td>
												</tr>
												<?php
												$debet = 0;
												$kredit = 0;
												foreach ($all as $b) : ?>
													<tr>
														<td><?= date('d-m-Y H:i:s', strtotime($b['gl_date'])) ?></td>
														<td><?= $b['account_name'] ?></td>
														<td><?= $b['trans_id'] ?></td>
														<td>
															<span class="text-left">Rp</span>
															<span style="float:right;">
																<?= nominal1($b['debet']) ?>
															</span>
														</td>
														<td>
															<span class="text-left">Rp</span>
															<span style="float:right;">
																<?= nominal1($b['kredit']) ?>
															</span>
														</td>

														<!-- begin saldo -->
														<?php
														if ($b['normal_balance'] == 'd') {
															$debet = $debet + ($b['debet'] - $b['kredit']);
														} else {
															$kredit = $kredit + ($b['kredit'] - $b['debet']);
														}
														?>
														<!-- saldo debet -->
														<?php if ($b['normal_balance'] == 'd') {
															$saldo_awal = $first['opening_debet'] - $first['opening_kredit'];
															$saldo_debet = ($saldo_awal + $debet);
														} else {
															$saldo_debet = 0;
														} ?>
														<!-- saldo kredit -->
														<?php if ($b['normal_balance'] == 'k') {
															$saldo_awal = $first['opening_debet'] - $first['opening_kredit'];
															$saldo_kredit = ($saldo_awal + $kredit);
														} else {
															$saldo_kredit = 0;
														} ?>
														<td>
															<span class="text-left">Rp</span>
															<span style="float:right;">
																<?php
																if ($saldo_debet > 0) {
																	echo nominal1($saldo_debet);
																} else {
																	echo nominal1(0);
																}
																?>
															</span>
														</td>

														<td>
															<span class="text-left">Rp</span>
															<span style="float:right;">
																<?php
																if ($saldo_kredit > 0) {
																	echo nominal1($saldo_kredit);
																} elseif ($saldo_debet < 0) {
																	echo nominal1($saldo_debet * -1);
																} else {
																	echo nominal1(0);
																}
																?>
															</span>
														</td>
													</tr>
												<?php endforeach ?>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<?php $this->load->view('_partials/footer'); ?>