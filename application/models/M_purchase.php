<?php

defined('BASEPATH') or exit('No direct script access allowed');

class M_purchase extends CI_Model
{
	public function all()
	{
		return $this->db->get_where('transactions', ['trans_type' => 'purchasing'])->result_array();
	}
	public function raw_materials()
	{
		$this->db->select('a.material_id,a.material_name,a.material_stock,a.material_unit,a.deleted,b.id as type_id,b.name as type_name')
			->from('raw_materials as a')
			->join('type_of_materials as b', 'a.material_type=b.id')
			->where('a.deleted', 0);
		return $this->db->get()->result_array();
	}
	public function select_raw_materials($id)
	{
		$this->db->select('a.material_id,a.material_name,a.material_stock,a.material_unit,a.deleted,b.id as type_id,b.name as type_name,c.purchase_qty,c.purchase_price,c.purchase_id,c.trans_id')
			->from('purchase as c')
			->join('raw_materials as a', 'c.material_id=a.material_id')
			->join('type_of_materials as b', 'a.material_type=b.id')
			->where('c.trans_id', $id);
		return $this->db->get()->result_array();
	}
	private function trans_id()
	{
		$this->db->select('RIGHT(trans_id,4) as trans_id', FALSE);
		$this->db->where('trans_type', 'purchasing');
		$this->db->order_by('trans_id', 'DESC');
		$this->db->limit(1);
		$query = $this->db->get('transactions');
		if ($query->num_rows() <> 0) {
			$data = $query->row();
			$id = intval($data->trans_id) + 1;
		} else {
			$id = 1;
		}
		$code = str_pad($id, 9, "0", STR_PAD_LEFT);
		$trans_id = "TRX-PMB-" . $code;
		return $trans_id;
	}

	public function create_draff()
	{
		$data = [
			'trans_id'	=> $this->trans_id(),
			'periode'	=> date('Y') . '' . date('m'),
			'trans_type'	=> 'purchasing',
			'status'		=> 0 //draff status
		];

		if ($this->db->insert('transactions', $data)) {
			$response = [
				'status'		=> 1,
				'trans_id'	=> $data['trans_id']
			];
		} else {
			$response = [
				'status'		=> 0,
			];
		}
		return $response;
	}
	public function insert_item()
	{
		$trans_id = $this->input->post('trans_id');
		$material_id = $this->input->post('material_id');
		$purchase_price = intval(preg_replace("/[^0-9]/", "", $this->input->post('purchase_price')));
		$material = $this->db->get_where('raw_materials', ['material_id' => $material_id])->row_array();
		$validate = $this->db->get_where('purchase', ['trans_id' => $trans_id, 'material_id' => $material_id])->row_array();
		if ($validate) {
			$data = [
				'purchase_qty'		=> $this->input->post('purchase_qty') + $validate['purchase_qty'],
				'purchase_price'	=> $purchase_price,
			];
			$this->db->update('purchase', $data, ['trans_id' => $trans_id, 'material_id' => $material_id]);
			$response = [
				'status'		=> 1,
				'trans_id'	=> $trans_id
			];
		} else {
			$data = [
				'trans_id'		=> $trans_id,
				'material_id'		=> $material_id,
				'purchase_qty'		=> $this->input->post('purchase_qty'),
				'purchase_price'	=> $purchase_price,

			];
			$this->db->insert('purchase', $data);
			$response = [
				'status'		=> 1,
				'trans_id'	=> $trans_id
			];
		}
		return $response;
	}
	public function delete_item($purchase_id, $trans_id)
	{
		$this->db->delete('purchase', ['trans_id' => $trans_id, 'purchase_id' => $purchase_id]);
		$response = [
			'status'		=> 1,
			'trans_id'	=> $trans_id
		];
		return $response;
	}
	public function store($trans_id, $tb, $tp, $total)
	{
		$periode = date('Y') . '' . date('m');
		$trans = [
			'status'		=> 1,
			'trans_total'	=> $total
		];
		$gl_tb = [
			'account_no'		=> '1-10003',
			'periode'			=> $periode,
			'trans_id'			=> $trans_id,
			'nominal'			=> $tb,
			'gl_balance'		=> 'd'

		];
		$gl_tp = [
			'account_no'		=> '1-10004',
			'periode'			=> $periode,
			'trans_id'			=> $trans_id,
			'nominal'			=> $tp,
			'gl_balance'		=> 'd'
		];
		$gl_cash = [
			'account_no'		=> '1-10001',
			'periode'			=> $periode,
			'trans_id'			=> $trans_id,
			'nominal'			=> $total,
			'gl_balance'		=> 'k'
		];
		$this->db->trans_start();
		$this->db->update('transactions', $trans, ['trans_id'	=> $trans_id]);
		if ($tb > 0) {
			$this->db->insert('general_ledger', $gl_tb);
		}
		if ($tp > 0) {
			$this->db->insert('general_ledger', $gl_tp);
		}
		$this->db->insert('general_ledger', $gl_cash);
		$this->db->trans_complete();
	}
}

/* End of file M_purchase.php */
