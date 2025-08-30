<?php
namespace App\Models;
use Core\DB;
use Core\Model;
use Core\Session;
use Core\{H, Cookie};
use App\Models\UserSessions;
use Core\Validators\MaxValidator;
use Core\Validators\MinValidator;
use Core\Validators\EmailValidator;
use Core\Validators\UniqueValidator;
use Core\Validators\MatchesValidator;
use Core\Validators\RequiredValidator;

class Users extends Model {
  protected static $_table='users', $_softDelete = true;
  public static $currentLoggedInUser = null;
  public $id,$username,$email,$password,$fname,$lname,$acl,$deleted = 0,$confirm, $userlevel_id, $blocked = 0,$is_reviewer = 0,$is_approver = 0,$signature;
  public $contact,$designation,$branch_id,$department_id,$resetPassword= false;
  const blackListedFormKeys = ['id','deleted'];

  public function validator(){
    $this->runValidation(new RequiredValidator($this,['field'=>'fname','msg'=>'First Name is required.']));
    $this->runValidation(new RequiredValidator($this,['field'=>'lname','msg'=>'Last Name is required.']));
    $this->runValidation(new RequiredValidator($this,['field'=>'email','msg'=>'Email is required.']));
    $this->runValidation(new EmailValidator($this, ['field'=>'email','msg'=>'You must provide a valid email address']));
    $this->runValidation(new MaxValidator($this,['field'=>'email','rule'=>150,'msg'=>'Email must be less than 150 characters.']));
    $this->runValidation(new MinValidator($this,['field'=>'username','rule'=>6,'msg'=>'Username must be at least 6 characters.']));
    $this->runValidation(new MaxValidator($this,['field'=>'username','rule'=>150,'msg'=>'Username must be less than 150 characters.']));
    $this->runValidation(new UniqueValidator($this,['field'=>['username'],'msg'=>'That username already exists. Please choose a new one.']));
    $this->runValidation(new RequiredValidator($this,['field'=>'password','msg'=>'Password is required.']));
    $this->runValidation(new MinValidator($this,['field'=>'password','rule'=>6,'msg'=>'Password must be a minimum of 6 characters.']));
    if($this->isNew()){
      $this->runValidation(new MatchesValidator($this,['field'=>'password','rule'=>$this->confirm,'msg'=>"Your passwords do not match."]));
    }
  }

  public function beforeSave(){
    $this->timeStamps();
    if($this->isNew()){
      $this->password = password_hash($this->password, PASSWORD_DEFAULT);
    }
  }

  public static function findByUsername($username) {
    return self::findFirst(['conditions'=> "username = ?", 'bind'=>[$username]]);
  }

  public static function currentUser() {
    if(!isset(self::$currentLoggedInUser) && Session::exists(CURRENT_USER_SESSION_NAME)) {
      self::$currentLoggedInUser = self::findById((int)Session::get(CURRENT_USER_SESSION_NAME));
    }
    return self::$currentLoggedInUser;
  }

  public function login($rememberMe=false) {
    Session::set(CURRENT_USER_SESSION_NAME, $this->id);
    if($rememberMe) {
      $hash = md5(uniqid() . rand(0, 100));
      $user_agent = Session::uagent_no_version();
      Cookie::set(REMEMBER_ME_COOKIE_NAME, $hash, REMEMBER_ME_COOKIE_EXPIRY);
      $fields = ['session'=>$hash, 'user_agent'=>$user_agent, 'user_id'=>$this->id];
      self::$_db->query("DELETE FROM user_sessions WHERE user_id = ? AND user_agent = ?", [$this->id, $user_agent]);
      $us = new UserSessions();
      $us->assign($fields);
      $us->save();
    }
  }

  public static function loginUserFromCookie() {
    $userSession = UserSessions::getFromCookie();
    if($userSession && $userSession->user_id != '') {
      $user = self::findById((int)$userSession->user_id);
      if($user) {
        $user->login();
      }
      return $user;
    }
    return;
  }

  public function logout() {
    $userSession = UserSessions::getFromCookie();
    if($userSession) $userSession->delete();
    Session::delete(CURRENT_USER_SESSION_NAME);
    if(Cookie::exists(REMEMBER_ME_COOKIE_NAME)) {
      Cookie::delete(REMEMBER_ME_COOKIE_NAME);
    }
    self::$currentLoggedInUser = null;
    return true;
  }

    public function isReviewer()
  {
      return $this->is_reviewer === 1;
  }

  public function isApprover()
  {
      return $this->is_approver === 1;
  }


  
  public function acls() {
    if(empty($this->acl)) return [];
    return json_decode($this->acl, true);
  }

  public static function addAcl($user_id,$acl){
    $user = self::findById($user_id);
    if(!$user) return false;
    $acls = $user->acls();
    if(!in_array($acl,$acls)){
      $acls[] = $acl;
      $user->acl = json_encode($acls);
      $user->save();
    }
    return true;
  }

  public static function removeAcl($user_id, $acl){
    $user = self::findById($user_id);
    if(!$user) return false;
    $acls = $user->acls();
    if(in_array($acl,$acls)){
      $key = array_search($acl,$acls);
      unset($acls[$key]);
      $user->acl = json_encode($acls);
      $user->save();
    }
    return true;
  }
    public static function getOptionsForForm()
  {
    $params = [
      'columns' => 'id, fname,lname',
      'order' => 'id',
    ];
    $users = self::find($params);
    $usersAry = ['' => '-Select-'];
    foreach ($users as $user) {
      $usersAry[$user->id] = $user->fname . " " . $user->lname;
    }
    return $usersAry;
  }
    public static function fetchDataList($options)
  {
      $db = DB::getInstance();
      $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 10;
      $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
      $where = "users.deleted = 0";
      $binds = [];
      if(array_key_exists('department',$options) && !empty($options['department'])){
        $where .= " AND departments.id = ?";
        $binds[] = $options['department'];
      }

    if(array_key_exists('branches',$options) && !empty($options['branches'])){
      $where .= " AND branches.id = ?";
      $binds[] = $options['branches'];
    }

    if(array_key_exists('userlevels',$options) && !empty($options['userlevels'])){
      $where .= " AND userlevels.id = ?";
      $binds[] = $options['userlevels'];
    }


      if(array_key_exists('search',$options) && !empty($options['search'])){
        $where .= " AND (users.fname LIKE ? OR departments.name LIKE ? OR branches.name LIKE ?)";
        $binds[] = "%" . $options['search'] . "%";
        $binds[] = "%" . $options['search'] . "%";
        $binds[] = "%" . $options['search'] . "%";

      }

      $select = "SELECT COUNT(*) as total";
      $sql = " FROM users
              LEFT JOIN departments ON departments.id = users.department_id
              LEFT JOIN branches ON branches.id = users.branch_id
              LEFT JOIN userlevels ON userlevels.id = users.userlevel_id
              WHERE {$where} 
            ";
      $total = $db->query($select . $sql, $binds)->first()->total;

      $select = "SELECT users.id,users.username,users.fname,users.lname,users.blocked,users.contact,users.email,users.designation,users.signature,departments.name as department,branches.name as branch,userlevels.name as user_level";
      $pager = " Limit ? OFFSET ?";
      $binds[] = $limit;
      $binds[] = $offset;

      $results = $db->query($select . $sql . $pager, $binds)->results();

      return ['results' => $results, 'total' => $total];
  }
}
