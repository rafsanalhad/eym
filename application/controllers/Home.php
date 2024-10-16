<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();

	}

	public function index()
	{
		$this->load->view('template/home/header');
		$this->load->view('content/home');
		$this->load->view('template/home/footer');
	}
	public function login()
	{
		$this->load->view('template/login/header');
		$this->load->view('content/login');
		$this->load->view('template/login/footer');
	}
	public function signUp()
	{
		$this->load->view('template/login/header');
		$this->load->view('content/sign_up');
		$this->load->view('template/login/footer');
	}
	public function loginAction()
	{
		$this->load->model('Model_auth', 'auth');
		$firstName = $_POST['firstName'];
		$lastName = $_POST['lastName'];
		$noHp = $_POST['noHp'];	
		$email = $_POST['email'];
		$password = $_POST['password'];

		if($firstName == null || $lastName == null || $noHp == null || $email == null || $password == null){
			// $this->session->set_flashdata('error', 'Data tidak boleh kosong');
			redirect('login');
		}else{
			$data = array(
				'firstName' => $firstName,
				'lastName' => $lastName,
				'noHp' => $noHp,
				'email' => $email,
				'password' => $password
			);
			$this->auth->register($data);
		}
	}
}
