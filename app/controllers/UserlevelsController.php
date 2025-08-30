<?php
namespace App\Controllers;
use Core\Controller;
use Core\Router;
use App\Models\Users;
use App\Models\Userlevels;
use Core\H;
use Core\Session;

class UserlevelsController extends Controller {

  public function onConstruct(){
    $this->view->setLayout('admin');
  }
    public function indexAction(){

    $this->view->userlevels = Userlevels::find(['order' => 'name DESC']);

    $this->view->render('userlevels/index');
  }

  public function deleteAction(){
    $resp = ['success'=>false,'msg'=>'Something went wrong...'];
    if($this->request->isPost()){
      $id = $this->request->get('id');
      $userlevel = Userlevels::findById($id);
      if($userlevel){
        $userlevel->delete();
        $resp = ['success' => true, 'msg' => 'Userlevel Deleted.','model_id' => $id];
      }
    }
    $this->jsonResponse($resp);
  }

  public function updatorAction($id= 'new'){
    $userlevel = ($id == 'new')? new Userlevels() : Userlevels::findById((int)$id);
    if(!$userlevel){
      Session::addMsg('danger','You do not have permission to edit that userlevel');
      Router::redirect('userlevels/index');
    }
    if($this->request->isPost()){
      $this->request->csrfCheck();
      $userlevel->name   =$this->request->get('name');
      $userlevel->userlevel_status   =$this->request->get('userlevel_status');
      // H::dnd($userlevel->name);
      $userlevel->save();
      if($userlevel->validationPassed()){
        $userlevel->save();
        //redirect
        Session::addMsg('success','Userlevel Saved!');
        Router::redirect('userlevels/index');
      }
    }

    $this->view->header = ($id == 'new')? "Add New Userlevel" : "Edit " . $userlevel->name;
    $this->view->userlevel = $userlevel;
    $this->view->statusOptions = [1 => 'Enabled', 0 => 'Disabled'];
    $this->view->displayErrors = $userlevel->getErrorMessages();
    $this->view->render('userlevels/updator');
  }

}
