<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $(document).ready(function() {
        var action_html = '<a href="#" id="btn-edit" class="text-warning"><i class="fa fa-pen"></i></a> <a href="#" id="btn-delete" class="text-danger ml-3"><i class="fa fa-trash"></i></a>'
        var table_menu = $('#table-menu').DataTable({
            "paging": true,
            "ordering": false,
            "info": true,
            "columnDefs": [{
                    "searchable": true,
                    "orderable": false,
                    "targets": 0,
                    "className": 'text-center'
                },
                {
                    "searchable": false,
                    "orderable": false,
                    "targets": 4,
                    "data": null,
                    'className': 'text-center',
                    'defaultContent': action_html,
                },
                {
                    'targets': 3,
                    'data': 'trans_total',
                    'className': 'text-right',
                    'render': $.fn.dataTable.render.number('.', ',', 0, 'Rp ')
                }
            ],

            "columns": [{
                    data: 'trans_id'
                },
                {
                    data: 'trans_date'
                },
                {
                    data: 'description'
                }

            ]
        })

        // table_menu.on('order.dt search.dt', function() {
        //     table_menu.column(0, {
        //         search: 'applied',
        //         order: 'applied'
        //     }).nodes().each(function(cell, i) {
        //         cell.innerHTML = i + 1;
        //     });
        // }).draw();

        function load_menu() {
            table_menu.clear().draw()
            $.ajax({
                type: 'GET',
                url: '<?= base_url('transaksi/modal/get_data') ?>',
                dataType: 'JSON',
                success: function(res) {
                    // console.log(res)
                    table_menu.rows.add(res).draw(false)
                },
                error: function(err) {
                    // console.log(err)
                    Swal.fire({
                        title: 'Error',
                        icon: 'error',
                        text: 'Internal Server Error',
                        buttonsStyling: true,
                        confirmButtonText: 'OK',
                        confirmButtonColor: '#3f37c9',
                    })
                }
            })
        }
        load_menu()

        $('#btn-tambah').on('click', function(e) {
            e.preventDefault()
            $('#form-tambah').attr('form-type', 'store');
            $('#trans_id').attr('readonly', 'readonly');
            $('#trans_id').val('AUTO');
            $('#modal-label').html('Tambah Penyetoran Modal');
            $('#addModal').modal('show');
        })

        table_menu.on('click', '#btn-edit', function(e) {
            e.preventDefault()
            var id = $(this).closest('tr').find('td').eq(0).html();
            edit(id)
            $('#form-tambah').attr('form-type', 'update');
            $('#modal-label').html('Edit Setoran Modal')
            $('#addModal').modal('show')
        })

        table_menu.on('click', '#btn-delete', function(e) {
            e.preventDefault
            var id = $(this).closest('tr').find('td').eq(0).html();
            Swal.fire({
                title: 'Anda Yakin?',
                text: "Data " + id + " akan dihapus secara permanen",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3f37c9',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Hapus'
            }).then((result) => {
                if (result.isConfirmed) {
                    destroy(id)
                    load_menu()
                }
            })
        })



        $('#btn-close').on('click', function(e) {
            e.preventDefault
            $('#addModal').modal('hide')
            $("#form-tambah").trigger("reset");
        })

        $('#form-tambah').on('submit', function(e) {
            e.preventDefault()
            var form_type = $(this).attr("form-type")
            if (form_type == 'store') {
                var url = '<?= base_url('transaksi/modal/store') ?>'
            } else {
                var url = '<?= base_url('transaksi/modal/update') ?>'
            }

            var form_data = $(this).serialize();
            simpan(form_data, url)

        })

        $('#form-akses').on('click', '#btn-load-akses', function(e) {
            e.preventDefault()
            var role_id = $('#role_id').val()
            html = ''
            if (role_id != '') {
                $.ajax({
                    type: 'GET',
                    url: '<?= base_url('setting/menu/load_akses/') ?>' + role_id,
                    dataType: 'JSON',
                    success: function(res) {
                        var data = res.list
                        var values = res.value_selected

                        console.log(values)

                        $("#list").find('[value=' + values.join('], [value=') + ']').prop("checked", true);
                        // console.log(res)
                        html += `<table class="table table-sm table-bordered">
                        <thead style="background-color: #4361ee; color: #fff">
                            <tr>
                                <th  class="text-center" style='width:10%'>Tcode</th>
                                <th style='width:30%'>Menu</th>
                                <th  class="text-center" style='width:5%'>Akses</th>
                            </tr>
                        </thead>
                        <tbody>
                        <div id="list">`
                        for (let i = 0; i < data.length; i++) {
                            html += `<tr>
                                <td class="text-center">` + data[i].tcode + `</td>
                                <td>` + data[i].menu_name + `</td>
                                <td class="text-center">
                                <input type="checkbox" name="tcode[]" value="` + data[i].tcode + `"/> 
                                </td>
                            </tr>`
                        }
                        html += `</div>
                        </tbody>
                    </table>
                    <div class="text-right mt-4">
                        <button type="submit" class='btn btn-primary col-2'>Simpan</button>
                    </div>`

                        $('#load-akses-here').html(html)
                    },
                    error: function(err) {
                        // console.log(err)
                        Swal.fire({
                            title: 'Error',
                            icon: 'error',
                            text: 'Internal Server Error',
                            buttonsStyling: true,
                            confirmButtonText: 'OK',
                            confirmButtonColor: '#3f37c9',
                        })
                    }
                })
            } else {
                Swal.fire({
                    title: 'Error',
                    icon: 'error',
                    text: 'Pilih Role ID terlebih dahulu',
                    buttonsStyling: true,
                    confirmButtonText: 'OK',
                    confirmButtonColor: '#3f37c9',
                })
            }

        })

        $('#form-akses').on('submit', function(e) {
            e.preventDefault()
            var form_data = $(this).serialize();
            $.ajax({
                type: 'POST',
                url: '<?= base_url('setting/menu/store_akses') ?>',
                data: form_data,
                dataType: 'JSON',
                success: function(data) {
                    Swal.fire(
                        'Berhasil',
                        'Akses Menu Berhasil Disimpan',
                        'success'
                    )
                }
            })
            console.log('submit')
        })

        function resetForm() {
            document.getElementById("#form-tambah").reset();
        }


        function simpan(form_data, url) {
            $.ajax({
                type: 'POST',
                url: url,
                data: form_data,
                dataType: 'JSON',
                success: function(res) {
                    Swal.fire({
                        title: res.title,
                        icon: res.icon,
                        text: res.text,
                        buttonsStyling: true,
                        confirmButtonText: 'OK',
                        confirmButtonColor: '#3f37c9',
                    })
                    $('#addModal').modal('hide')
                    $("#form-tambah").trigger("reset");
                    load_menu()
                },
                error: function(xhr, status, error) {
                    var errorMessage = xhr.status + ': ' + xhr.statusText

                    Swal.fire({
                        title: '500',
                        icon: 'error',
                        text: errorMessage,
                        buttonsStyling: true,
                        confirmButtonText: 'OK',
                        confirmButtonColor: '#3f37c9',
                    })
                }
            })
        }

        function edit(id) {
            $.ajax({
                type: 'GET',
                url: '<?= base_url('transaksi/modal/select/') ?>' + id,
                dataType: 'JSON',
                success: function(res) {
                    console.log(res)
                    $('#trans_id').val(res.trans_id)
                    $('#trans_date').val(res.trans_date)
                    $('#description').val(res.description)
                    $('#trans_total').val(res.trans_total)


                    $('#trans_id').prop('readonly', true);
                },
                error: function(xhr, status, error) {
                    var errorMessage = xhr.status + ': ' + xhr.statusText
                    Swal.fire({
                        title: '500',
                        icon: 'error',
                        text: errorMessage,
                        buttonsStyling: true,
                        confirmButtonText: 'OK',
                        confirmButtonColor: '#3f37c9',
                    })
                }
            })
        }

        function destroy(id) {
            $.ajax({
                type: 'DELETE',
                url: '<?= base_url('transaksi/modal/delete/') ?>' + id,
                dataType: 'JSON',
                success: function(res) {
                    Swal.fire(
                        'Deleted!',
                        res.message,
                        'success'
                    )
                },
                error: function(xhr, status, error) {
                    var errorMessage = xhr.status + ': ' + xhr.statusText
                    Swal.fire({
                        title: '500',
                        icon: 'error',
                        text: errorMessage,
                        buttonsStyling: true,
                        confirmButtonText: 'OK',
                        confirmButtonColor: '#3f37c9',
                    })
                }
            })
        }

    });
</script>


<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>