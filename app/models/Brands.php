<?php
  namespace App\Models;
  use Core\Model;
  use Core\Validators\{RequiredValidator, UniqueStringValidator, UniqueValidator};

  class Brands extends Model{
    public $id, $created_at, $updated_at, $name, $deleted = 0,$user_id;
    protected static $_table = 'brands';
    protected static $_softDelete = true;

    public function beforeSave(){
      $this->timeStamps();
    }

    public function validator(){
      $this->runValidation(new RequiredValidator($this,['field'=>'name','msg'=>'Brand Name is required.']));
      // $this->runValidation(new UniqueValidator($this,['field'=>['name','user_id','deleted'],'msg'=>'That Brand Name already exists.']));
      $this->runValidation(new UniqueStringValidator($this,['field'=>['name'],'msg'=>'That Name already exists, edit that one instead']));

    }

    public static function findByUserIdAndId($user_id,$id){
      return self::findFirst([
        'conditions' => "user_id = ? AND id = ?",
        'bind' => [$user_id,$id]
      ]);
    }

    public static function getOptionsForForm($user_id=''){
      $params = [
        'columns' => 'id, name',
        'order' => 'name'
      ];

      if(!empty($user_id)){
        $params['conditions'] = "user_id = ?";
        $params['bind'][] = $user_id;
      }
      $brands = self::find($params);
      $brandsAry = [''=>'-Select Brand-'];
      foreach($brands as $brand){
        $brandsAry[$brand->id] = $brand->name;
      }
      return $brandsAry;
    }

    public static function brandsData($options)
    {
        self::$_softDelete = false;
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 5;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "brands.deleted = 0";
        $binds = [];


        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (brands.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
        }
        $params1 = [
            'columns' => "brands.*",
            // 'conditions' => "products.featured = 1 AND products.deleted = 0 AND  pi.sort = 0",
            'conditions' => $where,
            // 'bind' => [$brand_id,$product_name],
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

        // self::$_softDelete = false;
        // return self::find($params);
    }
  }
