<?php
namespace Core\Validators;
use Core\Validators\CustomValidator;
use Core\H;
// this class allows for checking unique strings with wildcard "%" searching on the tables. IT is more strict than the uniqueValidator class.

class UniqueStringValidator extends CustomValidator{

  public function runValidation(){
    $value = $this->_model->{$this->field};

    if($value == '' || !isset($value)){
      // this allows unique validator to be used with empty strings for fields that are not required.
      return true;
    }

    $conditions = ["{$this->field} LIKE ?"];
    $bind = ["%" .$value. "%"];

    //check updating record
    if(!empty($this->_model->id)){
      $conditions[] = "id != ?";
      $bind[] = $this->_model->id;
    }

    //this allows you to check multiple fields for Unique
    foreach($this->additionalFieldData as $adds){
      $conditions[] = "{$adds} LIKE ?";
      $bind[] = "%" .$this->_model->{$adds}. "%";
    }

    $queryParams = ['conditions'=>$conditions,'bind'=>$bind];
    if($this->includeDeleted) {
      $queryParams['includeDeleted'] = true;
    }
    $other = $this->_model::findFirst($queryParams);
    return(!$other);
  }
}