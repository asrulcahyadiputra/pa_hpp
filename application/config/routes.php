<?php
defined('BASEPATH') or exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
*/
$route['default_controller'] = 'Dashboard';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

##########################################################################
# 						-MAIN ROUTING- 					   #
##########################################################################
$route['Dasboard']                    = 'Dashboard';
$route['login']                       = 'Auth';
$route['login/verify']                = 'Auth/verification';
$route['logout']                      = 'Auth/log_out';




##########################################################################
# 						-DATA MASTER- 					   	   #
##########################################################################

/*
| -------------------------------------------------------------------------
| customer master
| -------------------------------------------------------------------------
*/
$route['master/pelanggan']                = 'master/Customer';
$route['master/pelanggan/add']            = 'master/Customer/add';
$route['master/pelanggan/edit/(:any)']        = 'master/Customer/edit/$1';
$route['master/pelanggan/deleted/(:any)']    = 'master/Customer/deleted/$1';

/*
| -------------------------------------------------------------------------
| products master
| -------------------------------------------------------------------------
*/
$route['master/produk']                = 'master/Product';
$route['master/produk/add']            = 'master/Product/add';
$route['master/produk/edit/(:any)']    = 'master/Product/edit/$1';
$route['master/produk/deleted/(:any)']    = 'master/Product/deleted/$1';

/*
| -------------------------------------------------------------------------
| materials master
| -------------------------------------------------------------------------
*/
$route['master/bahan_baku']                = 'master/Material';
$route['master/bahan_baku/add']            = 'master/Material/add';
$route['master/bahan_baku/edit/(:any)']        = 'master/Material/edit/$1';
$route['master/bahan_baku/deleted/(:any)']    = 'master/Material/deleted/$1';

/*
| -------------------------------------------------------------------------
| materials master
| -------------------------------------------------------------------------
*/
$route['master/karyawan']                = 'master/Employee';
$route['master/karyawan/add']                = 'master/Employee/add';
$route['master/karyawan/edit/(:any)']        = 'master/Employee/edit/$1';
$route['master/karyawan/deleted/(:any)']    = 'master/Employee/deleted/$1';

/*
| -------------------------------------------------------------------------
| materials master
| -------------------------------------------------------------------------
*/
$route['master/coa']                    = 'master/Coa';
$route['master/coa/add']                    = 'master/Coa/add';
$route['master/coa/update/(:any)']            = 'master/Coa/update/$1';
##########################################################################
# 						-Transactions- 					   #
##########################################################################

/*
| -------------------------------------------------------------------------
| Bill of
| -------------------------------------------------------------------------
*/
$route['transaksi/bom']                                = 'transactions/Bom';
$route['transaksi/get_bom']                            = 'transactions/Bom/get_Bom';
$route['transaksi/bom/edit/(:any)']                    = 'transactions/Bom/edit/$1';
$route['transaksi/bom/find/(:any)']                    = 'transactions/Bom/find/$1';
$route['transaksi/bom/delete/(:any)']                  = 'transactions/Bom/delete/$1';


$route['transaksi/bom/create/(:any)']                  = 'transactions/Bom/create/$1';
$route['transaksi/bom/store']                          = 'transactions/Bom/store';
$route['transaksi/bom/update/(:any)']                  = 'transactions/Bom/update/$1';

$route['transaksi/bom/show/(:any)']                    = 'transactions/Bom/show/$1';
$route['transaksi/bom/find_material']                  = 'transactions/Bom/find_material';
$route['transaksi/bom/store_item']                     = 'transactions/Bom/store_item';
$route['transaksi/bom/delete_item/(:any)/(:any)']      = 'transactions/Bom/delete_item/$1/$2';

/*
| -------------------------------------------------------------------------
| Sales order
| -------------------------------------------------------------------------
*/
$route['transaksi/pesanan']                             = 'transactions/Order';
$route['transaksi/get_order']                           = 'transactions/Order/get_order';
$route['transaksi/pesanan/store']                       = 'transactions/Order/store';
$route['transaksi/pesanan/find/(:any)']                 = 'transactions/Order/select/$1';
$route['transaksi/pesanan/bayar']                       = 'transactions/Order/lunas';
$route['transaksi/pesanan/delete/(:any)']               = 'transactions/Order/delete/$1';


$route['transaksi/order/find_product']                  = 'transactions/Order/find_product';
$route['transaksi/pesanan/add']                         = 'transactions/Order/add';


/*
| -------------------------------------------------------------------------
| Purchasing
| -------------------------------------------------------------------------
*/
$route['transaksi/pembelian']                                = 'transactions/Purchase';
$route['transaksi/pembelian/create_draff']                    = 'transactions/Purchase/create_draff';
$route['transaksi/pembelian/draff/(:any)']                    = 'transactions/Purchase/create/$1';
$route['transaksi/pembelian/add_item']                        = 'transactions/Purchase/add_item';
$route['transaksi/pembelian/delete_item/(:any)/(:any)']        = 'transactions/Purchase/delete_item/$1/$2';
$route['transaksi/pembelian/store/(:any)/(:any)/(:any)/(:any)']    = 'transactions/Purchase/store/$1/$2/$3/$4';

/*
| -------------------------------------------------------------------------
| Produksi
| -------------------------------------------------------------------------
*/
$route['transaksi/produksi']                                    = 'transactions/Production';
$route['transaksi/produksi/create']                             = 'transactions/Production/create';
$route['transaksi/produksi/load']                               = 'transactions/Production/load_bom';
$route['transaksi/produksi/find_product/(:any)']                = 'transactions/Production/find_order/$1';
$route['transaksi/produksi/store']                              = 'transactions/Production/store';


$route['transaksi/produksi/konversi/(:any)']                    = 'transactions/Production/conversion/$1';
$route['transaksi/produksi/production_step/(:any)']             = 'transactions/Production/production_step/$1';
$route['store/btkl']                                            = 'transactions/Production/store_btkl';
$route['delete/btkl/(:any)/(:any)']                             = 'transactions/Production/delete_btkl/$1/$2';
$route['done/btkl/(:any)/(:any)']                               = 'transactions/Production/done_btkl/$1/$2';
$route['store/bop']                                             = 'transactions/Production/store_bop';
$route['delete/bop/(:any)/(:any)']                              = 'transactions/Production/delete_bop/$1/$2';
$route['done/bop/(:any)/(:any)']                                = 'transactions/Production/done_bop/$1/$2';
$route['transaksi/produksi/selesai/(:any)']                     = 'transactions/Production/done_production/$1';


##########################################################################
# 						-Reports- 					   	   #
##########################################################################

/*
| -------------------------------------------------------------------------
| General Ledger
| -------------------------------------------------------------------------
*/
$route['laporan/jurnal']                                    = 'reports/General_ledger';

/*
| -------------------------------------------------------------------------
| Ledger
| -------------------------------------------------------------------------
*/
$route['laporan/buku_besar']                                = 'reports/Ledger';


/*
| -------------------------------------------------------------------------
| Order Card
| -------------------------------------------------------------------------
*/
$route['laporan/kartu_pesanan']                            = 'reports/Order_card';

/*
| -------------------------------------------------------------------------
| COGS Report
| -------------------------------------------------------------------------
*/
$route['laporan/hpp']                                    = 'reports/Cogs';
$route['laporan/hpp/load_report/(:any)']                 = 'reports/Cogs/load_report/$1';

/*
| -------------------------------------------------------------------------
| Setting Menu
| -------------------------------------------------------------------------
*/
$route['setting/menu']                                  = 'setting/Menu';
$route['setting/menu/store']                            = 'setting/Menu/store';
$route['setting/menu/store_akses']                      = 'setting/Menu/store_akses';
$route['setting/menu/update']                           = 'setting/Menu/update';
$route['setting/menu/delete/(:any)']                    = 'setting/Menu/destroy/$1';
$route['setting/menu/select/(:any)']                    = 'setting/Menu/select/$1';
$route['setting/menu/get_menu']                         = 'setting/Menu/load_menu_list';
$route['setting/menu/load_akses/(:any)']                = 'setting/Menu/load_akses/$1';


/*
| -------------------------------------------------------------------------
| Setting Menu
| -------------------------------------------------------------------------
*/
$route['setting/user']                                  = 'setting/Users';
$route['setting/user/get_user']                         = 'setting/Users/all';
$route['setting/user/store']                            = 'setting/Users/store';
$route['setting/user/update']                           = 'setting/Users/update';
$route['setting/user/select/(:any)']                    = 'setting/Users/select/$1';
$route['setting/user/delete/(:any)']                    = 'setting/Users/destroy/$1';

/*
| -------------------------------------------------------------------------
| Setor modal awal
| -------------------------------------------------------------------------
*/
$route['transaksi/modal']                                  = 'transactions/Modal';
$route['transaksi/modal/get_data']                         = 'transactions/Modal/all';
$route['transaksi/modal/store']                            = 'transactions/Modal/store';
