<?php


defined('BASEPATH') or exit('No direct script access allowed');

class Modal extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        user_log();
        $this->load->model('M_modal', 'model');
    }

    public function index()
    {
        $data = [
            'title'        => 'Setoran Modal',
        ];
        $this->load->view('transactions/modal/content', $data);
    }

    public function all()
    {
        $req = $this->model->all();

        echo json_encode($req);
    }
    public function load_akses($id)
    {
        $req = $this->model->all($id);

        echo json_encode($req);
    }
    public function store()
    {
        $req = $this->model->store();

        if ($req['status'] == true) {
            $response = [
                'icon'      => 'success',
                'title'     => 'Berhasil',
                'text'      => $req['message']
            ];
        } else {
            $response = [
                'icon'      => 'error',
                'title'     => '500',
                'text'      => $req['message']
            ];
        }
        echo json_encode($response);
    }

    public function store_akses()
    {
        $req = $this->model->store_akses();

        if ($req['status'] == true) {
            $response = [
                'icon'      => 'success',
                'title'     => 'Berhasil',
                'text'      => $req['message'],
                'store'     => $req['store']
            ];
        } else {
            $response = [
                'icon'      => 'error',
                'title'     => '500',
                'text'      => $req['message']
            ];
        }
        echo json_encode($response);
    }

    public function update()
    {
        $req = $this->model->update();

        if ($req['status'] == true) {
            $response = [
                'icon'      => 'success',
                'title'     => 'Berhasil',
                'text'      => $req['message']
            ];
        } else {
            $response = [
                'icon'      => 'error',
                'title'     => '500',
                'text'      => $req['message']
            ];
        }
        echo json_encode($response);
    }

    public function select($id)
    {
        $req = $this->model->all($id);

        echo json_encode($req);
    }

    public function destroy($id)
    {
        $req = $this->model->destroy($id);

        echo json_encode($req);
    }
}

/* End of file Menu.php */
