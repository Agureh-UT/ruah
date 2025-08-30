<?php

namespace App\Controllers;

use Core\H;
use Core\Router;
use Core\Session;
use Core\Controller;
use App\Models\Login;
use App\Models\Users;
use App\Models\Upload;
use App\Models\Branches;
use App\Models\Products;
use App\Models\Userlevels;
use App\Models\Departments;
use App\Models\Uploadv2;

class UseradminController extends Controller
{
  public function onConstruct()
  {
    $this->view->setLayout('admin');
    $this->currentUser = Users::currentUser();
  }
  public function indexAction()
  {
    $search = $this->request->get('search');
    $department = $this->request->get('department');
    $branches = $this->request->get('branches');
    $userlevels = $this->request->get('userlevels');
    $page = (!empty($this->request->get('page'))) ? $this->request->get('page') : 1;
    // $limit = 50;
    $limit = (!empty($this->request->get('limit'))) ? $this->request->get('limit') : 10;
    $offset = ($page - 1) * $limit;
    $options = [
      'search' => $search, 'department' => $department, 'userlevels' => $userlevels, 'branches' => $branches, 'limit' => $limit, 'offset' => $offset
    ];
    $results = Users::fetchDataList($options);
    $users = $results['results'];
    $total = $results['total'];
    $this->view->totalPages = ceil($total / $limit);
    $this->view->users = $users;
    $users = $results['results'];
    // H::dnd($users);
    $this->view->limit = $limit;
    $this->view->total = $total;
    $this->view->page = $page;
    $this->view->department = $department;
    $this->view->branches = $branches;
    $this->view->userlevels = $userlevels;
    $this->view->search = $search;
    $this->view->departmentOptions = Departments::getOptionsForForm();
    $this->view->userlevelOptions = Userlevels::getOptionsForForm();
    $this->view->branchesOptions = Branches::getOptionsForForm();
    $this->view->render('useradmin/index');
  }


  public function addnewAction()
  {
    $User = new Users();

    if ($this->request->isPost()) {
      $this->request->csrfCheck();
      $User->username = $this->request->get('username');
      $User->email = $this->request->get('email');
      $User->password = $this->request->get('password');
      $User->confirm = $this->request->get('confirm');
      $User->fname = $this->request->get('fname');
      $User->lname = $this->request->get('lname');
      $User->is_reviewer = ($this->request->get('is_reviewer') == 'on') ? 1 : 0;
      $User->is_approver = ($this->request->get('is_approver') == 'on') ? 1 : 0;
      $User->userlevel_id = (int)$this->request->get('userlevel_id');
      $acl = Userlevels::findById($User->userlevel_id);
      $User->acl = $acl->name;
      $User->branch_id = (int)$this->request->get('branch_id');
      $User->department_id = (int)$this->request->get('department_id');
      $User->contact = $this->request->get('contact');
      $User->designation = $this->request->get('designation');
      $upload = new Upload('signature');

      // H::dnd($User,false);
    
      $uploadErrors = $upload->validate();
      if (!empty($uploadErrors)) {
        foreach ($uploadErrors as $field => $error) {
          $User->addErrorMessage($field, $error);
        }
      }

      if ($User->save()) {
        // if ($User->id) {
        // if ($User->id != NULL) {
        if (!empty($upload->tmp)) {
          $filePath = "uploads/user_images/signature_{$User->id}";
          if ($upload->upload(FILES_ROOT . DS . $filePath)) {
            $User->signature = $filePath;
            $User->save();
          }
        }
        Session::addMsg('success', "User Created");
        Router::redirect('useradmin/index');
        // if ($User->validationPassed()) {
        //   Session::addMsg('success', 'User Saved!');
        //   Router::redirect('useradmin/index');
        // }
      }
    }
    $this->view->Userlevels = Userlevels::getOptionsForForm();
    $this->view->Userproducts = Products::getOptionsForForm();
    $this->view->branches = Branches::getOptionsForForm();
    $this->view->departments = Departments::getOptionsForForm();
    // $this->view->Accesslevels = Userlevels::getUserlevelOptionsForForm();
    $this->view->User = $User;
    $this->view->hasSignature = !empty($User->signature);
    $this->view->displayErrors = $User->getErrorMessages();
    $this->view->render('useradmin/addnew');
  }

  public function updatorAction($id)
  {
    $User = Users::findById((int)$id);

    if (!$User) {
      Session::addMsg('danger', 'You do not have permission to edit this user');
      Router::redirect('useradmin');
    }
    if ($this->request->isPost()) {
      $this->request->csrfCheck();
      $User->username = $this->request->get('username');
      $User->email = $this->request->get('email');
      $User->password = $this->request->get('password');
      $User->confirm = $this->request->get('confirm');
      $User->fname = $this->request->get('fname');
      $User->lname = $this->request->get('lname');
      $User->is_reviewer = ($this->request->get('is_reviewer') == 'on') ? 1 : 0;
      $User->is_approver = ($this->request->get('is_approver') == 'on') ? 1 : 0;
      $User->userlevel_id = (int)$this->request->get('userlevel_id');
      $acl = Userlevels::findById($User->userlevel_id);
      $User->acl = $acl->name;
      $User->branch_id = (int)$this->request->get('branch_id');
      $User->department_id = (int)$this->request->get('department_id');
      $User->contact = $this->request->get('contact');
      $User->designation = $this->request->get('designation');
      // if ($id != 'new' && !empty($this->request->get('password'))) {
        if ($User->id != NULL && !empty($User->password)) {
        // $User->password = $this->request->get('password');
        // $User->confirm = $this->request->get('confirm');
        $User->resetPassword = true;
      }
      $upload = new Uploadv2('signature');

      // H::dnd($User,false);
      if ($id != 'new') {
        $upload->required = false;
      }
      $uploadErrors = $upload->validate();
      if (!empty($uploadErrors)) {
        foreach ($uploadErrors as $field => $error) {
          $User->addErrorMessage($field, $error);
        }
      }

      if ($User->save()) {
        // if ($User->validationPassed()) {
        // if ($User->id) {
        // if ($User->id != NULL) {
        if (!empty($upload->tmp)) {
          $filePath = "uploads/user_images/signature_{$User->id}";
          if ($upload->upload(FILES_ROOT . DS . $filePath)) {
            $User->signature = $filePath;
            $User->save();
            // H::dnd($User,false);
          }
        }
        $msg = ($id == 'new') ? "User Created." : "User Updated";
        Session::addMsg('success', $msg);
        Router::redirect('useradmin/index');
        // if ($User->validationPassed()) {
        //   Session::addMsg('success', 'User Saved!');
        //   Router::redirect('useradmin/index');
        // }
      }
    }
    $this->view->Userlevels = Userlevels::getOptionsForForm();
    $this->view->Userproducts = Products::getOptionsForForm();
    $this->view->branches = Branches::getOptionsForForm();
    $this->view->departments = Departments::getOptionsForForm();
    // $this->view->Accesslevels = Userlevels::getUserlevelOptionsForForm();
    $this->view->User = $User;
    $this->view->hasSignature = !empty($User->signature);
    $this->view->displayErrors = $User->getErrorMessages();
    $this->view->render('useradmin/updator');
  }



  public function toggleBlockUserAction($userId)
  {
    $user = Users::findById($userId);
    if ($user && $user->id !== Users::currentUser()->id) {
      $user->blocked = $user->blocked ? 0 : 1;
      $user->save();
      $msg = $user->blocked ? "User blocked." : "User unblocked.";
      $msgType = 'success';
    } else {
      $msgType = 'danger';
      $msg = 'You can not block yourself';
    }
    Session::addMsg($msgType, $msg);
    Router::redirect('useradmin/index');
  }
  public function deleteUserAction($userId)
  {
      $user = Users::findById($userId);
      $msgType = 'danger';
      $msg = 'User cannot be deleted';
      if ($user && $user->id !== Users::currentUser()->id) {
          $user->delete();
          $msgType = 'success';
          $msg = 'User deleted';
      }
      Session::addMsg($msgType, $msg);
      Router::redirect('useradmin/index');
  }
  public function bestregistereditAction($id = 'new')
  {
    $User = ($id == 'new') ? new Users() : Users::findById((int)$id);

    if (!$User) {
      Session::addMsg('danger', 'You do not have permission to edit this user');
      Router::redirect('useradmin');
    }
    if ($this->request->isPost()) {
      $this->request->csrfCheck();
      $User->username = $this->request->get('username');
      $User->email = $this->request->get('email');
      // $User->password = $this->request->get('password');
      $User->confirm = $this->request->get('confirm');
      $User->fname = $this->request->get('fname');
      $User->lname = $this->request->get('lname');
      $User->is_reviewer = ($this->request->get('is_reviewer') == 'on') ? 1 : 0;
      $User->is_approver = ($this->request->get('is_approver') == 'on') ? 1 : 0;
      $User->userlevel_id = $this->request->get('userlevel_id');
      $acl = Userlevels::findById($User->userlevel_id);
      $User->acl = $acl->name;
      $User->branch_id = $this->request->get('branch_id');
      $User->department_id = $this->request->get('department_id');
      $User->contact = $this->request->get('contact');
      $User->designation = $this->request->get('designation');
      if ($User != 'new' && !empty($this->request->get('password'))) {
        $User->password = $this->request->get('password');
        $User->resetPassword = true;
      }
      $upload = new Upload('signature');

      // H::dnd($User,false);
      if ($id != 'new') {
        $upload->required = false;
      }
      $uploadErrors = $upload->validate();
      if (!empty($uploadErrors)) {
        foreach ($uploadErrors as $field => $error) {
          $User->addErrorMessage($field, $error);
        }
      }

      if ($User->save()) {
        // if ($User->id) {
        // if ($User->id != NULL) {
        if (!empty($upload->tmp)) {
          $filePath = "uploads/user_images/signature_{$User->id}";
          if ($upload->upload(FILES_ROOT . DS . $filePath)) {
            $User->signature = $filePath;
            $User->save();
          }
        }
        $msg = ($id == 'new') ? "User Created." : "User Updated";
        Session::addMsg('success', $msg);
        // Router::redirect('useradmin/index');
        // if ($User->validationPassed()) {
        //   Session::addMsg('success', 'User Saved!');
        //   Router::redirect('useradmin/index');
        // }
      }
    }
    $this->view->Userlevels = Userlevels::getOptionsForForm();
    $this->view->Userproducts = Products::getOptionsForForm();
    $this->view->branches = Branches::getOptionsForForm();
    $this->view->departments = Departments::getOptionsForForm();
    // $this->view->Accesslevels = Userlevels::getUserlevelOptionsForForm();
    $this->view->User = $User;
    $this->view->hasSignature = !empty($User->signature);
    $this->view->displayErrors = $User->getErrorMessages();
    $this->view->render('useradmin/bestregisteredit');
  }

  public function passwordupdateAction($id = "")
  {
    // $authoriseduserToEdit = Users::currentUser();
    $UserId = ($id === "" && Users::currentUser()) ? Users::currentUser()->id : (int)$id;
    $User = Users::findById((int)$UserId);

    if (!$User) {
      Session::addMsg('danger', 'You do not have permission to edit this user');
      Router::redirect('requisitions/index');
    }
    if ($this->request->isPost()) {
      $this->request->csrfCheck();
      $User->username = $this->request->get('username');
      $User->password = $this->request->get('password');
      $User->confirm = $this->request->get('confirm');
      $User->resetPassword = true;
      if ($User->save()) {
        Session::addMsg('success', "password Updated");
        Router::redirect('home/index');
      }
    }
    $this->view->User = $User;
    $this->view->displayErrors = $User->getErrorMessages();
    $this->view->setLayout('default');
    $this->view->render('useradmin/passwordupdate');
  }

  public function passwordadminAction($UserId)
  {
    // $authoriseduserToEdit = Users::currentUser();
    $User = Users::findById((int)$UserId);

    if (!$User) {
      Session::addMsg('danger', 'You do not have permission to edit this user');
      Router::redirect('useradmin');
    }
    if ($this->request->isPost()) {
      $this->request->csrfCheck();
      $User->username = $this->request->get('username');
      $User->password = $this->request->get('password');
      $User->confirm = $this->request->get('confirm');
      $User->resetPassword = true;
      if ($User->save()) {
        Session::addMsg('success', "User Updated");
        Router::redirect('useradmin/index');
      }
    }
    $this->view->User = $User;
    $this->view->displayErrors = $User->getErrorMessages();
    $this->view->render('useradmin/passwordadmin');
  }
  public function detailsAction($id)
  {
    // $user = Users::currentUser();
    $user = Users::findById((int)$id);
    if (!$user) {
      Session::addMsg('danger', 'You do not have permission to view that user');
      Router::redirect('useradmin/index');
    }
    $this->view->user = $user;
    // $branch=Branches::findById($user->branch_id);
    $this->view->branch = ($user->branch_id) ? Branches::findById($user->branch_id)->name:"Not set";
    $this->view->hasSignature = !empty($user->signature);
    $this->view->render('useradmin/details');
  }
  public function withmultipleaclsAction($id = 'new')
  {
    if ($id == 'new') {
      $User = new Users();
    } else {
      $User = Users::findById($id);
    }
    if (!$User) {
      Session::addMsg('danger', 'You do not have permission to edit this user');
      Router::redirect('useradmin');
    }
    if ($this->request->isPost()) {
      $this->request->csrfCheck();
      $User->username = $this->request->get('username');
      $User->email = $this->request->get('email');
      $User->password = $this->request->get('password');
      $User->fname = $this->request->get('fname');
      $User->lname = $this->request->get('lname');
      $User->userlevel_id = $this->request->get('userlevel_id');
      $User->confirm = $this->request->get('confirm');
      $user_acls_postarray = $_POST["acl"];
      // $user_acls_postarray = $this->request->get("acl");
      // H::dnd($user_acls_postarray);
      $user_acls=[];
      for ($i = 0; $i < count($user_acls_postarray); $i++) {
        if ($user_acls_postarray[$i] != "") {
          $user_acls[]=$user_acls_postarray[$i];
          // $user_acls[]= implode(", ", (array)$user_acls_postarray); 
          // $User->acl= implode(", ", (array)$user_acls_postarray); 
          // $User->acl = '["' . implode('","', (array)$user_acls_postarray) . '"]';
        }
      }
      // H::dnd($user_acls);
      $User->acl=json_encode($user_acls);
      // H::dnd($User->acl);
      if ($id != 'new' && !empty($User->password)) {
        $User->resetPassword = true;
      }
      if ($User->save()) {
        // $User->aclbefore = $this->request->get('aclbefore');
        Session::addMsg('success', 'User Saved and Updated Successfully!');
        Router::redirect('useradmin/index');
      }
    }
    $this->view->Userlevels = Userlevels::getOptionsForForm();
    $this->view->Userproducts = Products::getOptionsForForm();
    $this->view->Accesslevels = Userlevels::getUserlevelOptionsForForm();
    $this->view->User = $User;
    $this->view->displayErrors = $User->getErrorMessages();
    $this->view->render('useradmin/withmultipleacls');
  }
}
