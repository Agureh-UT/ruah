<?php

namespace App\Controllers;

use Core\Controller;
use App\Models\Users;
use App\Models\Branches;
use App\Models\Countries;
use Core\H;

class AdminbranchesController extends Controller
{

  public function onConstruct()
  {
    $this->view->setLayout('admin');
    $this->currentUser = Users::currentUser();
  }

  public function indexAction()
  {

    $limit = (!empty($this->request->get('limit'))) ? $this->request->get('limit') : 10;
    $page = (!empty($this->request->get('page'))) ? $this->request->get('page') : 1;
    $this->view->limit =  $limit;
    $this->view->page =  $page;
    $this->view->countries = Countries::getOptionsForForm();
    $this->view->render('adminbranches/index');
  }


  public function fetchdataAction()
  {
    if ($this->request->isPost()) {
      $search = $this->request->get('search');
      $country_search = $this->request->get('country_search');
      $limit = (!empty($this->request->get('limit'))) ? $this->request->get('limit') : 10;
      $page = (!empty($this->request->get('page'))) ? $this->request->get('page') : 1;
      $offset = ($page - 1) * $limit;
      $options = ['search' => $search, 'country_search' => $country_search, 'limit' => $limit, 'offset' => $offset];

      $results = Branches::fetchData($options);
      $total = $results['total'];
      $models = $results['results'];
      $items = [];
      foreach ($models as $model) {
        $items[] = ['id' => $model->id, 'name' => $model->name, 'country_id' => $model->country_id, 'country' => $model->country];
      }
      $resp = ['fetchedDataItems' => $items];
      $resp['page'] = $page;
      $resp['totalPages'] = ceil($total / $limit);
      $resp['limit'] = $limit;
      $resp['total_data'] = $total;
      $this->jsonResponse($resp);
    }
  }

  
 
  public function addAction()
  {
    if ($this->request->isPost()) {
      $resp = ['success' => false];
      $id = $this->request->get('id');
      $model = ($id == '') ? new Branches() : Branches::findByUserIdAndId($this->currentUser->id, $id);
      if ($model) {
        $model->user_id = $this->currentUser->id;
        $model->name = $this->request->get('name');
        $model->country_id = $this->request->get('country_id');
        if ($model->save()) {
          $resp = ['success' => true, 'model' => $model->data()];
        } else {
          $errorMessages = $model->getErrorMessages();
          $resp = ['success' => false, 'errors' => $errorMessages];
        }
      } else {
        $resp = ['success' => false, 'errors' => 'You are not allowed to edit this record, please liase with the administrator.'];
      }
      $this->jsonResponse($resp);
    }
  }
  public function deleteAction()
  {
    if ($this->request->isPost()) {
      $id = (int)$this->request->get('id');
      $model = Branches::findByUserIdAndId($this->currentUser->id, $id);
      $resp = ['success' => false];
      if ($model) {
        $model->delete();
        $resp['success'] = true;
        $resp['model_id'] = $id;
      } else {
        $resp['success'] = false;
        $resp['errors'] = 'You can not delete this record, because it was created by another user, kindly contact the administrator.';
      }
      $this->jsonResponse($resp);
    }
  }


  public function getByIdAction()
  {
    if ($this->request->isPost()) {
      $id = (int)$this->request->get('id');
      $model = Branches::findByUserIdAndId($this->currentUser->id, $id);
      $resp = ['success' => false];
      if ($model) {
        $resp['success'] = true;
        $resp['fetchedDataItem'] = $model;
      } else {
        $resp['success'] = false;
        $resp['errors'] = 'You can not edit this record, because it was created by another user, kindly contact the administrator.';
      }
      $this->jsonResponse($resp);
    }
  }

  public function loadCountryCurrenciesByBranchAction()
  {

    $branch_id = $this->request->get('branch_id');
    $rows = Branches::getCountryCurrencyByBranchId((int) $branch_id);
    // H::dnd($rows);
    $items = [];
    foreach ($rows as $row) {
      $items[] = ['id' => $row->id, 'name' => $row->name, 'country' => $row->country, 'country_id' => $row->country_id, 'currency' => $row->currency, 'currency_id' => $row->currency_id];
    }
    $resp = ['responses' => $items];
    $this->jsonResponse($resp);
  }
}