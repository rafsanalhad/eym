<?php 
class modelauth extends CI_Model{
    function __construct()
    {
        parent::__construct();
    }
    function register($data){
        $this->db->insert('tb_user',$data);
    }
}
?>