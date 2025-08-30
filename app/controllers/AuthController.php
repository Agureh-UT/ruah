<?php
namespace App\Controllers;
use Core\Controller;
use Core\Router;
use App\Models\Users;
use App\Models\Login;

class AuthController extends Controller {

  public function onConstruct(){
    $this->view->setLayout('default');
  }

  public function indexAction() {
    $this->view->setLayout('login');
    $loginModel = new Login();
    if($this->request->isPost()) {
      // form validation
      $this->request->csrfCheck();
      $loginModel->assign($this->request->get());
      $loginModel->validator();
      if($loginModel->validationPassed()){
        $user = Users::findByUsername($_POST['username']);
        if($user && password_verify($this->request->get('password'), $user->password)) {
          $remember = $loginModel->getRememberMeChecked();
          $user->login($remember);
          Router::redirect('home/index');
        }  else {
          $loginModel->addErrorMessage('username','There is an error with your username or password');
        }
      }
    }
    $this->view->login = $loginModel;
    $this->view->displayErrors = $loginModel->getErrorMessages();
    $this->view->render('auth/index');
  }

  public function logoutAction() {
    if(Users::currentUser()) {
      Users::currentUser()->logout();
    }
    Router::redirect('auth/index');
  }

  public function registerAction() {
    $newUser = new Users();
    if($this->request->isPost()) {
      $this->request->csrfCheck();
      $newUser->assign($this->request->get(),Users::blackListedFormKeys);
      $newUser->confirm =$this->request->get('confirm');
      if($newUser->save()){
        Router::redirect('home/index');
      }
    }
    $this->view->newUser = $newUser;
    $this->view->displayErrors = $newUser->getErrorMessages();
    $this->view->render('auth/register');

  }
}
