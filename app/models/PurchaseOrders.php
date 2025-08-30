<?php

namespace App\Models;

use Core\H;
use Core\DB;
use Core\Model;
use App\Models\Companies;
use Core\Validators\RequiredValidator;

class PurchaseOrders extends Model
{

  public $id, $created_at, $updated_at, $ref_no, $user_id, $branch_id, $department_id, $supplier_id, $document_id, $valid_date, $reviewed_by, $description, $reviewed = 0, $approved = 0, $approved_by, $deleted = 0, $delivery_flag = 0, $has_rn = 0, $country_id, $currency_id;

  const blackList = ['id', 'deleted', 'ref_no'];
  protected static $_table = 'purchase_orders';
  protected static $_softDelete = true;

  public function beforeSave()
  {
    $this->timeStamps();
  }
  public function validator()
  {
    $requiredFields = ['ref_no' => 'PO No.', 'valid_date' => 'Valid Date', 'branch_id' => 'Branch', 'department_id' => 'Department', 'supplier_id' => 'Supplier', 'description' => 'Description'];
    foreach ($requiredFields as $field => $display) {
      $this->runValidation(new RequiredValidator($this, ['field' => $field, 'msg' => $display . " is required."]));
    }
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

  public function getSupplierdetails()
  {
    if (empty($this->supplier_id)) {
      return '';
    }

    $supplier = Suppliers::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->supplier_id],
    ]);
    return ($supplier) ? $supplier->name : '';
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

  public static function findByIdAndUserId($id, $user_id)
  {
    $conditions = [
      'conditions' => "id = ? AND user_id = ?",
      'bind' => [(int) $id, (int) $user_id],
    ];
    return self::findFirst($conditions);
  }

  // public function getLinkedDoc()
  // {
  //   // if (!($this->has_rn)) {
  //   //   return ['id' => "", 'RefNo' => ""];
  //   // }

  //   $DocLinked = ReceiveNotes::findFirst([
  //     'conditions' => "document_id = ?",
  //     'bind' => [$this->id],
  //   ]);
  //   // H::dnd($DocLinked);
  //   return ($DocLinked) ? ['id' => $DocLinked->id, 'RefNo' => $DocLinked->ref_no] : ['id' => "new", 'RefNo' => ""];
  // }
  public static function getLinkedDoc($purchase_order_id)
  {
    // if (!($this->has_rn)) {
    //   return ['id' => "", 'RefNo' => ""];
    // }

    $DocLinked = ReceiveNotes::findFirst([
      'conditions' => "document_id = ?",
      'bind' => [(int)$purchase_order_id],
    ]);
    // H::dnd($DocLinked);
    return ($DocLinked) ? ['id' => $DocLinked->id, 'RefNo' => $DocLinked->ref_no] : ['id' => "new", 'RefNo' => ""];
  }
  public static function getOptionsForForm()
  {
    $params = [
      // 'conditions' => "has_rn !=1",
      'columns' => 'id, ref_no',
      'order' => 'id',
    ];
    $datalist = self::find($params);
    $dataAry = ['' => '-Select New-'];
    foreach ($datalist as $data) {
      $dataAry[$data->id] = $data->ref_no;
    }
    return $dataAry;
  }

  public static function getOptionsForUnassigned()
  {
    $params = [
      'conditions' => "has_rn != 1",
      'columns' => 'id, ref_no',
      'order' => 'id',
    ];
    $datalist = self::find($params);
    $dataAry = ['' => '-Select New-'];
    foreach ($datalist as $data) {
      $dataAry[$data->id] = $data->ref_no;
    }
    return $dataAry;
  }

  public static function findAllItemsByPurchaseOrderId($purchase_order_id)
  {
    $db = DB::getInstance();
    $sql = "SELECT po_items.*,pbr.code as budgetlinecode, b.name as budgetlinename,p.name as productname
      FROM purchase_order_items as po_items
      JOIN items as p ON p.id = po_items.item_id
      JOIN project_budgetline_refs as pbr ON pbr.id = po_items.project_budgetline_ref_id
      JOIN budgetlines as b ON b.id = pbr.budgetline_id
      WHERE po_items.purchase_order_id = ? AND po_items.deleted = 0";

    return $db->query($sql, [(int)$purchase_order_id], PurchaseOrderItems::class)->results();
  }

  public static function getExcelData($start_date, $end_date)
  {
    $db = DB::getInstance();
    $sql = "SELECT purchase_order_items.created_at as created_at, qty, purchase_order_items.price, (qty*purchase_order_items.price) as total,po.ref_no,po.id as po_id, s.name as supplier,u.username,pbr.code as budgetlinecode, b.name as budgetlinename,p.name as productname,purchase_order_items.valid_date as valid_date
        FROM purchase_order_items
        JOIN purchase_orders as po ON po.id = purchase_order_items.purchase_order_id
        JOIN items as p ON p.id = purchase_order_items.item_id
        JOIN project_budgetline_refs as pbr ON pbr.id = purchase_order_items.project_budgetline_ref_id
        JOIN budgetlines as b ON b.id = pbr.budgetline_id
        LEFT JOIN suppliers as s ON s.id = po.supplier_id
        LEFT JOIN users as u ON u.id = po.user_id
        WHERE purchase_order_items.valid_date >= ? AND purchase_order_items.valid_date <= ? AND purchase_order_items.deleted = 0
        ORDER BY purchase_order_items.valid_date DESC";
    // return $db->query($sql, [$start_date, $end_date], RequisitionItems::class)->results();
    return $db->query($sql, [$start_date, $end_date])->results();
  }
  public function getDetailsForPrint2()
  {
    $sql = "
      SELECT 
      po.id,po.ref_no,po.valid_date,po.description,po.reviewed,po.approved,s.name as suppliername,u.username,u.signature,ur.username as reviewer,ur.signature as reviewer_signature,ua.username as approver,ua.signature as approver_signature,s.address as supplieraddress,refs.amount,pbr.budgeted_amount,pbr.code as budgetlinecode, budgetlines.name as budgetlinename,projects.code as projectcode
      FROM purchase_orders AS po
      LEFT JOIN purchase_items po_items ON purchase_order_items.purchase__order_id = po.id
      LEFT JOIN suppliers s ON po.supplier_id = s.id 
      LEFT JOIN users u ON po.user_id = u.id 
      LEFT JOIN users as ur ON po.reviewed_by = ur.id 
      LEFT JOIN users as ua ON po.approved_by = ua.id
      LEFT JOIN project_budgetline_refs as pbr ON purchase_order_items.project_budgetline_ref_id = pbr.id 
      LEFT JOIN projects ON pbr.project_id = projects.id
      LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      WHERE po.id = ? AND po.deleted = 0";
    return DB::getInstance()->query($sql, [$this->id])->results();
    // return DB::getInstance()->query($sql, [$this->id], Vouchers::class)->results();
    // $returnedData= DB::getInstance()->query($sql, [$this->id])->results();
    // $returnedData=DB::getInstance()->query($sql, [$this->id], Vouchers::class)->results();
    // H::dnd($returnedData);

  }

  public static function fetchDataList($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    $where = "purchase_orders.deleted = 0";
    // $where = "purchase_orders.deleted = 0 AND purchase_orders.has_rn !=1";
    // if(!self::hasFilters($options)){
    //   $where .= " AND items.featured = '1'";
    // }
    $binds = [];

    if (array_key_exists('supplier', $options) && !empty($options['supplier'])) {
      $where .= " AND s.id = ?";
      $binds[] = $options['supplier'];
    }

    if (array_key_exists('branch', $options) && !empty($options['branch'])) {
      $where .= " AND b.id = ?";
      $binds[] = $options['branch'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND purchase_orders.valid_date >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND purchase_orders.valid_date <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (purchase_orders.ref_no LIKE ? OR s.name LIKE ? OR b.name LIKE ? OR srf.ref_no LIKE ? OR purchase_orders.description LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";

    $sql = " FROM purchase_orders
              LEFT JOIN users as u ON u.id = purchase_orders.user_id
              LEFT JOIN suppliers as s ON s.id = purchase_orders.supplier_id
              LEFT JOIN branches as b ON b.id = purchase_orders.branch_id
              LEFT JOIN requisitions as srf ON srf.id = purchase_orders.document_id
              WHERE {$where} ORDER BY purchase_orders.id DESC
            ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT purchase_orders.*, u.username as username,s.name as supplier,b.name as branch,srf.ref_no as srf_no,srf.id as srf_id";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds, PurchaseOrders::class)->results();

    return ['results' => $results, 'total' => $total];
  }
  public static function fetchUnreviewed($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    $where = "purchase_orders.deleted = 0 AND purchase_orders.reviewed = 0";
    // $where = "purchase_orders.deleted = 0 AND purchase_orders.has_rn !=1";
    // if(!self::hasFilters($options)){
    //   $where .= " AND items.featured = '1'";
    // }
    $binds = [];

    if (array_key_exists('supplier', $options) && !empty($options['supplier'])) {
      $where .= " AND s.id = ?";
      $binds[] = $options['supplier'];
    }

    if (array_key_exists('branch', $options) && !empty($options['branch'])) {
      $where .= " AND b.id = ?";
      $binds[] = $options['branch'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND purchase_orders.valid_date >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND purchase_orders.valid_date <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (purchase_orders.ref_no LIKE ? OR s.name LIKE ? OR b.name LIKE ? OR srf.ref_no LIKE ? OR purchase_orders.description LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";

    $sql = " FROM purchase_orders
              LEFT JOIN users as u ON u.id = purchase_orders.user_id
              LEFT JOIN suppliers as s ON s.id = purchase_orders.supplier_id
              LEFT JOIN branches as b ON b.id = purchase_orders.branch_id
              LEFT JOIN requisitions as srf ON srf.id = purchase_orders.document_id
              WHERE {$where} ORDER BY purchase_orders.id DESC
            ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT purchase_orders.*, u.username as username,s.name as supplier,b.name as branch,srf.ref_no as srf_no,srf.id as srf_id";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds, PurchaseOrders::class)->results();

    return ['results' => $results, 'total' => $total];
  }
  public static function fetchUnapproved($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    $where = "purchase_orders.deleted = 0 AND purchase_orders.approved = 0";
    // $where = "purchase_orders.deleted = 0 AND purchase_orders.has_rn !=1";
    // if(!self::hasFilters($options)){
    //   $where .= " AND items.featured = '1'";
    // }
    $binds = [];

    if (array_key_exists('supplier', $options) && !empty($options['supplier'])) {
      $where .= " AND s.id = ?";
      $binds[] = $options['supplier'];
    }

    if (array_key_exists('branch', $options) && !empty($options['branch'])) {
      $where .= " AND b.id = ?";
      $binds[] = $options['branch'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND purchase_orders.valid_date >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND purchase_orders.valid_date <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (purchase_orders.ref_no LIKE ? OR s.name LIKE ? OR b.name LIKE ? OR srf.ref_no LIKE ? OR purchase_orders.description LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";

    $sql = " FROM purchase_orders
              LEFT JOIN users as u ON u.id = purchase_orders.user_id
              LEFT JOIN suppliers as s ON s.id = purchase_orders.supplier_id
              LEFT JOIN branches as b ON b.id = purchase_orders.branch_id
              LEFT JOIN requisitions as srf ON srf.id = purchase_orders.document_id
              WHERE {$where} ORDER BY purchase_orders.id DESC
            ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT purchase_orders.*, u.username as username,s.name as supplier,b.name as branch,srf.ref_no as srf_no,srf.id as srf_id";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds, PurchaseOrders::class)->results();

    return ['results' => $results, 'total' => $total];
  }

  public static function findOrCreate($document_id)
  {
    $item = self::findByUniqueFields($document_id);
    
    if (!$item) {
      $item = new self();
      $item->document_id = (int) $document_id;
      $item->user_id = Users::currentUser()->id;
      
      // Generate new reference number
      $lastPO = self::findFirst([
        'order' => 'ref_no DESC'
      ]);
      
      if ($lastPO) {
        $item->ref_no = $lastPO->ref_no + 1;
      } else {
        $company = Companies::findById(1);
        $item->ref_no = $company ? $company->po_no : 1;
      }
    }
    
    return $item;
  }

  public static function findByUniqueFields($document_id)
  {
    return self::findFirst([
      'conditions' => "document_id = ?",
      'bind' => [$document_id]
    ]);
  }

  public function getDetailsForPrint()
  {
    $sql = "SELECT po.id,po.description,po.created_at,po.updated_at,po.delivery_flag,srf.ref_no as srf_no,srf.id as srf_id,purchase_order_items.qty, purchase_order_items.item_id,purchase_order_items.project_id,purchase_order_items.project_budgetline_ref_id,
      purchase_order_items.price,si_units.name as si_unit,si_units.id as si_unit_id, (purchase_order_items.qty*purchase_order_items.price) as line_subtotal,po.ref_no,
      s.name as suppliername,s.address as supplieraddress,p.name as product_name,po.valid_date as valid_date,po.reviewed,
      po.approved,CONCAT(u.fname, ' ', u.lname) AS username,u.signature,CONCAT(ur.fname, ' ', ur.lname) as reviewer,ur.signature as reviewer_signature,
      CONCAT(ua.fname, ' ', ua.lname) as approver,ua.signature as approver_signature,
      pbr.code as budgetlinecode, budgetlines.name as budgetlinename,projects.code as projectcode,projects.name as projectname,
      CONCAT(currencies.code,'(',currencies.symbol,')') as currency,
      countries.name as country,countries.logo,countries.short_name,countries.long_name,countries.address,countries.website,countries.phone,countries.email,
      b.name as branch,d.name as department,u.designation,ur.designation as reviewer_designation,ua.designation as approver_designation
      FROM purchase_orders as po 
      LEFT JOIN purchase_order_items ON purchase_order_items.purchase_order_id = po.id
      LEFT JOIN requisitions as srf ON srf.id = po.document_id
      LEFT JOIN si_units ON si_units.id = purchase_order_items.si_unit_id
      LEFT JOIN items as p ON p.id = purchase_order_items.item_id
      LEFT JOIN suppliers as s ON s.id = po.supplier_id
      LEFT JOIN branches as b ON b.id = po.branch_id
      LEFT JOIN departments as d ON d.id = po.department_id
      LEFT JOIN users as u ON u.id = po.user_id
      LEFT JOIN users as ur ON po.reviewed_by = ur.id 
      LEFT JOIN users as ua ON po.approved_by = ua.id
      LEFT JOIN countries ON po.country_id = countries.id
      LEFT JOIN currencies ON po.currency_id = currencies.id
      LEFT JOIN project_budgetline_refs as pbr ON purchase_order_items.project_budgetline_ref_id = pbr.id 
      LEFT JOIN projects ON pbr.project_id = projects.id
      LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      WHERE po.id = ? AND po.deleted = 0 AND purchase_order_items.deleted = 0
      ORDER BY po.ref_no";
    //   H::dnd(DB::getInstance()->query($sql, [$this->id])->results()); 
    return DB::getInstance()->query($sql, [$this->id],PurchaseOrderItems::class)->results();
  }

  public static function itemCountCurrentPurchaseOrder($id = "")
  {
    if ($id == "") {
      return 0;
    }
    $purchase_order_id = $id;
    $db = DB::getInstance();
    $sql = "SELECT SUM(qty) as qty FROM purchase_order_items WHERE purchase_order_id = ? AND deleted = 0";
    $result = $db->query($sql, [(int)$purchase_order_id])->first();
    return $result->qty;
  }

  public static function itemCountUnprocessedPOs()
  {
    $db = DB::getInstance();
    $sql = "SELECT COUNT(*) AS total FROM purchase_orders WHERE reviewed = 0 OR approved = 0 AND deleted = 0";
    $results = $db->query($sql);
    $total = sizeof($results->results()) > 0 ? $results->results()[0]->total : 0;
    return $total;
  }

  public static function itemCountUnApproved()
  {
    $db = DB::getInstance();
    $sql = "SELECT COUNT(*) AS total FROM purchase_orders WHERE approved = 0 AND deleted = 0";
    $results = $db->query($sql);
    $total = sizeof($results->results()) > 0 ? $results->results()[0]->total : 0;
    return $total;
  }

  public static function itemCountUnReviewed()
  {
    $db = DB::getInstance();
    $sql = "SELECT COUNT(*) AS total FROM purchase_orders WHERE reviewed = 0 AND deleted = 0";
    $results = $db->query($sql);
    $total = sizeof($results->results()) > 0 ? $results->results()[0]->total : 0;
    return $total;
  }

  public static function getUnprocessedPOs()
  {
    return self::find([
      'conditions' => "reviewed = 0, approved = 0",
      'order' => 'id',
    ]);
  }
}