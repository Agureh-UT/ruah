<?php

namespace App\Controllers;

use Core\{Controller, H, Session, Router};
use App\Models\{Companies, Sections, SectionImages, Pages, PageSectionRefs, PageSectionTypes, Users, PostTypes, Upload,Uploadv2};
use App\Lib\Utilities\JsonFileHelper;


class SettingsController extends Controller
{

  public function onConstruct()
  {
    $this->view->setLayout('admin');
    $this->currentUser = Users::currentUser();
  }

  public function indexAction()
  {
    $page = (!empty($this->request->get('page'))) ? $this->request->get('page') : 1;
    $limit = 4;
    $offset = ($page - 1) * $limit;
    $params = ['order' => 'id', 'limit' => $limit, 'offset' => $offset];
    $total = count(Companies::find());
    $this->view->totalPages = ceil($total / $limit);
    $this->view->modeldata = Companies::find($params);
    $this->view->limit = $limit;
    $this->view->total = $total;
    $this->view->page = $page;
    $this->view->render('settings/index');
  }
  public function detailsAction($id)
  {
    $model = Companies::findById((int)$id);
    if (!$model) {
      Session::addMsg('danger', 'You do not have permission to view this');
      Router::redirect('settings/index');
    }
    $this->view->model = $model;
    $this->view->hasImage = !empty($model->logo);
    $this->view->render('settings/details');
  }
  public function updatorAction($id='new')
  {
    // $model = Companies::findById((int)$id);
    $model = ($id == 'new') ? new Companies() : Companies::findById((int)$id);


    if (!$model) {
      Session::addMsg('danger', 'You do not have permission to edit this');
      Router::redirect('settings');
    }
    if ($this->request->isPost()) {
      $this->request->csrfCheck();
      $model->short_name = $this->request->get('short_name');
      $model->long_name = $this->request->get('long_name');
      $model->email = $this->request->get('email');
      $model->website = $this->request->get('website');
      $model->phone = $this->request->get('phone');
      $model->address = $this->request->get('address');
      $model->trx_no = $this->request->get('trx_no');
      $model->req_no = $this->request->get('req_no');
      $model->po_no = $this->request->get('po_no');
      $model->rn_no = $this->request->get('rn_no');
      $model->sale_no = $this->request->get('sale_no');
      $model->purchase_no = $this->request->get('purchase_no');
      $model->voucher_trx_no = $this->request->get('voucher_trx_no');
      $model->save();
      $upload = new Uploadv2('logo');
      if ($id != 'new') {
        $upload->required = false;
      }
      $uploadErrors = $upload->validate();
      if (!empty($uploadErrors)) {
        foreach ($uploadErrors as $field => $error) {
          $model->addErrorMessage($field, $error);
        }
      }
      // H::dnd($model,true);
      if ($model->save()) {
        if (!empty($upload->tmp)) {
          $filePath = "uploads/clientLogos/$model->short_name";
          if ($upload->upload(FILES_ROOT . DS . $filePath)) {
            $model->logo = $filePath;
            $model->save();
            // H::dnd($model,true);
          }
        }
        //redirect
        if ($model->validationPassed()) {
          $msg = ($id == 'new') ? "Added New." : "Updated Successfully";
          Session::addMsg('success', $msg);
          Router::redirect('settings/index');
        }
      }
    }
    // H::dnd($model,false);
    $this->view->model = $model;
    $this->view->hasImage = !empty($model->logo);
    $this->view->displayErrors = $model->getErrorMessages();
    $this->view->render('settings/updator');
  }
  public function updateBASCKUPAction($id)
  {
    $model = Companies::findById((int)$id);

    if (!$model) {
      Session::addMsg('danger', 'You do not have permission to edit this');
      Router::redirect('settings');
    }
    if ($this->request->isPost()) {
      $this->request->csrfCheck();
      $model->short_name = $this->request->get('short_name');
      $model->long_name = $this->request->get('long_name');
      $model->email = $this->request->get('email');
      $model->website = $this->request->get('website');
      $model->phone = $this->request->get('phone');
      $model->address = $this->request->get('address');
      $model->trx_no = $this->request->get('trx_no');
      $model->req_no = $this->request->get('req_no');
      $model->po_no = $this->request->get('po_no');
      $model->rn_no = $this->request->get('rn_no');
      $model->sale_no = $this->request->get('sale_no');
      $model->purchase_no = $this->request->get('purchase_no');
      $model->voucher_trx_no = $this->request->get('voucher_trx_no');
      $model->save();
      $upload = new Upload('logo');
      if ($id != 'new') {
        $upload->required = false;
      }
      $uploadErrors = $upload->validate();
      if (!empty($uploadErrors)) {
        foreach ($uploadErrors as $field => $error) {
          $model->addErrorMessage($field, $error);
        }
      }
      // H::dnd($model,true);
      if ($model->save()) {
        if (!empty($upload->tmp)) {
          $filePath = "images/clientLogos/$model->short_name";
          if ($upload->upload(FILES_ROOT . DS . $filePath)) {
            $model->img = $filePath;
            $model->save();
            // H::dnd($model,true);
          }
        }
        //redirect
        if ($model->validationPassed()) {
          $msg = ($id == 'new') ? "Added New." : "Updated Successfully";
          Session::addMsg('success', $msg);
          Router::redirect('settings/index');
        }
      }
    }
    // H::dnd($model,false);
    $this->view->model = $model;
    $this->view->hasImage = !empty($model->logo);
    $this->view->displayErrors = $model->getErrorMessages();
    $this->view->render('settings/updator');
  }

}
