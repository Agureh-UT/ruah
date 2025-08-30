<?php
  namespace App\Models;
  use Core\Model;
  use Core\Validators\{RequiredValidator,UniqueValidator};

  class EmploymentTypes extends Model{
    public $id, $created_at, $updated_at, $name,$deleted = 0,$user_id;
    protected static $_table = 'employment_types';
    protected static $_softDelete = true;

    public function beforeSave(){
      $this->timeStamps();
    }

    public function validator(){
      $this->runValidation(new RequiredValidator($this,['field'=>'name','msg'=>'Name is required.']));
      $this->runValidation(new UniqueValidator($this,['field'=>['name','deleted'],'msg'=>'That Name already exists.']));
    }

    public static function findByUserIdAndId($user_id,$id){
      return self::findFirst([
        'conditions' => "user_id = ? AND id = ?",
        'bind' => [$user_id,$id]
      ]);
    }

    public static function getOptionsForForm(){
      $params = [
        'columns' => 'id, name',
      ];

      $results = self::find($params);
      $Ary = [0 =>'-Select Option-'];
      foreach($results as $result){
        $Ary[$result->id] = $result->name;
      }
      return $Ary;
    }
    public static function fetchData($options)
    {
        self::$_softDelete = false;
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 5;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "employment_types.deleted = 0";
        $binds = [];


        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (employment_types.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
        }
        $params1 = [
            'columns' => "employment_types.*",
            'conditions' => $where,
            'bind' => $binds,
            // 'order' => 'employment_types.id DESC',
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

    public function displayName()
    {
      return trim($this->name);
    }
  }
