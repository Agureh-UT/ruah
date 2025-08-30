<?php
namespace App\Models;
use Core\{Model, DB, H};
use Core\Validators\{RequiredValidator,UniqueValidator, NumericValidator,MaxValidator};
class Userlevels extends Model
{
  public $id, $created_at, $updated_at, $name;
  public $deleted = 0, $userlevel_status = 1;
  protected static $_table = 'userlevels';
  protected static $_softDelete = true;
  public function beforeSave()
  {
    $this->timeStamps();
  }
  public function validator()
  {
    $this->runValidation(new RequiredValidator($this, ['field' => 'name', 'msg' => 'Userlevel name is required.']));
    $this->runValidation(new RequiredValidator($this, ['field' => 'userlevel_status', 'msg' => 'Userlevel status is required.']));
    $this->runValidation(new MaxValidator($this, ['field' => 'name', 'rule' => 45, 'msg' => 'Userlevel Name must be less than 45 characters.']));
    $this->runValidation(new UniqueValidator($this,['field'=>['name','deleted'],'msg'=>'That Userlevel Name already exists.']));
  }
  public static function getOptionsForForm()
  {
    $params = [
      'columns' => 'id, name',
      'order' => 'id'
    ];
    $userlevels = self::find($params);
    $userlevelAry = [""=>'-Select Userlevel-'];
    foreach ($userlevels as $userlevel) {
      $userlevelAry[$userlevel->id] = $userlevel->name;
    }
    return $userlevelAry;
  }

  public static function getUserlevelOptionsForForm($user_id = '')
  {
    $params = [
      'columns' => 'id, name',
      'order' => 'id'
    ];
    if (!empty($user_id)) {
      $params['conditions'] = "user_id = ?";
      $params['bind'][] = $user_id;
    }
    $userlevels = self::find($params);
    $userlevelAry = [];
    foreach ($userlevels as $userlevel) {
      $userlevelAry[$userlevel->name] = $userlevel->name;
    }
    return $userlevelAry;
  }
}
