<?php
  namespace App\Models;
  use Core\Model;
  use Core\Validators\{RequiredValidator,UniqueValidator};

  class Clusters extends Model{
    public $id, $created_at, $updated_at, $name, $deleted = 0;
    protected static $_table = 'clusters';
    protected static $_softDelete = true;

    public function beforeSave(){
      $this->timeStamps();
    }

    public function validator(){
      $this->runValidation(new RequiredValidator($this,['field'=>'name','msg'=>'Cluster Name is required.']));
      $this->runValidation(new UniqueValidator($this,['field'=>['name','user_id','deleted'],'msg'=>'That Cluster Name already exists.']));
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
      $clusters = self::find($params);
      $clustersAry = [''=>'-Select Cluster-'];
      foreach($clusters as $cluster){
        $clustersAry[$cluster->id] = $cluster->name;
      }
      return $clustersAry;
    }

    public static function fetchData($options)
    {
        self::$_softDelete = false;
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 5;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "clusters.deleted = 0";
        $binds = [];


        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (clusters.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
        }
        $params1 = [
            'columns' => "clusters.*",
            'conditions' => $where,
            'bind' => $binds,
            // 'order' => 'clusters.id DESC',
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
