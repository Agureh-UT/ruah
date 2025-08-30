<?php
  namespace App\Models;
  use Core\Model;
  use Core\Validators\{RequiredValidator,UniqueValidator};

  class ItemCategories extends Model{
    public $id, $created_at, $updated_at, $name, $deleted = 0,$user_id;
    protected static $_table = 'item_categories';
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
        'order' => 'id'
      ];

      $datalists = self::find($params);
      $dataAry = [''=>'-Select New-'];
      foreach($datalists as $data){
        $dataAry[$data->id] = $data->name;
      }
      return $dataAry;
    }
    public static function fetchData($options)
    {
        self::$_softDelete = false;
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 5;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "item_categories.deleted = 0";
        $binds = [];


        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (item_categories.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
        }
        $params1 = [
            'columns' => "item_categories.*",
            'conditions' => $where,
            'bind' => $binds
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
  }
