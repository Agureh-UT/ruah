<?php
  namespace App\Models;

use Core\DB;
use Core\Model;
  use Core\Validators\{RequiredValidator, UniqueStringValidator, UniqueValidator};

  class Branches extends Model{
    public $id, $created_at, $updated_at, $name,$country_id, $deleted = 0;
    protected static $_table = 'branches';
    protected static $_softDelete = true;

    public function beforeSave(){
      $this->timeStamps();
    }

    public function validator(){
      $this->runValidation(new RequiredValidator($this,['field'=>'name','msg'=>'Branch Name is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'country_id','msg'=>'Country Name is required.']));
      // $this->runValidation(new UniqueValidator($this,['field'=>['name','user_id','deleted'],'msg'=>'That Branch Name already exists.']));
      $this->runValidation(new UniqueStringValidator($this,['field'=>['name'],'msg'=>'That Name already exists, edit that one instead']));

    }

    public static function findByUserIdAndId($user_id,$id){
      return self::findFirst([
        'conditions' => "user_id = ? AND id = ?",
        'bind' => [$user_id,$id]
      ]);
    }

    // public static function getOptionsForForm($user_id=''){
    //   $params = [
    //     'columns' => 'id, name',
    //     'order' => 'name'
    //   ];

    //   if(!empty($user_id)){
    //     $params['conditions'] = "user_id = ?";
    //     $params['bind'][] = $user_id;
    //   }
    //   $branches = self::find($params);
    //   $branchesAry = [''=>'-Select Branch-'];
    //   foreach($branches as $branch){
    //     $branchesAry[$branch->id] = $branch->name;
    //   }
    //   return $branchesAry;
    // }
    public static function getOptionsForForm($user_id=''){
      $params = [
        'columns' => 'id, name',
        'order' => 'name'
      ];

      if(!empty($user_id)){
        $params['conditions'] = "user_id = ?";
        $params['bind'][] = $user_id;
      }
      $branches = self::find($params);
      $branchesAry = [""=>'-Select Branch-'];
      foreach($branches as $branch){
        $branchesAry[$branch->id] = $branch->name;
      }
      return $branchesAry;
    }

    public static function fetchData($options)
    {
        self::$_softDelete = false;
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 5;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "branches.deleted = 0";
        $binds = [];


        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (branches.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
        }
        if (array_key_exists('country_search', $options) && !empty($options['country_search'])) {
            $where .= " AND branches.country_id = ?";
            $binds[] = $options['country_search'];
        }
        $params1 = [
            'columns' => "branches.*, countries.name as country",
            'conditions' => $where,
            'bind' => $binds,
            'joins' => [
              ['countries', 'countries.id = branches.country_id', 'countries', 'LEFT'],
              // ['currencies', 'currencies.id = countries.currency_id', 'currencies', 'LEFT'],
          ]
            // 'order' => 'branches.id DESC',
        ];
        $total = count(self::find($params1));

        $params2 = [
            'limit' => $limit,
            'offset' => $offset
        ];
        $paramsfinal = array_merge($params1, $params2);
        $results = self::find($paramsfinal);
        return ['results' => $results, 'total' => $total];

    }
    public static function getCountryCurrencyByBranchId($branch_id) {
      $db = DB::getInstance();
      $sql = "SELECT branches.id,branches.name,branches.country_id,countries.name as country, currencies.id as currency_id, currencies.name as currency
      FROM branches
      LEFT JOIN countries ON branches.country_id = countries.id
      LEFT JOIN currencies ON countries.currency_id = currencies.id
      WHERE branches.id = ?";
        // return $db->query($sql, [], ProjectEmployees::class)->results();
        return $db->query($sql, [(int) $branch_id])->results();
    }
  }