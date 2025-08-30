<?php
  namespace App\Models;
  use Core\{Model, DB, H};
  use Core\Validators\{RequiredValidator,NumericValidator};


  class Companies extends Model {

    public $id, $created_at, $updated_at, $short_name,$long_name, $email, $website, $phone,$address,$logo, $trx_no = 0, $req_no, $po_no, $rn_no, $sale_no, $purchase_no, $voucher_trx_no;
    protected static $_table = 'companies';


    public function beforeSave(){
      $this->timeStamps();
    }

    public function validator(){
      $this->runValidation(new RequiredValidator($this,['field'=>'short_name','msg'=>'Initials is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'long_name','msg'=>'Name in full is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'email','msg'=>'email is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'website','msg'=>'website is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'phone','msg'=>'phone is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'address','msg'=>'address is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'trx_no','msg'=>'trx_no is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'req_no','msg'=>'SRF No is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'po_no','msg'=>'PO No is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'rn_no','msg'=>'RR No is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'sale_no','msg'=>'sale_no is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'purchase_no','msg'=>'purchase_no is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'voucher_trx_no','msg'=>'voucher_trx_no is required.']));

    }

    }