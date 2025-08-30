<?php

namespace App\Models;

use Core\DB;
use Core\Model;
use App\Models\Users;
use App\Models\Branches;
use App\Models\Suppliers;
use App\Models\PurchaseOrders;
use App\Models\RequisitionItems;
use Core\H;
use Core\Validators\RequiredValidator;

class Requisitions extends Model
{

  public $id, $created_at, $updated_at, $ref_no, $user_id, $branch_id, $country_id, $currency_id, $department_id, $valid_date, $reviewed_by, $reviewed = 0, $approved = 0, $approved_by, $deleted = 0, $processed_flag = 0, $has_doc_linked = 0;

  const blackList = ['id', 'deleted', 'ref_no'];
  protected static $_table = 'requisitions';
  protected static $_softDelete = true;

  public function beforeSave()
  {
    $this->timeStamps();
  }
  public function validator()
  {
    // $requiredFields = ['ref_no' => 'Requisition No.Branch', 'valid_date' => 'Valid Date', 'branch_id' => 'Branch', 'department_id' => 'Department'];
    // foreach ($requiredFields as $field => $display) {
    //     $this->runValidation(new RequiredValidator($this, ['field' => $field, 'msg' => $display . " is required."]));
    // }
    $this->runValidation(new RequiredValidator($this, ['field' => 'ref_no', 'msg' => 'Requisition Ref No is required.']));
    $this->runValidation(new RequiredValidator($this, ['field' => 'valid_date', 'msg' => 'Valid Date is required.']));
    $this->runValidation(new RequiredValidator($this, ['field' => 'branch_id', 'msg' => 'Branch is required.']));
    $this->runValidation(new RequiredValidator($this, ['field' => 'department_id', 'msg' => 'Department is required.']));
  }

  public static function findOrCreate($id)
  {
    $item = self::findById($id);
    
    if (!$item) {
      $item = new self();
      $item->user_id = Users::currentUser()->id;
      
      // Generate new reference number
      $lastRequisition = self::findFirst([
        'includeDeleted' => true,
        'order' => 'ref_no DESC'
      ]);
      
      if ($lastRequisition) {
        $item->ref_no = $lastRequisition->ref_no + 1;
      } else {
        $company = Companies::findById(1);
        $item->ref_no = $company ? $company->req_no : 1;
      }
    }
    
    return $item;
  }

  public static function findByUserId($user_id, $params = [])
  {
    $conditions = [
      'conditions' => "user_id = ?",
      'bind' => [(int) $user_id],
      'order' => 'id',
    ];
    $params = array_merge($conditions, $params);
    return self::find($params);
  }

  public static function findByIdAndUserId($id, $user_id)
  {
    $conditions = [
      'conditions' => "id = ? AND user_id = ?",
      'bind' => [(int) $id, (int) $user_id],
    ];
    return self::findFirst($conditions);
  }


  public function getUserdetails()
  {
    if (empty($this->user_id)) {
      return '';
    }

    $user = Users::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->user_id],
    ]);
    return ($user) ? $user->username : '';
  }

  public function getBranchdetails()
  {
    if (empty($this->branch_id)) {
      return '';
    }

    $branch = Branches::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->branch_id],
    ]);
    return ($branch) ? $branch->name : '';
  }

  public function getCountrydetails()
  {
    if (empty($this->country_id)) {
      return '';
    }

    $country = Countries::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->country_id],
    ]);
    return ($country) ? $country : '';
  }

  public function getCurrencydetails()
  {
    if (empty($this->currency_id)) {
      return '';
    }

    $currency = Currencies::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->currency_id],
    ]);
    return ($currency) ? $currency->code . '(' . $currency->symbol . ')' : '';
  }

  public static function getOptionsForForm()
  {
    $params = [
      'columns' => 'id, ref_no',
      'order' => 'id',
    ];
    $reqs = self::find($params);
    $reqsAry = ['' => '-Select Trx-'];
    foreach ($reqs as $req) {
      $reqsAry[$req->id] = $req->ref_no;
    }
    return $reqsAry;
  }
  public static function findCurrentRequisitionOrCreateNew($id, $user_id)
  {
    if ($id == 'new') {
      $requisition = new Requisitions();
      $requisition->save();
    } else {
      $requisition_id = $id;
      $requisition = self::findByIdAndUserId((int)$requisition_id, $user_id);
    }
    return $requisition;
  }
  public static function findAllItemsByRequisitionId($requisition_id)
  {
    $db = DB::getInstance();
    $sql = "SELECT items.*,pbr.code as budgetlinecode, b.name as budgetlinename,p.name as productname
      FROM requisition_items as items
      JOIN items as p ON p.id = items.item_id
      JOIN project_budgetline_refs as pbr ON pbr.id = items.project_budgetline_ref_id
      JOIN budgetlines as b ON b.id = pbr.budgetline_id
      WHERE items.requisition_id = ? AND items.deleted = 0";

    return $db->query($sql, [(int)$requisition_id], RequisitionItems::class)->results();
  }

  public static function itemCountCurrentRequisition($id)
  {
    if ($id == 'new') {
      return 0;
    }
    $requisition_id = $id;
    $db = DB::getInstance();
    $sql = "SELECT SUM(qty) as qty FROM requisition_items WHERE requisition_id = ? AND deleted = 0";
    $result = $db->query($sql, [(int)$requisition_id])->first();
    return $result->qty;
  }
  // public static function getRequisitionsByDateRange($range = 'last-28')
  // {
  //     $today = date("Y-m-d");
  //     $range = str_replace("last-", "", $range);
  //     $fromDate = date("Y-m-d", strtotime("-" . $range . " days"));
  //     $db = DB::getInstance();
  //     $sql = "SELECT DATE(created_at) as created_at, SUM(qty*price) as total,r.ref_no,s.name,u.name,r.processed,valid_date
  //     FROM `requisition_items`
  //     JOIN requisitions as r ON r.id = requisition_items.requisition_id
  //     JOIN items as p ON p.id = items.item_id
  //     JOIN budgetlines as b ON b.id = items.budgetline_id
  //     LEFT JOIN suppliers ON suppliers.id = r.supplier_id
  //     LEFT JOIN users ON users.id = r.user_id
  //     WHERE r.processed = 0 AND created_at BETWEEN ? AND ?
  //     GROUP BY DATE(created_at)";
  //     return $db->query($sql, [$fromDate, $today . " 23:59:59"])->results();
  // }
  // public static function getDailyRequisitions($range = 'last-28')
  // {
  //     $today = date("Y-m-d");
  //     $range = str_replace("last-", "", $range);
  //     $fromDate = date("Y-m-d", strtotime("-" . $range . " days"));
  //     $db = DB::getInstance();
  //     $sql = "SELECT DATE(created_at) as created_at, SUM(qty*price) as total,r.ref_no,s.name as supplier,u.username,r.processed,valid_date
  //     FROM `requisition_items`
  //     JOIN requisitions as r ON r.id = requisition_items.requisition_id
  //     LEFT JOIN suppliers ON suppliers.id = r.supplier_id
  //     LEFT JOIN users ON users.id = r.user_id
  //     WHERE r.processed = 0 AND created_at BETWEEN ? AND ?
  //     GROUP BY DATE(created_at)";
  //     return $db->query($sql, [$fromDate, $today . " 23:59:59"])->results();
  // }

  public static function itemCountUnApproved()
  {
    $db = DB::getInstance();
    $sql = "SELECT COUNT(*) AS total FROM requisitions WHERE approved = 0 AND deleted = 0";
    $results = $db->query($sql);
    $total = sizeof($results->results()) > 0 ? $results->results()[0]->total : 0;
    return $total;
  }

  public static function itemCountUnReviewed()
  {
    $db = DB::getInstance();
    $sql = "SELECT COUNT(*) AS total FROM requisitions WHERE reviewed = 0 AND deleted = 0";
    $results = $db->query($sql);
    $total = sizeof($results->results()) > 0 ? $results->results()[0]->total : 0;
    return $total;
  }

  // public function getLinkedDoc()
  // {
  //   // if (!($this->has_doc_linked)) {
  //   //   return ['id' => "", 'id' => ""];
  //   // }

  //   $DocLinked = PurchaseOrders::findFirst([
  //     'conditions' => "document_id = ?",
  //     'bind' => [$this->id],
  //   ]);
  //   // H::dnd($DocLinked);
  //   return ($DocLinked) ? ['id' => $DocLinked->id, 'RefNo' => $DocLinked->ref_no] : ['id' => "new", 'RefNo' => ""];
  // }

  public static function getLinkedDoc($requisition_id)
  {
    // if (!($this->has_doc_linked)) {
    //   return ['id' => "", 'id' => ""];
    // }

    $DocLinked = PurchaseOrders::findFirst([
      'conditions' => "document_id = ?",
      'bind' => [(int)$requisition_id],
    ]);
    // H::dnd($DocLinked);
    return ($DocLinked) ? ['id' => $DocLinked->id, 'RefNo' => $DocLinked->ref_no] : ['id' => "new", 'RefNo' => ""];
  }

  public static function fetchDataList($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    $where = "requisitions.deleted = 0";
    // if(!self::hasFilters($options)){
    //   $where .= " AND items.featured = '1'";
    // }
    $binds = [];

    if (array_key_exists('branch', $options) && !empty($options['branch'])) {
      $where .= " AND b.id = ?";
      $binds[] = $options['branch'];
    }

    if (array_key_exists('department', $options) && !empty($options['department'])) {
      $where .= " AND d.id = ?";
      $binds[] = $options['department'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND requisitions.valid_date >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND requisitions.valid_date <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (requisitions.ref_no LIKE ? OR b.name LIKE ? OR d.name LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";

    $sql = " FROM requisitions
                LEFT JOIN users as u ON u.id = requisitions.user_id
                LEFT JOIN branches as b ON b.id = requisitions.branch_id
                LEFT JOIN departments as d ON d.id = requisitions.department_id
                WHERE {$where} ORDER BY requisitions.id DESC
              ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT requisitions.*, u.username as username,b.name as branch,d.name as department";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds, Requisitions::class)->results();

    return ['results' => $results, 'total' => $total];
  }
  public static function fetchUnreviewed($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    $where = "requisitions.deleted = 0 AND requisitions.reviewed = 0";
    // if(!self::hasFilters($options)){
    //   $where .= " AND items.featured = '1'";
    // }
    $binds = [];

    if (array_key_exists('branch', $options) && !empty($options['branch'])) {
      $where .= " AND b.id = ?";
      $binds[] = $options['branch'];
    }

    if (array_key_exists('department', $options) && !empty($options['department'])) {
      $where .= " AND d.id = ?";
      $binds[] = $options['department'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND requisitions.valid_date >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND requisitions.valid_date <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (requisitions.ref_no LIKE ? OR b.name LIKE ? OR d.name LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";

    $sql = " FROM requisitions
                LEFT JOIN users as u ON u.id = requisitions.user_id
                LEFT JOIN branches as b ON b.id = requisitions.branch_id
                LEFT JOIN departments as d ON d.id = requisitions.department_id
                WHERE {$where} ORDER BY requisitions.id DESC
              ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT requisitions.*, u.username as username,b.name as branch,d.name as department";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds, Requisitions::class)->results();

    return ['results' => $results, 'total' => $total];
  }

  public static function fetchUnapproved($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    $where = "requisitions.deleted = 0 AND requisitions.approved = 0";
    // if(!self::hasFilters($options)){
    //   $where .= " AND items.featured = '1'";
    // }
    $binds = [];

    if (array_key_exists('branch', $options) && !empty($options['branch'])) {
      $where .= " AND b.id = ?";
      $binds[] = $options['branch'];
    }

    if (array_key_exists('department', $options) && !empty($options['department'])) {
      $where .= " AND d.id = ?";
      $binds[] = $options['department'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND requisitions.valid_date >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND requisitions.valid_date <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (requisitions.ref_no LIKE ? OR b.name LIKE ? OR d.name LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";

    $sql = " FROM requisitions
                LEFT JOIN users as u ON u.id = requisitions.user_id
                LEFT JOIN branches as b ON b.id = requisitions.branch_id
                LEFT JOIN departments as d ON d.id = requisitions.department_id
                WHERE {$where} ORDER BY requisitions.id DESC
              ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT requisitions.*, u.username as username,b.name as branch,d.name as department";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds, Requisitions::class)->results();

    return ['results' => $results, 'total' => $total];
  }
  // public static function findAll(){
  //     $sql = "
  //     SELECT requisitions.* FROM requisitions";
  //     return DB::getInstance()->query($sql)->results();
  // }

  public static function getExcelData($start_date, $end_date)
  {
    $db = DB::getInstance();
    $sql = "SELECT requisition_items.created_at as created_at, qty, requisition_items.price, (qty*requisition_items.price) as total,r.ref_no,r.id as req_id,u.username,pbr.code as budgetlinecode, b.name as budgetlinename,p.name as productname,requisition_items.valid_date as valid_date
        FROM requisition_items
        JOIN requisitions as r ON r.id = requisition_items.requisition_id
        JOIN items as p ON p.id = requisition_items.item_id
        JOIN project_budgetline_refs as pbr ON pbr.id = requisition_items.project_budgetline_ref_id
        JOIN budgetlines as b ON b.id = pbr.budgetline_id
        LEFT JOIN users as u ON u.id = r.user_id
        WHERE requisition_items.valid_date >= ? AND requisition_items.valid_date <= ? AND requisition_items.deleted = 0
        ORDER BY r.ref_no";
    // return $db->query($sql, [$start_date, $end_date], RequisitionItems::class)->results();
    return $db->query($sql, [$start_date, $end_date])->results();
  }

  // public static function getRequisitionsExcelData2($range = 'last-28')
  // {
  //     $today = date("Y-m-d");
  //     $range = str_replace("last-", "", $range);
  //     $fromDate = date("Y-m-d", strtotime("-" . $range . " days"));
  //     $db = DB::getInstance();
  //     $sql = "SELECT DATE(created_at) as created_at, SUM(qty*price) as total,r.ref_no,s.name,u.name,r.processed,valid_date
  //     FROM `requisition_items`
  //     JOIN requisitions as r ON r.id = requisition_items.requisition_id
  //     LEFT JOIN suppliers ON suppliers.id = r.supplier_id
  //     LEFT JOIN users ON users.id = r.user_id
  //     WHERE r.processed = 0 AND created_at BETWEEN ? AND ?
  //     GROUP BY DATE(created_at)";
  //     return $db->query($sql, [$fromDate, $today . " 23:59:59"])->results();
  // }
  // public static function getRequisitionsExcelData3($start_date, $end_date)
  // {
  //     $db = DB::getInstance();
  //     $sql = "SELECT * FROM requisitions 
  //   WHERE processed = 0 AND valid_date BETWEEN ? AND ?
  //   ORDER BY valid_date DESC";
  //     return $db->query($sql, [$start_date, $end_date])->results();
  // }
  public function getDetailsForPrint()
  {
    $sql = "SELECT r.id,r.created_at,r.updated_at,
        requisition_items.qty,requisition_items.item_id,requisition_items.project_id,
        requisition_items.project_budgetline_ref_id, requisition_items.price,
        si_units.name as si_unit,si_units.id as si_unit_id, (requisition_items.qty* 0) as line_subtotal,
        r.ref_no,p.name as product_name,r.valid_date as valid_date,r.reviewed,
        r.approved,CONCAT(u.fname, ' ', u.lname) AS username,u.signature,CONCAT(ur.fname, ' ', ur.lname) as reviewer,ur.signature as reviewer_signature,
        CONCAT(ua.fname, ' ', ua.lname) as approver,ua.signature as approver_signature,pbr.code as budgetlinecode, 
        budgetlines.name as budgetlinename,projects.code as projectcode,projects.name as projectname,
        b.name as branch,d.name as department,u.designation,ur.designation as reviewer_designation,
        CONCAT(currencies.code,'(',currencies.symbol,')') as currency,
        countries.name as country,countries.logo,countries.short_name,countries.long_name,countries.address,countries.website,countries.phone,countries.email,
        ua.designation as approver_designation
        FROM requisitions as r 
        LEFT JOIN requisition_items ON requisition_items.requisition_id = r.id
        LEFT JOIN si_units ON si_units.id = requisition_items.si_unit_id
        LEFT JOIN items as p ON p.id = requisition_items.item_id
        LEFT JOIN branches as b ON b.id = r.branch_id
        LEFT JOIN departments as d ON d.id = r.department_id
        LEFT JOIN users as u ON u.id = r.user_id
        LEFT JOIN users as ur ON r.reviewed_by = ur.id 
        LEFT JOIN users as ua ON r.approved_by = ua.id
        LEFT JOIN project_budgetline_refs as pbr ON requisition_items.project_budgetline_ref_id = pbr.id 
        LEFT JOIN projects ON pbr.project_id = projects.id
        LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
        LEFT JOIN countries ON r.country_id = countries.id
        LEFT JOIN currencies ON r.currency_id = currencies.id
        WHERE r.id = ? AND r.deleted = 0 AND requisition_items.deleted = 0
        ORDER BY r.ref_no";
    //   H::dnd(); 
    // DB::getInstance()->query($sql, [$this->id])->results();
    return DB::getInstance()->query($sql, [$this->id], RequisitionItems::class)->results();
  }
  public function getDetailsForPrint28Dec23()
  {
    $sql = "
        SELECT r.id,r.created_at,r.updated_at,requisition_items.qty, requisition_items.price, si_units.name as si_unit, (requisition_items.qty*requisition_items.price) as line_subtotal,r.ref_no,p.name as product_name,r.valid_date as valid_date,r.reviewed,r.approved,u.username,u.signature,ur.username as reviewer,ur.signature as reviewer_signature,ua.username as approver,ua.signature as approver_signature,pbr.code as budgetlinecode, budgetlines.name as budgetlinename,projects.code as projectcode,projects.name as projectname,b.name as branch,d.name as department
        FROM requisitions as r 
        LEFT JOIN requisition_items ON requisition_items.requisition_id = r.id
        LEFT JOIN si_units ON si_units.id = requisition_items.si_unit_id
        LEFT JOIN items as p ON p.id = requisition_items.item_id
        LEFT JOIN branches as b ON b.id = r.branch_id
        LEFT JOIN departments as d ON d.id = r.department_id
        LEFT JOIN users as u ON u.id = r.user_id
        LEFT JOIN users as ur ON r.reviewed_by = ur.id 
        LEFT JOIN users as ua ON r.approved_by = ua.id
        LEFT JOIN project_budgetline_refs as pbr ON requisition_items.project_budgetline_ref_id = pbr.id 
        LEFT JOIN projects ON pbr.project_id = projects.id
        LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
        WHERE r.id = ? AND r.deleted = 0 AND requisition_items.deleted = 0
        ORDER BY r.ref_no";
    //   H::dnd(DB::getInstance()->query($sql, [$this->id])->results()); 
    return DB::getInstance()->query($sql, [$this->id])->results();
  }
}
