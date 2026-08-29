<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Model_auth extends CI_Model {
    public function __construct()
    {
        parent::__construct();
    }

    public function register($data)
    {
        return $this->db->insert('tb_user', $data);
    }
}