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
                <div class="breadcrumb-item">Pengaturan</div>
                <div class="breadcrumb-item"><?= $title ?></div>
            </div>
        </div>

        <div class="section-body">
            <button class="btn btn-primary" id="btn-tambah"><i class="fas fa-plus"></i> Setoran Modal</button>

            <div class="row mt-4">
                <div class="col-12 col-sm-12 col-lg-12">
                    <div class="card">
                        <div class="card-body">

                            <table class='table table-sm table-hover table-striped' id="table-menu">
                                <thead style="background-color: #4361ee; color: #fff">
                                    <tr>
                                        <th class='text-left' style="width: 10%;">No Bukti</th>
                                        <th style="width: 10%;">Tanggal</th>
                                        <th style="width: 20%;">Keterangan</th>
                                        <th style="width: 15%;">Total</th>
                                        <!-- <th class='text-center' style="width: 10%;">Aksi</th> -->
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal-label"></h5>
            </div>
            <form method="POST" id="form-tambah" form-type='' class="needs-validation" novalidate>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="tcode">No Bukti</label>
                        <input type="text" name="trans_id" value="" id="trans_id" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="trans_date">Tanggal</label>
                        <input type="date" name="trans_date" value="" id="trans_date" max="<?= date('Y-m-d') ?>" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="description">Keterangan</label>
                        <input type="text" name="description" value="" id="description" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="trans_total">Nominal</label>
                        <input type="text" name="trans_total" value="" id="trans_total" class="form-control" required data-type='currency'>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="btn-close">Batal</button>
                    <button type="submit" class="btn btn-primary" id="btn-submit">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<?php $this->load->view('_partials/footer'); ?>
<?php $this->load->view('transactions/modal/script'); ?>