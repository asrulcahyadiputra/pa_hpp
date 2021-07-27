-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Waktu pembuatan: 27 Jul 2021 pada 23.03
-- Versi server: 5.7.32
-- Versi PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `pa_hpp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bill_of_materials`
--

CREATE TABLE `bill_of_materials` (
  `bom_id` bigint(20) NOT NULL,
  `trans_id` varchar(50) NOT NULL,
  `material_id` varchar(50) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `bill_of_materials`
--

INSERT INTO `bill_of_materials` (`bom_id`, `trans_id`, `material_id`, `qty`, `unit`) VALUES
(28, 'TRX-BOM-000000001', 'MTR-0004', 0.5, NULL),
(29, 'TRX-BOM-000000001', 'MTR-0005', 2, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `account_no` varchar(20) NOT NULL,
  `account_name` varchar(100) NOT NULL,
  `normal_balance` varchar(1) NOT NULL,
  `sub_code` char(3) NOT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`account_no`, `account_name`, `normal_balance`, `sub_code`, `status`) VALUES
('1-10001', 'Kas', 'd', '1-1', 1),
('1-10002', 'Piutang Penjualan', 'd', '1-1', 1),
('1-10003', 'Persediaan Bahan Baku', 'd', '1-1', 1),
('1-10004', 'Persedian Bahan Penolong', 'd', '1-1', 1),
('1-10005', 'Persediaan Produk Jadi', 'd', '1-1', 1),
('1-20001', 'Mesin Jahit', 'd', '1-2', 1),
('1-20002', 'Mesin Bordir', 'd', '1-2', 1),
('1-30001', 'Akta Notaris', 'd', '1-3', 1),
('2-10001', 'Pendapatan diterima dimuka', 'k', '2-1', 1),
('2-10002', 'Utang Usaha', 'k', '2-1', 1),
('2-10003', 'Utang Gaji dan Upah', 'k', '2-1', 1),
('2-20001', 'Utang Kredit Bank', 'k', '2-2', 1),
('3-10001', 'Modal Pemilik', 'k', '3-1', 1),
('4-10001', 'Penjualan', 'k', '4-1', 1),
('5-10001', 'Beban Administrasi dan Umum', 'd', '5-1', 1),
('5-20001', 'BDP-BBB', 'd', '5-2', 1),
('5-20002', 'BDP-BTKL', 'd', '5-2', 1),
('5-20003', 'BDP-BOP', 'd', '5-2', 1),
('5-20004', 'BDP-BBP', 'd', '5-2', 0),
('5-20005', 'BOP yang dibebankan', 'd', '5-2', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `coa_head`
--

CREATE TABLE `coa_head` (
  `head_code` char(1) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `coa_head`
--

INSERT INTO `coa_head` (`head_code`, `name`) VALUES
('1', 'Aktiva'),
('2', 'Pasiva'),
('3', 'Modal'),
('4', 'Penjualan'),
('5', 'Beban');

-- --------------------------------------------------------

--
-- Struktur dari tabel `coa_subhead`
--

CREATE TABLE `coa_subhead` (
  `sub_code` char(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `head_code` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `coa_subhead`
--

INSERT INTO `coa_subhead` (`sub_code`, `name`, `head_code`) VALUES
('1-1', 'Aktiva Lancar', '1'),
('1-2', 'Aktiva Tetap', '1'),
('1-3', 'Aktiva Tidak Berwujud', '1'),
('2-1', 'Kewajiban Jangka Pendek', '2'),
('2-2', 'Kewajiban Jangka Panjang', '2'),
('3-1', 'Modal', '3'),
('4-1', 'Penjualan ', '4'),
('5-1', 'Beban Operasional', '5'),
('5-2', 'Beban Produksi', '5');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `customer_id` varchar(20) NOT NULL,
  `cus_name` varchar(100) NOT NULL,
  `cus_address` text NOT NULL,
  `cus_phone` varchar(13) NOT NULL,
  `cus_email` varchar(100) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`customer_id`, `cus_name`, `cus_address`, `cus_phone`, `cus_email`, `date_created`, `deleted`, `deleted_at`) VALUES
('CUS-0001', 'Ujang Farhan', 'Jl Terusan Buah Batu No 12, Bandung', '082585654789', 'ujangfarhan@gmail.com', '2020-10-22 14:33:49', 0, NULL),
('CUS-0002', 'Kang Ical', 'Jl M Toha, Bandung', '081298789200', 'kangical@gmail.com', '2020-10-22 15:19:08', 0, NULL),
('CUS-0003', 'Neng Riska', 'Jl Soekar Hatta No 123, Bandung', '085654123400', 'negriska@gmail.com', '2020-10-22 15:20:28', 0, NULL),
('CUS-0004', 'Kang Jamal', 'Jl Bukit Baruga No 6A, Bandung', '081554456123', 'kangjamal@gmail.com', '2020-10-22 15:40:06', 0, NULL),
('CUS-0005', 'Neng Fatma', 'Jl Soekarno Hatta No 56A, Bandung', '085645879123', 'negfatma@gmail.com', '2020-10-22 18:47:34', 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `direct_labor_costs`
--

CREATE TABLE `direct_labor_costs` (
  `direct_labor_id` bigint(20) NOT NULL,
  `trans_id` varchar(50) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `cost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `direct_labor_costs`
--

INSERT INTO `direct_labor_costs` (`direct_labor_id`, `trans_id`, `employee_id`, `cost`) VALUES
(30, 'TRX-PRD-000000001', 'KAR-0001', 100000),
(31, 'TRX-PRD-000000001', 'KAR-0002', 250000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `direct_material_cost`
--

CREATE TABLE `direct_material_cost` (
  `id` int(11) NOT NULL,
  `material_id` varchar(20) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `trans_id` varchar(50) DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `unit_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `direct_material_cost`
--

INSERT INTO `direct_material_cost` (`id`, `material_id`, `qty`, `trans_id`, `type`, `unit_price`) VALUES
(57, 'MTR-0004', 25, 'TRX-PRD-000000001', 'BBB', 15000),
(58, 'MTR-0005', 100, 'TRX-PRD-000000001', 'BBB', 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

CREATE TABLE `employees` (
  `employee_id` varchar(50) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `employee_address` text NOT NULL,
  `employee_phone` varchar(13) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `employees`
--

INSERT INTO `employees` (`employee_id`, `employee_name`, `employee_address`, `employee_phone`, `department`, `status`, `date_created`, `date_updated`) VALUES
('KAR-0001', 'Kang Dandang Suherman', 'Bandung Juara', '087780087787', 'Potong Kain', 1, '2020-11-17 16:31:39', '2021-06-16 09:01:08'),
('KAR-0002', 'Neng Sulisa Tisna', 'Bandung Bermartabat', '085585850858', 'Jahit', 1, '2020-11-17 16:34:30', '2021-06-16 09:00:55'),
('KAR-0003', 'Ujang Doni Maulana', 'Bandung Kota Kembang', '081558855288', 'Potong Kain', 1, '2020-11-17 16:56:03', '2021-06-16 09:00:37'),
('KAR-0004', 'Teh Tia', 'Bojongsoang', '085145645545', 'Obras', 1, '2021-06-16 08:59:31', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `general_ledger`
--

CREATE TABLE `general_ledger` (
  `gl_id` bigint(20) NOT NULL,
  `account_no` varchar(20) NOT NULL,
  `periode` int(11) NOT NULL,
  `gl_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_id` varchar(50) NOT NULL,
  `nominal` double NOT NULL,
  `gl_balance` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `general_ledger`
--

INSERT INTO `general_ledger` (`gl_id`, `account_no`, `periode`, `gl_date`, `trans_id`, `nominal`, `gl_balance`) VALUES
(181, '1-10001', 202107, '2021-06-30 17:00:00', 'TRX-STM-000000001', 500000000, 'd'),
(182, '3-10001', 202107, '2021-06-30 17:00:00', 'TRX-STM-000000001', 500000000, 'k'),
(183, '1-10003', 202107, '2021-07-27 15:38:30', 'TRX-PMB-000000001', 5900000, 'd'),
(184, '1-10001', 202107, '2021-07-27 15:38:30', 'TRX-PMB-000000001', 5900000, 'k'),
(185, '1-10001', 202107, '2021-07-27 15:42:50', 'TRX-PSN-000000001', 825000, 'd'),
(186, '1-10002', 202107, '2021-07-27 15:42:50', 'TRX-PSN-000000001', 1925000, 'd'),
(187, '4-10001', 202107, '2021-07-27 15:42:50', 'TRX-PSN-000000001', 2750000, 'k'),
(208, '5-20001', 202107, '2021-07-27 16:04:48', 'TRX-PRD-000000001', 875000, 'd'),
(209, '1-10003', 202107, '2021-07-27 16:04:48', 'TRX-PRD-000000001', 875000, 'k'),
(210, '5-20002', 202107, '2021-07-27 16:04:48', 'TRX-PRD-000000001', 350000, 'd'),
(211, '2-10003', 202107, '2021-07-27 16:04:48', 'TRX-PRD-000000001', 350000, 'k'),
(212, '5-20003', 202107, '2021-07-27 16:04:48', 'TRX-PRD-000000001', 100000, 'd'),
(213, '5-20005', 202107, '2021-07-27 16:04:48', 'TRX-PRD-000000001', 100000, 'k'),
(214, '1-10005', 202107, '2021-07-27 16:04:48', 'TRX-PRD-000000001', 1325000, 'd'),
(215, '5-20001', 202107, '2021-07-27 16:04:48', 'TRX-PRD-000000001', 875000, 'k'),
(216, '5-20002', 202107, '2021-07-27 16:04:48', 'TRX-PRD-000000001', 350000, 'k'),
(217, '5-20003', 202107, '2021-07-27 16:04:48', 'TRX-PRD-000000001', 100000, 'k');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_access`
--

CREATE TABLE `menu_access` (
  `id` bigint(20) NOT NULL,
  `tcode` varchar(20) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu_access`
--

INSERT INTO `menu_access` (`id`, `tcode`, `role_id`) VALUES
(3, 'LP03', 2),
(4, 'LP04', 2),
(5, 'MD03', 2),
(6, 'MD04', 2),
(7, 'TR01', 2),
(8, 'TR03', 2),
(9, 'TR04', 2),
(10, 'LP01', 1),
(11, 'LP02', 1),
(12, 'LP03', 1),
(13, 'LP04', 1),
(14, 'MD01', 1),
(15, 'MD02', 1),
(16, 'MD03', 1),
(17, 'MD04', 1),
(18, 'MD05', 1),
(19, 'ST01', 1),
(20, 'ST02', 1),
(21, 'TR01', 1),
(22, 'TR02', 1),
(23, 'TR03', 1),
(24, 'TR04', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_head`
--

CREATE TABLE `menu_head` (
  `head_id` varchar(20) NOT NULL,
  `head_name` varchar(150) NOT NULL,
  `icon` longtext NOT NULL,
  `nu` int(11) NOT NULL,
  `id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu_head`
--

INSERT INTO `menu_head` (`head_id`, `head_name`, `icon`, `nu`, `id`) VALUES
('L01', 'Laporan', 'fas fa-file-invoice-dollar', 3, 'laporan'),
('M01', 'Master Data', 'fas fa-database', 1, 'master'),
('S01', 'Pengaturan', 'fas fa-cogs', 4, 'setting'),
('T01', 'Transaksi', 'fas fa-industry', 2, 'transaksi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_item`
--

CREATE TABLE `menu_item` (
  `tcode` varchar(20) NOT NULL,
  `nu` int(11) NOT NULL,
  `menu_name` varchar(150) NOT NULL,
  `menu_icon` longtext,
  `url` varchar(150) NOT NULL,
  `head_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu_item`
--

INSERT INTO `menu_item` (`tcode`, `nu`, `menu_name`, `menu_icon`, `url`, `head_id`) VALUES
('LP01', 1, 'Jurnal Umum', '-', 'laporan/jurnal', 'L01'),
('LP02', 2, 'Buku Besar', '-', 'laporan/buku_besar', 'L01'),
('LP03', 3, 'Kartu Pesanan', '-', 'laporan/kartu_pesanan', 'L01'),
('LP04', 4, 'Harga Pokok Produksi', '-', 'laporan/hpp', 'L01'),
('MD01', 1, 'Pelanggan', '-', 'master/pelanggan', 'M01'),
('MD02', 2, 'Karyawan', '-', 'master/karyawan', 'M01'),
('MD03', 3, 'Produk', '-', 'master/produk', 'M01'),
('MD04', 4, 'Bahan Baku', '-', 'master/bahan_baku', 'M01'),
('MD05', 5, 'Chart of Account', '-', 'master/coa', 'M01'),
('ST01', 1, 'Pengguna', '-', 'setting/user', 'S01'),
('ST02', 2, 'Menu', '-', 'setting/menu', 'S01'),
('TR01', 1, 'Bill of Materials', '-', 'transaksi/bom', 'T01'),
('TR02', 2, 'Pesanan', '-', 'transaksi/pesanan', 'T01'),
('TR03', 3, 'Pembelian', '-', 'transaksi/pembelian', 'T01'),
('TR04', 4, 'Produksi', '-', 'transaksi/produksi', 'T01'),
('TR05', 5, 'Setoran Modal', '-', 'transaksi/modal', 'T01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL,
  `trans_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `order_size` varchar(50) DEFAULT NULL,
  `order_qty` varchar(20) NOT NULL,
  `order_price` int(11) NOT NULL,
  `order_total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`order_id`, `trans_id`, `product_id`, `order_size`, `order_qty`, `order_price`, `order_total`) VALUES
(38, 'TRX-PSN-000000001', 'PRD-0001', 'All Size', '50', 55000, 2750000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `overhead_component`
--

CREATE TABLE `overhead_component` (
  `oc_id` char(5) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `overhead_component`
--

INSERT INTO `overhead_component` (`oc_id`, `name`) VALUES
('OV01', 'Biaya Tenaga Kerja Tidak Langsung'),
('OV02', 'Biaya perbaikan dna pemeliharaan Mesin'),
('OV03', 'Biaya Listrik dan Air'),
('OV04', 'Biaya Overhead Rupa-rupa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `overhead_cost`
--

CREATE TABLE `overhead_cost` (
  `id` bigint(20) NOT NULL,
  `trans_id` varchar(50) NOT NULL,
  `oc_id` char(5) NOT NULL,
  `overhead_cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `overhead_cost`
--

INSERT INTO `overhead_cost` (`id`, `trans_id`, `oc_id`, `overhead_cost`) VALUES
(31, 'TRX-PRD-000000001', 'OV02', 50000),
(32, 'TRX-PRD-000000001', 'OV03', 50000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `payment_id` bigint(20) NOT NULL,
  `trans_id` varchar(50) NOT NULL,
  `periode` int(11) NOT NULL,
  `nominal` double NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`payment_id`, `trans_id`, `periode`, `nominal`, `description`) VALUES
(27, 'TRX-PSN-000000001', 202107, 825000, 'Down Payment (DP)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `production_costs`
--

CREATE TABLE `production_costs` (
  `cost_id` bigint(20) NOT NULL,
  `trans_id` varchar(50) NOT NULL,
  `material_cost` double NOT NULL,
  `direct_labor_cost` double NOT NULL,
  `overhead_cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `production_costs`
--

INSERT INTO `production_costs` (`cost_id`, `trans_id`, `material_cost`, `direct_labor_cost`, `overhead_cost`) VALUES
(16, 'TRX-PRD-000000001', 875000, 350000, 100000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `sales_price` int(11) NOT NULL,
  `product_unit` varchar(50) NOT NULL,
  `product_category` varchar(100) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `date_updated` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `sales_price`, `product_unit`, `product_category`, `date_created`, `deleted`, `date_updated`, `deleted_at`) VALUES
('PRD-0001', 'Kaos Anak', 55000, 'Pcs', 'Kaos', '2020-10-22 19:26:07', 0, NULL, NULL),
('PRD-0002', 'Kaos Dewasa', 60000, 'Pcs', 'Kaos', '2020-10-22 19:29:25', 0, NULL, NULL),
('PRD-0003', 'Seragam Olahraga SD', 120000, 'Pcs', 'Pakaian Seragam', '2020-10-22 19:45:28', 0, NULL, NULL),
('PRD-0004', 'Kaos Polos', 55000, 'Pcs', 'Kaos ', '2020-11-19 16:37:46', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` bigint(20) NOT NULL,
  `trans_id` varchar(50) NOT NULL,
  `material_id` varchar(50) NOT NULL,
  `purchase_qty` int(11) NOT NULL,
  `purchase_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `trans_id`, `material_id`, `purchase_qty`, `purchase_price`) VALUES
(16, 'TRX-PMB-000000001', 'MTR-0001', 100, 23000),
(17, 'TRX-PMB-000000001', 'MTR-0004', 100, 15000),
(18, 'TRX-PMB-000000001', 'MTR-0005', 100, 5000),
(19, 'TRX-PMB-000000001', 'MTR-0011', 100, 16000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `raw_materials`
--

CREATE TABLE `raw_materials` (
  `material_id` varchar(50) NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `material_stock` double NOT NULL,
  `material_unit` varchar(50) NOT NULL,
  `material_type` char(20) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `raw_materials`
--

INSERT INTO `raw_materials` (`material_id`, `material_name`, `material_stock`, `material_unit`, `material_type`, `deleted`, `date_created`, `date_updated`, `deleted_at`) VALUES
('MTR-0001', 'Kain Katun', 0, 'Meter', 'BBB', 0, '2020-10-22 20:24:59', NULL, NULL),
('MTR-0004', 'Cotton Combed 40S', 0, 'Meter', 'BBB', 0, '2020-10-22 20:30:12', NULL, '2020-10-22 20:33:49'),
('MTR-0005', 'Benang', 0, 'Roll', 'BBB', 0, '2020-11-19 17:03:32', NULL, NULL),
('MTR-0008', 'Plastik Kemasan', 0, 'Pcs', 'BBP', 1, '2020-11-19 17:07:02', NULL, '2021-07-27 15:40:10'),
('MTR-0011', 'Kain Batik', 0, 'Meter', 'BBB', 0, '2021-04-17 03:08:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Produksi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transactions`
--

CREATE TABLE `transactions` (
  `trans_id` varchar(50) NOT NULL,
  `periode` int(11) DEFAULT NULL,
  `description` text,
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customer_id` varchar(20) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `order_done` date DEFAULT NULL,
  `production_step` int(11) DEFAULT NULL,
  `ref_production` varchar(50) DEFAULT NULL,
  `trans_total` double NOT NULL,
  `dp` double DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '1 = Aktif, 0 Tidak Aktif',
  `status_bayar` int(11) DEFAULT NULL COMMENT '0: belum lunas, 1: Lunas',
  `status_production` int(11) DEFAULT NULL COMMENT '0 Belum Produksi, 1 Dalam Produksi, 3 Sudah Produksi',
  `lock_doc` int(11) NOT NULL DEFAULT '1' COMMENT '0: Lock,1 : Open',
  `trans_type` varchar(100) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `transactions`
--

INSERT INTO `transactions` (`trans_id`, `periode`, `description`, `trans_date`, `customer_id`, `product_id`, `order_done`, `production_step`, `ref_production`, `trans_total`, `dp`, `status`, `status_bayar`, `status_production`, `lock_doc`, `trans_type`, `date_created`, `updated_at`) VALUES
('TRX-BOM-000000001', 202107, 'Bill Of Materials untuk Produk Kaos Anak All SIze', '2021-07-27 15:56:14', NULL, 'PRD-0001', NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 0, 'bom', '2021-07-27 15:41:18', '2021-07-27 15:56:14'),
('TRX-PMB-000000001', 202107, NULL, '2021-07-27 15:38:30', NULL, NULL, NULL, NULL, NULL, 5900000, NULL, 1, NULL, NULL, 1, 'purchasing', '2021-07-27 15:37:18', '2021-07-27 15:38:30'),
('TRX-PMB-000000002', 202107, NULL, '2021-07-27 16:06:43', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, 1, 'purchasing', '2021-07-27 16:06:43', NULL),
('TRX-PRD-000000001', 202107, 'Produksi untuk pesanan Neng RIska : Kaos Anak All size', '2021-07-26 17:00:00', NULL, NULL, NULL, NULL, 'TRX-PSN-000000001', 1325000, NULL, 1, NULL, NULL, 0, 'production', '2021-07-27 16:04:48', NULL),
('TRX-PSN-000000001', 202107, 'Pesanan Kaos Anak Neg Riska All Size', '2021-07-27 16:04:48', 'CUS-0003', NULL, '0000-00-00', NULL, NULL, 2750000, 825000, 1, NULL, 3, 0, 'order', '2021-07-27 15:42:50', '2021-07-27 16:04:48'),
('TRX-STM-000000001', 202107, 'Modal Awal Pemilik', '2021-06-30 17:00:00', NULL, NULL, NULL, NULL, NULL, 500000000, NULL, 1, NULL, NULL, 1, 'modal', '2021-07-27 15:37:04', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `type_of_materials`
--

CREATE TABLE `type_of_materials` (
  `id` char(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `type_of_materials`
--

INSERT INTO `type_of_materials` (`id`, `name`) VALUES
('BBB', 'Bahan Baku Utama'),
('BBP', 'Bahan Baku Penolong');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `password`, `role`, `status`) VALUES
(6, 'Riska', 'admin', '$2y$10$kez8d2lf4yabSsgLq4up5u6fLcjyY2JDNMVHbnzolR445rD29OOri', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bill_of_materials`
--
ALTER TABLE `bill_of_materials`
  ADD PRIMARY KEY (`bom_id`),
  ADD KEY `material_id` (`material_id`),
  ADD KEY `bill_of_materials_ibfk_3` (`trans_id`);

--
-- Indeks untuk tabel `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`account_no`),
  ADD KEY `sub_code` (`sub_code`);

--
-- Indeks untuk tabel `coa_head`
--
ALTER TABLE `coa_head`
  ADD PRIMARY KEY (`head_code`);

--
-- Indeks untuk tabel `coa_subhead`
--
ALTER TABLE `coa_subhead`
  ADD PRIMARY KEY (`sub_code`),
  ADD KEY `head_code` (`head_code`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeks untuk tabel `direct_labor_costs`
--
ALTER TABLE `direct_labor_costs`
  ADD PRIMARY KEY (`direct_labor_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `trans_id` (`trans_id`);

--
-- Indeks untuk tabel `direct_material_cost`
--
ALTER TABLE `direct_material_cost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trans_id` (`trans_id`);

--
-- Indeks untuk tabel `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indeks untuk tabel `general_ledger`
--
ALTER TABLE `general_ledger`
  ADD PRIMARY KEY (`gl_id`),
  ADD KEY `account_no` (`account_no`),
  ADD KEY `trans_id` (`trans_id`);

--
-- Indeks untuk tabel `menu_access`
--
ALTER TABLE `menu_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `tcode` (`tcode`);

--
-- Indeks untuk tabel `menu_head`
--
ALTER TABLE `menu_head`
  ADD PRIMARY KEY (`head_id`);

--
-- Indeks untuk tabel `menu_item`
--
ALTER TABLE `menu_item`
  ADD PRIMARY KEY (`tcode`),
  ADD KEY `head_id` (`head_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `orders_ibfk_1` (`trans_id`);

--
-- Indeks untuk tabel `overhead_component`
--
ALTER TABLE `overhead_component`
  ADD PRIMARY KEY (`oc_id`);

--
-- Indeks untuk tabel `overhead_cost`
--
ALTER TABLE `overhead_cost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oc_id` (`oc_id`),
  ADD KEY `trans_id` (`trans_id`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payments_ibfk_1` (`trans_id`);

--
-- Indeks untuk tabel `production_costs`
--
ALTER TABLE `production_costs`
  ADD PRIMARY KEY (`cost_id`),
  ADD KEY `trans_id` (`trans_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indeks untuk tabel `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `trans_id` (`trans_id`),
  ADD KEY `material_id` (`material_id`);

--
-- Indeks untuk tabel `raw_materials`
--
ALTER TABLE `raw_materials`
  ADD PRIMARY KEY (`material_id`),
  ADD KEY `material_type` (`material_type`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeks untuk tabel `type_of_materials`
--
ALTER TABLE `type_of_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role` (`role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bill_of_materials`
--
ALTER TABLE `bill_of_materials`
  MODIFY `bom_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `direct_labor_costs`
--
ALTER TABLE `direct_labor_costs`
  MODIFY `direct_labor_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `direct_material_cost`
--
ALTER TABLE `direct_material_cost`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `general_ledger`
--
ALTER TABLE `general_ledger`
  MODIFY `gl_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT untuk tabel `menu_access`
--
ALTER TABLE `menu_access`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `overhead_cost`
--
ALTER TABLE `overhead_cost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `production_costs`
--
ALTER TABLE `production_costs`
  MODIFY `cost_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bill_of_materials`
--
ALTER TABLE `bill_of_materials`
  ADD CONSTRAINT `bill_of_materials_ibfk_1` FOREIGN KEY (`material_id`) REFERENCES `raw_materials` (`material_id`),
  ADD CONSTRAINT `bill_of_materials_ibfk_3` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD CONSTRAINT `chart_of_accounts_ibfk_1` FOREIGN KEY (`sub_code`) REFERENCES `coa_subhead` (`sub_code`);

--
-- Ketidakleluasaan untuk tabel `coa_subhead`
--
ALTER TABLE `coa_subhead`
  ADD CONSTRAINT `coa_subhead_ibfk_1` FOREIGN KEY (`head_code`) REFERENCES `coa_head` (`head_code`);

--
-- Ketidakleluasaan untuk tabel `direct_labor_costs`
--
ALTER TABLE `direct_labor_costs`
  ADD CONSTRAINT `direct_labor_costs_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  ADD CONSTRAINT `direct_labor_costs_ibfk_2` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `direct_material_cost`
--
ALTER TABLE `direct_material_cost`
  ADD CONSTRAINT `direct_material_cost_ibfk_1` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `general_ledger`
--
ALTER TABLE `general_ledger`
  ADD CONSTRAINT `general_ledger_ibfk_2` FOREIGN KEY (`account_no`) REFERENCES `chart_of_accounts` (`account_no`),
  ADD CONSTRAINT `general_ledger_ibfk_3` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `menu_access`
--
ALTER TABLE `menu_access`
  ADD CONSTRAINT `menu_access_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_access_ibfk_2` FOREIGN KEY (`tcode`) REFERENCES `menu_item` (`tcode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `menu_item`
--
ALTER TABLE `menu_item`
  ADD CONSTRAINT `menu_item_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `menu_head` (`head_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ketidakleluasaan untuk tabel `overhead_cost`
--
ALTER TABLE `overhead_cost`
  ADD CONSTRAINT `overhead_cost_ibfk_1` FOREIGN KEY (`oc_id`) REFERENCES `overhead_component` (`oc_id`),
  ADD CONSTRAINT `overhead_cost_ibfk_2` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `production_costs`
--
ALTER TABLE `production_costs`
  ADD CONSTRAINT `production_costs_ibfk_1` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`trans_id`) REFERENCES `transactions` (`trans_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `raw_materials` (`material_id`);

--
-- Ketidakleluasaan untuk tabel `raw_materials`
--
ALTER TABLE `raw_materials`
  ADD CONSTRAINT `raw_materials_ibfk_1` FOREIGN KEY (`material_type`) REFERENCES `type_of_materials` (`id`);

--
-- Ketidakleluasaan untuk tabel `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;
