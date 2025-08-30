<?php

namespace App\Models;

use Core\{Model, DB, H};
use Core\Validators\{RequiredValidator, NumericValidator};
use App\Models\{Budgetlines, Costcentres, Clients, Clusters};

class Projects extends Model
{

  public $id, $created_at, $updated_at, $user_id, $code, $name, $client_id, $cluster_id, $country_id;
  public $start_date, $end_date,$is_active=1,$deleted = 0;
  const blackList = ['id', 'deleted'];
  protected static $_table = 'projects';
  protected static $_softDelete = true;

  public function beforeSave()
  {
    $this->timeStamps();
  }

  public function validator()
  {
    $requiredFields = ['name' => 'Name.', 'code' => 'Code', 'country_id' => 'Country'];
    foreach ($requiredFields as $field => $display) {
        $this->runValidation(new RequiredValidator($this, ['field' => $field, 'msg' => $display . " is required."]));
    }
  }

  public static function findByUserId($user_id, $params = [])
  {
    $conditions = [
      'conditions' => "user_id = ?",
      'bind' => [(int)$user_id],
      'order' => 'id'
    ];
    $params = array_merge($conditions, $params);
    return self::find($params);
  }

  public static function findByIdAndActiveStatus($id)
  {
    $conditions = [
      'conditions' => "id = ? AND is_active = 1",
      'bind' => [(int)$id]
    ];
    return self::findFirst($conditions);
  }

  public static function findActiveProjects()
  {
    $conditions = [
      'conditions' => "is_active = 1",
      // 'bind' => [(int)$id]
    ];
    return self::find($conditions);
  }
  public static function findByIdAndUserId($id, $user_id)
  {
    $conditions = [
      'conditions' => "id = ? AND user_id = ?",
      'bind' => [(int)$id, (int)$user_id]
    ];
    return self::findFirst($conditions);
  }



  public function getClientName()
  {
    if (empty($this->client_id)) return '';
    $client = Clients::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->client_id]
    ]);
    return ($client) ? $client->name : '';
  }

  public function getClusterName()
  {
    if (empty($this->cluster_id)) return '';
    $cluster = Clusters::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->cluster_id]
    ]);
    return ($cluster) ? $cluster->name : '';
  }
  public function getBudgetlines()
  {

    $sql = "
      SELECT budgetlines.id, budgetlines.name, refs.budgeted_amount
      FROM budgetlines
      JOIN project_budgetline_refs as refs ON budgetlines.id = refs.budgetline_id
      WHERE refs.project_id = ? AND refs.budgeted_amount > 0
      ";
    return DB::getInstance()->query($sql, [$this->id])->results();
  }
  public static function getCountryCurrencyByProjectId($project_id) {
    $db = DB::getInstance();
    $sql = "SELECT projects.id,projects.code,projects.country_id,countries.name as country, currencies.id as currency_id, currencies.name as currency
    FROM projects
    LEFT JOIN countries ON projects.country_id = countries.id
    LEFT JOIN currencies ON countries.currency_id = currencies.id
    WHERE projects.id = ?";
      // return $db->query($sql, [], ProjectEmployees::class)->results();
      return $db->query($sql, [(int) $project_id])->first();
  }
  public function Projectsreport()
  {
    $sql = "SELECT projects.*, clients.name as client,clusters.name as cluster
              FROM projects
              JOIN clients
              ON projects.client_id = clients.id
              JOIN clusters
              ON projects.cluster_id = clusters.id
              WHERE projects.deleted = '0'
              ";
    return $this->query($sql)->results();
  }
  public static function getOptionsForForm($user_id = '')
  {
    $params = [
      'columns' => 'id, name, code',
      'order' => 'id'
    ];

    if (!empty($user_id)) {
      $params['conditions'] = "user_id = ?";
      $params['bind'][] = $user_id;
    }
    $projects = self::find($params);
    $projectsAry = ['' => '-Select Project-'];
    foreach ($projects as $project) {
      $projectsAry[$project->id] = $project->code . '::' .$project->name;

    }
    return $projectsAry;
  }
  public static function getActiveProjectOptionsForForm()
  {
    $params = [
      'columns' => 'id, name, code',
      'conditions' => "is_active = 1",
      'order' => 'id'
    ];

    $projects = self::find($params);
    // $projectsAry = ['' => '-Select Project-'];
        $projectsAry = [];

    foreach ($projects as $project) {
      $projectsAry[$project->id] = $project->code . '::' .$project->name;

    }
    return $projectsAry;
  }
  public static function fetchDataList($options)
  {
      $db = DB::getInstance();
      $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 10;
      $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
      $where = "projects.deleted = 0";
      $binds = [];
      if(array_key_exists('client',$options) && !empty($options['client'])){
        $where .= " AND clients.id = ?";
        $binds[] = $options['client'];
      }

    if(array_key_exists('cluster',$options) && !empty($options['cluster'])){
      $where .= " AND clusters.id = ?";
      $binds[] = $options['cluster'];
    }

    if(array_key_exists('start_date',$options) && !empty($options['start_date'])){
        $where .= " AND projects.start_date >= ?";
        $binds[] = $options['start_date'];
      }

      if(array_key_exists('end_date',$options) && !empty($options['end_date'])){
        $where .= " AND projects.end_date <= ?";
        $binds[] = $options['end_date'];
      }

      if(array_key_exists('search',$options) && !empty($options['search'])){
        $where .= " AND (projects.name LIKE ? OR clients.name LIKE ? OR clusters.name LIKE ?)";
        $binds[] = "%" . $options['search'] . "%";
        $binds[] = "%" . $options['search'] . "%";
        $binds[] = "%" . $options['search'] . "%";

      }

      $select = "SELECT COUNT(*) as total";
      $sql = " FROM projects
              LEFT JOIN clients ON clients.id = projects.client_id
              LEFT JOIN clusters ON clusters.id = projects.cluster_id
              LEFT JOIN users ON users.id = projects.user_id
              WHERE {$where} ORDER BY projects.id DESC
            ";
      $total = $db->query($select . $sql, $binds)->first()->total;

      $select = "SELECT projects.id,projects.code,projects.name,projects.start_date,projects.end_date,projects.is_active,clients.name as client,clusters.name as cluster,users.username as createdBy";
      $pager = " Limit ? OFFSET ?";
      $binds[] = $limit;
      $binds[] = $offset;

      $results = $db->query($select . $sql . $pager, $binds)->results();

      return ['results' => $results, 'total' => $total];
  }
  public function getDetailsForPrint()
  { 
      $sql = "
      SELECT p.id,pbr.id as pbr_id,p.start_date,p.end_date,clients.name as clientname,pbr.budgeted_amount,pbr.code as budgetlinecode, budgetlines.name as budgetlinename,p.code as projectcode,p.name as projectname
      FROM projects as p 
      JOIN project_budgetline_refs as pbr ON pbr.project_id  = p.id
      JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      JOIN clients ON p.client_id  = clients.id
      WHERE p.id = ? AND p.deleted = 0
      ORDER BY pbr.code";    
    //   H::dnd(DB::getInstance()->query($sql, [$this->id])->results()); 
      return DB::getInstance()->query($sql, [$this->id])->results();
  }

  // public static function findProjectsWithAssignedEmployees()
  // { 
  //   $db = DB::getInstance();
  //   $sql ="SELECT p.id,p.code,p.name
  //   FROM payroll_details 
  //   LEFT JOIN projects AS p ON payroll_details.project_id = p.id
  //   GROUP BY payroll_details.project_id";
  //     return $db->query($sql)->results();
  // }

  public static function findProjectsWithAssignedEmployees()
  { 
    $db = DB::getInstance();
    $sql ="SELECT p.id,p.code,p.name
    FROM project_employees 
    LEFT JOIN projects AS p ON project_employees.project_id = p.id
    WHERE p.deleted = 0 AND p.is_active = 1
    GROUP BY project_employees.project_id";
      return $db->query($sql)->results();
  }


  
  public static function getProjectBudgetlineRefs()
  { 
      $sql = "
      SELECT p.id,pbr.id as pbr_id,p.start_date,p.end_date,clients.name as clientname,pbr.budgeted_amount,pbr.code as budgetlinecode, budgetlines.name as budgetlinename,p.code as projectcode,p.name as projectname
      FROM projects as p 
      JOIN project_budgetline_refs as pbr ON pbr.project_id  = p.id
      JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      JOIN clients ON p.client_id  = clients.id
      WHERE p.deleted = 0";    
    //   H::dnd(DB::getInstance()->query($sql, [$this->id])->results()); 
      return DB::getInstance()->query($sql)->results();
  
  }
}
