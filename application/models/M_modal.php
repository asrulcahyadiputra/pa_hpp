<?php

defined('BASEPATH') or exit('No direct script access allowed');

class M_modal extends CI_Model
{
    public function all($trans_id = null)
    {
        if ($trans_id === null || $trans_id == '') {
            $res = $this->db->get_where('transactions', ['trans_type' => 'modal'])->result_array();
        } else {
            $res = $this->db->get_where('transactions', ['trans_type' => 'modal', 'trans_id' => $trans_id])->result_array();
        }

        return $res;
    }
    // generate new id 
    private function trans_id()
    {
        $this->db->select('RIGHT(trans_id,9) as trans_id', FALSE);
        $this->db->where('trans_type', 'modal');
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
        $trans_id = "TRX-STM-" . $code;
        return $trans_id;
    }
    public function store()
    {
        $trans_id            = $this->trans_id();
        $trans_date          = $this->input->post('trans_date');
        $description         = $this->input->post('description');
        $trans_total          = intval(preg_replace("/[^0-9]/", "", $this->input->post('trans_total')));

        $periode        =  date('Y', strtotime($trans_date)) . '' . date('m', strtotime($trans_date));
        $data = [
            'trans_id'           => $trans_id,
            'periode'            => $periode,
            'trans_date'         => $trans_date,
            'description'        => $description,
            'trans_total'        => $trans_total,
            'trans_type'         => 'modal'

        ];
        $gl = [
            [
                'account_no'            => '1-10001',
                'periode'               => $periode,
                'trans_id'              => $trans_id,
                'nominal'               => $trans_total,
                'gl_balance'            => 'd'
            ],
            [
                'account_no'            => '3-10001',
                'periode'               => $periode,
                'trans_id'              => $trans_id,
                'nominal'               => $trans_total,
                'gl_balance'            => 'k'
            ],
        ];
        $this->db->trans_start();
        $this->db->insert('transactions', $data);
        $this->db->insert_batch('general_ledger', $gl);
        $this->db->trans_complete();
        if ($this->db->trans_status() == true) {
            $res = [
                'status'        => true,
                'message'       => 'Data Berhasil di Simpan dengan No Bukti ' . $trans_id
            ];
        } else {
            $res = [
                'status'        => false,
                'message'       => $this->db->error()
            ];
        }

        return $res;
    }
}

/* End of file M_menu.php */
