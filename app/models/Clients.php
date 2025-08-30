<?php
  namespace App\Models;
  use Core\Model;
  use Core\Validators\{RequiredValidator,UniqueValidator};

  class Clients extends Model{
    public $id, $created_at, $updated_at, $name, $client_category_id,$deleted = 0,$user_id;
    protected static $_table = 'clients';
    protected static $_softDelete = true;

    public function beforeSave(){
      $this->timeStamps();
    }

    public function validator(){
      $this->runValidation(new RequiredValidator($this,['field'=>'name','msg'=>'Client Name is required.']));
      $this->runValidation(new RequiredValidator($this,['field'=>'client_category_id','msg'=>'Client Category is required.']));
      $this->runValidation(new UniqueValidator($this,['field'=>['name','user_id','deleted'],'msg'=>'That Client Name already exists.']));
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
      $clients = self::find($params);
      $clientsAry = [''=>'-Select Client-'];
      foreach($clients as $client){
        $clientsAry[$client->id] = $client->name;
      }
      return $clientsAry;
    }
    public static function fetchData($options)
    {
        self::$_softDelete = false;
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 5;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "clients.deleted = 0";
        $binds = [];


        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (clients.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
        }
        if (array_key_exists('client_category_search', $options) && !empty($options['client_category_search'])) {
            $where .= " AND clients.client_category_id = ?";
            $binds[] = $options['client_category_search'];
        }
        $params1 = [
            'columns' => "clients.*, client_categories.name as category",
            'conditions' => $where,
            'bind' => $binds,
            'joins' => [
              ['client_categories', 'client_categories.id = clients.client_category_id', 'client_categories', 'LEFT']          ]
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
