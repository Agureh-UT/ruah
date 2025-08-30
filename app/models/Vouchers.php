<?php

namespace App\Models;

use Core\{Model, DB, H};
use Core\Validators\{RequiredValidator, NumericValidator, UniqueValidator};
use App\Models\{Budgetlines, Costcentres, Clients, Clusters, Trxtypes};

class Vouchers extends Model
{

  public $id, $created_at, $updated_at, $ref_no, $user_id, $document_id, $doc_type, $cheque_no, $supplier_id, $has_budgetlines = 0, $trx_type, $country_id, $currency_id, $valid_date, $description, $project_id, $branch_id, $deleted = 0, $is_closed = 0, $is_paid = 0, $reviewed = 0, $approved = 0, $reviewed_by, $approved_by;

  const blackList = ['id', 'deleted'];
  protected static $_table = 'vouchers';
  protected static $_softDelete = true;
  public function beforeSave()
  {
    $this->timeStamps();
  }

  public function validator()
  {
    // $requiredFields = ['ref_no' => 'Voucher Ref No.', 'valid_date' => 'Valid Date', 'branch_id' => 'Branch', 'document_id' => 'Linked Document', 'trx_type' => 'Transaction type','description' => 'Description'];
    // $requiredFields = ['ref_no' => 'Voucher Ref No.', 'valid_date' => 'Valid Date', 'branch_id' => 'Branch', 'doc_type' => 'Document Type', 'document_id' => 'Linked Document', 'trx_type' => 'Transaction type', 'currency_id' => 'Currency'];
    $requiredFields = ['ref_no' => 'Voucher Ref No.', 'valid_date' => 'Valid Date', 'branch_id' => 'Branch',  'trx_type' => 'Transaction type', 'currency_id' => 'Currency'];

    foreach ($requiredFields as $field => $display) {
      $this->runValidation(new RequiredValidator($this, ['field' => $field, 'msg' => $display . " is required."]));
    }
    $this->runValidation(new UniqueValidator($this, ['field' => ['ref_no'], 'msg' => 'That Reference Number already exists.']));
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

  public static function findByIdAndUserId($id, $user_id)
  {
    $conditions = [
      'conditions' => "id = ? AND user_id = ?",
      'bind' => [(int)$id, (int)$user_id]
    ];
    return self::findFirst($conditions);
  }

  public static function findByPayrollId($document_id)
  {
    $conditions = [
      'conditions' => "document_id = ? AND doc_type = 4",
      'bind' => [(int)$document_id]
    ];
    return self::findFirst($conditions);
  }

  public static function getOptionsForForm()
  {
    $params = [
      'columns' => 'id, ref_no',
      'order' => 'ref_no'
    ];
    $models = self::find($params);
    $Ary = ['' => '-Select New-'];
    foreach ($models as $model) {
      $Ary[$model->id] = $model->ref_no;
    }
    return $Ary;
  }

  public static function findOrCreate($id = NULL)
  {
    $item = self::findById($id);
    
    if (!$item) {
      $item = new self();
      
      // Get the company's initial voucher transaction number
      $company = Companies::findById(1);
      $initialRefNo = $company->voucher_trx_no;
      
      // Get the latest voucher reference number
      $latestVoucher = self::find([
        'includeDeleted' => true,
        'columns' => 'ref_no',
        'order' => 'ref_no DESC',
        'limit' => 1
      ]);
      // Set the new ref_no as max + 1 or initial number if no vouchers exist
      $item->ref_no = $latestVoucher ? ($latestVoucher[0]->ref_no + 1) : $initialRefNo;
      $item->user_id = Users::currentUser()->id;
    }
    
    return $item;
  }

  public static function hasDetails($voucher_id)
  {
    // if (empty($this->id)) {
    //     return '';
    // }updator

    $voucherBudgetlineRefs = VoucherBudgetlineRefs::findFirst([
      'conditions' => "voucher_id = ?",
      'bind' => [$voucher_id],
    ]);
    $voucherGlRefs = VoucherGlRefs::findFirst([
      'conditions' => "voucher_id = ?",
      'bind' => [$voucher_id],
    ]);
    // return ($payroll) ? $payroll->name : '';
    return ($voucherGlRefs && $voucherBudgetlineRefs) ? 1 : 0;
  }

  public static function hasFilters($options)
  {
    foreach ($options as $key => $value) {
      if (!empty($value) && $key != 'limit' && $key != 'offset') {
        return true;
      }
    }
    return false;
  }

  public static function fetchDataList($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    // $user_id = (array_key_exists('user_id', $options) && !empty($options['user_id'])) ? $options['user_id'] : 0;
    // $where = "vouchers.deleted = 0 AND vouchers.user_id = $user_id";
    $where = "vouchers.deleted = 0";
    // if(!self::hasFilters($options)){
    //   $where .= " AND products.featured = '1'";
    // }
    $binds = [];

    if (array_key_exists('supplier', $options) && !empty($options['supplier'])) {
      $where .= " AND s.id = ?";
      $binds[] = $options['supplier'];
    }

    if (array_key_exists('trxType', $options) && !empty($options['trxType'])) {
      $where .= " AND t.id = ?";
      $binds[] = $options['trxType'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND vouchers.valid_date >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND vouchers.valid_date <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (vouchers.ref_no LIKE ? OR s.name LIKE ? OR t.name LIKE ? OR vouchers.description LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";

    $sql = " FROM vouchers
                LEFT JOIN users as u ON u.id = vouchers.user_id
                LEFT JOIN suppliers as s ON s.id = vouchers.supplier_id
                LEFT JOIN trxtypes as t ON t.id = vouchers.trx_type
                WHERE {$where} ORDER BY vouchers.id DESC
              ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT vouchers.*, u.username as username,s.name as supplier,t.name as trxType";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds)->results();

    return ['results' => $results, 'total' => $total];
  }
  public static function fetchUnreviewed($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    $where = "vouchers.deleted = 0 AND vouchers.reviewed = 0";
    // if(!self::hasFilters($options)){
    //   $where .= " AND products.featured = '1'";
    // }
    $binds = [];

    if (array_key_exists('supplier', $options) && !empty($options['supplier'])) {
      $where .= " AND s.id = ?";
      $binds[] = $options['supplier'];
    }

    if (array_key_exists('trxType', $options) && !empty($options['trxType'])) {
      $where .= " AND t.id = ?";
      $binds[] = $options['trxType'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND vouchers.valid_date >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND vouchers.valid_date <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (vouchers.ref_no LIKE ? OR s.name LIKE ? OR t.name LIKE ? OR vouchers.description LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";

    $sql = " FROM vouchers
                LEFT JOIN users as u ON u.id = vouchers.user_id
                LEFT JOIN suppliers as s ON s.id = vouchers.supplier_id
                LEFT JOIN trxtypes as t ON t.id = vouchers.trx_type
                WHERE {$where} ORDER BY vouchers.id DESC
              ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT vouchers.*, u.username as username,s.name as supplier,t.name as trxType";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds)->results();

    return ['results' => $results, 'total' => $total];
  }

  public static function fetchUnapproved($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    $where = "vouchers.deleted = 0 AND vouchers.approved = 0";
    // if(!self::hasFilters($options)){
    //   $where .= " AND products.featured = '1'";
    // }
    $binds = [];

    if (array_key_exists('supplier', $options) && !empty($options['supplier'])) {
      $where .= " AND s.id = ?";
      $binds[] = $options['supplier'];
    }

    if (array_key_exists('trxType', $options) && !empty($options['trxType'])) {
      $where .= " AND t.id = ?";
      $binds[] = $options['trxType'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND vouchers.valid_date >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND vouchers.valid_date <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (vouchers.ref_no LIKE ? OR s.name LIKE ? OR t.name LIKE ? OR vouchers.description LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";

    $sql = " FROM vouchers
                LEFT JOIN users as u ON u.id = vouchers.user_id
                LEFT JOIN suppliers as s ON s.id = vouchers.supplier_id
                LEFT JOIN trxtypes as t ON t.id = vouchers.trx_type
                WHERE {$where} ORDER BY vouchers.id DESC
              ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT vouchers.*, u.username as username,s.name as supplier,t.name as trxType";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds)->results();

    return ['results' => $results, 'total' => $total];
  }

  public static function fetchUnpaidPayrolls($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    // $where = "vouchers.deleted = 0 AND vouchers.doc_type = 4";
    $where = "vouchers.deleted = 0 AND vouchers.doc_type = 4 AND vouchers.is_closed = 0 AND vouchers.is_paid = 0 AND payrolls.is_paid = 0";
    // if(!self::hasFilters($options)){
    //   $where .= " AND products.featured = '1'";
    // }
    $binds = [];

    if (array_key_exists('supplier', $options) && !empty($options['supplier'])) {
      $where .= " AND s.id = ?";
      $binds[] = $options['supplier'];
    }

    if (array_key_exists('trxType', $options) && !empty($options['trxType'])) {
      $where .= " AND t.id = ?";
      $binds[] = $options['trxType'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND vouchers.valid_date >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND vouchers.valid_date <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (vouchers.ref_no LIKE ? OR s.name LIKE ? OR t.name LIKE ? OR vouchers.description LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";

    $sql = " FROM vouchers
                LEFT JOIN users as u ON u.id = vouchers.user_id
                LEFT JOIN suppliers as s ON s.id = vouchers.supplier_id
                LEFT JOIN trxtypes as t ON t.id = vouchers.trx_type
                LEFT JOIN payrolls ON payrolls.id = vouchers.document_id
                WHERE {$where} ORDER BY vouchers.id DESC
              ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT vouchers.*, u.username as username,s.name as supplier,t.name as trxType";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds)->results();

    return ['results' => $results, 'total' => $total];
  }

  public static function fetchPayrollVouchers($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    $payroll_id = (array_key_exists('payroll_id', $options) && !empty($options['payroll_id'])) ? $options['payroll_id'] : 0;
    $where = "vouchers.deleted = 0 AND vouchers.doc_type = 4 AND vouchers.document_id =$payroll_id";
    // $where = "vouchers.deleted = 0 AND vouchers.doc_type = 4 AND vouchers.is_closed = 0 AND vouchers.is_paid = 0  AND payrolls.is_paid = 0 AND vouchers.document_id =$payroll_id";
    // if(!self::hasFilters($options)){
    //   $where .= " AND products.featured = '1'";
    // }
    $binds = [];

    if (array_key_exists('supplier', $options) && !empty($options['supplier'])) {
      $where .= " AND s.id = ?";
      $binds[] = $options['supplier'];
    }

    if (array_key_exists('trxType', $options) && !empty($options['trxType'])) {
      $where .= " AND t.id = ?";
      $binds[] = $options['trxType'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND vouchers.valid_date >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND vouchers.valid_date <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (vouchers.ref_no LIKE ? OR s.name LIKE ? OR t.name LIKE ? OR vouchers.description LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";

    $sql = " FROM vouchers
                LEFT JOIN users as u ON u.id = vouchers.user_id
                LEFT JOIN suppliers as s ON s.id = vouchers.supplier_id
                LEFT JOIN trxtypes as t ON t.id = vouchers.trx_type
                LEFT JOIN payrolls ON payrolls.id = vouchers.document_id
                WHERE {$where} ORDER BY vouchers.id DESC
              ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT vouchers.*, u.username as username,s.name as supplier,t.name as trxType";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds)->results();

    return ['results' => $results, 'total' => $total];
  }

  public static function printPayrollVouchers($month, $year)
  {
    $db = DB::getInstance();

    $sql = "SELECT vouchers.*, u.username as username,s.name as supplier,t.name as trxType,SUM(vgl.amount_credit) AS totAmt
                FROM vouchers
                LEFT JOIN voucher_gl_refs vgl ON vgl.voucher_id = vouchers.id
                LEFT JOIN users as u ON u.id = vouchers.user_id
                LEFT JOIN suppliers as s ON s.id = vouchers.supplier_id
                LEFT JOIN trxtypes as t ON t.id = vouchers.trx_type
                LEFT JOIN payrolls ON payrolls.id = vouchers.document_id
                WHERE vouchers.deleted = 0 AND vouchers.doc_type = 4 AND payrolls.period_month = ? AND payrolls.period_year = ?
                AND vouchers.is_closed = 0 AND vouchers.is_paid = 0
                GROUP BY vouchers.id,u.username,s.name,t.name
                -- HAVING SUM(vgl.amount_credit) > 0
                ORDER BY vouchers.id 
              ";
    return $db->query($sql, [$month, $year])->results();
  }

  //Print payoll Vouchers by group by supplier. Method printPayrollVouchersBySupplier
  public static function printPayrollVouchersBySupplier($month, $year)
  {
    $db = DB::getInstance();

    $sql = "SELECT 
    vouchers.supplier_id,
    GROUP_CONCAT(DISTINCT vouchers.ref_no SEPARATOR ', ') AS ref_no,
        -- GROUP_CONCAT(DISTINCT vouchers.ref_no,'::',vgl.amount_credit SEPARATOR ', ') AS ref_no,
    GROUP_CONCAT(DISTINCT vouchers.valid_date SEPARATOR ', ') AS valid_date,
    -- GROUP_CONCAT(DISTINCT vouchers.description SEPARATOR ', ') AS description,
    GROUP_CONCAT(DISTINCT vouchers.description SEPARATOR ', ') AS description,
    GROUP_CONCAT(DISTINCT vgl.amount_credit SEPARATOR ', ') AS amount_credit,
    -- GROUP_CONCAT(vgl.amount_credit SEPARATOR ', ') AS amount_credit,

    s.name AS supplier,
    u.username AS username,
    t.name AS trxType,
    -- COUNT(vouchers.id) AS voucher_count,  -- Optional: Count of vouchers per supplier
    SUM(vgl.amount_credit) AS totAmt      -- Sum of all amounts per supplier
FROM vouchers
LEFT JOIN voucher_gl_refs vgl ON vgl.voucher_id = vouchers.id
LEFT JOIN users u ON u.id = vouchers.user_id
LEFT JOIN suppliers s ON s.id = vouchers.supplier_id
LEFT JOIN trxtypes t ON t.id = vouchers.trx_type
LEFT JOIN payrolls ON payrolls.id = vouchers.document_id
WHERE vouchers.deleted = 0 
  AND vouchers.doc_type = 4 
  AND payrolls.period_month = ? 
  AND payrolls.period_year = ?
  AND vouchers.is_closed = 0 
  AND vouchers.is_paid = 0
  AND vgl.amount_credit > 0
GROUP BY vouchers.supplier_id, s.name, u.username, t.name -- Group by supplier only
HAVING SUM(vgl.amount_credit) > 0  -- Optional: Only show suppliers with positive amounts
ORDER BY s.name";
    return $db->query($sql, [$month, $year])->results();
  }




  public function getProjectDetails()
  {
    // if (empty($this->project_id)) return ['projectcode' => "", 'projectname' => ""];

    if (empty($this->project_id)) {
      return ['projectcode' => "", 'projectname' => ""];
    }

    $project = Projects::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->project_id]
    ]);
    // return ($project) ? $project->code."::". $project->name: '';
    return ($project) ? ['projectcode' => $project->code, 'projectname' => $project->name] : ['projectcode' => "", 'projectname' => ""];
  }

  public function getSupplierdetails2()
  {
    if (empty($this->supplier_id)) {
      return ['suppliername' => "", 'supplieraddress' => ""];
    }

    $supplier = Suppliers::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->supplier_id],
    ]);
    return ($supplier) ? ['suppliername' => $supplier->name, 'supplieraddress' => $supplier->address] : ['suppliername' => "", 'supplieraddress' => ""];
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

  public function getSupplieraddress()
  {
    if (empty($this->supplier_id)) {
      return '';
    }

    $supplier = Suppliers::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->supplier_id],
    ]);
    return ($supplier) ? $supplier->address : '';
  }

  public function getUserdetails()
  {
    if (empty($this->user_id)) {
      return ['username' => "", 'signature' => "", 'designation' => ""];
    }

    $user = Users::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->user_id],
    ]);
    return ($user) ? ['username' => $user->fname . ' ' . $user->lname, 'signature' => $user->signature, 'designation' => $user->designation] : ['username' => "", 'signature' => "", 'designation' => ""];
  }
  public function getReviewerdetails()
  {
    if (empty($this->reviewed_by)) {
      return ['reviewer' => "", 'reviewer_signature' => "", 'reviewer_designation' => ""];
    }

    $reviewer = Users::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->reviewed_by],
    ]);
    // return ($user) ? $user->username : '';
    return ($reviewer) ? ['reviewer' => $reviewer->fname . ' ' . $reviewer->lname, 'reviewer_signature' => $reviewer->signature, 'reviewer_designation' => $reviewer->designation] : ['reviewer' => "", 'reviewer_signature' => "", 'reviewer_designation' => ""];
  }

  public function getApproverdetails()
  {
    if (empty($this->approved_by)) {
      return ['approver' => "", 'approver_signature' => "", 'approver_designation' => ""];
    }

    $approver = Users::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->approved_by],
    ]);
    // return ($user) ? $user->username : '';
    return ($approver) ? ['approver' => $approver->fname . ' ' . $approver->lname, 'approver_signature' => $approver->signature, 'approver_designation' => $approver->designation] : ['approver' => "", 'approver_signature' => "", 'approver_designation' => ""];
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
  public function getTrxTypedetails()
  {
    if (empty($this->trx_type)) {
      return '';
    }

    $Transaction_type = Trxtypes::findFirst([
      'conditions' => "id = ?",
      'bind' => [$this->trx_type],
    ]);
    return ($Transaction_type) ? $Transaction_type->name : '';
  }

  public function getBudgetlines()
  {
    $sql = "SELECT 
      refs.id,refs.amount,
      pbr.budgeted_amount,pbr.code, 
      budgetlines.name,projects.code as projectcode
      FROM voucher_budgetline_refs AS refs
      LEFT JOIN project_budgetline_refs pbr ON refs.project_budgetline_ref_id = pbr.id
      LEFT JOIN projects ON pbr.project_id = projects.id
      LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      WHERE refs.voucher_id = ? AND pbr.deleted = 0 AND refs.deleted = 0";
    return DB::getInstance()->query($sql, [$this->id])->results();
  }
  public function getGls()
  {
    $sql = "SELECT
      vgl.id,vgl.amount_debit,vgl.amount_credit, 
      gl_accounts.name
      FROM voucher_gl_refs AS vgl
      LEFT JOIN gl_accounts ON vgl.gl_account_id = gl_accounts.id
      WHERE vgl.voucher_id = ? AND vgl.deleted = 0";
    return DB::getInstance()->query($sql, [$this->id])->results();
  }

  public function getvoucherArray()
  {
    $sql = "SELECT
      vgl.id,vgl.amount_debit,vgl.amount_credit, 
      gl_accounts.name
      FROM voucher_gl_refs AS vgl
      LEFT JOIN gl_accounts ON vgl.gl_account_id = gl_accounts.id
      WHERE vgl.voucher_id = ? AND vgl.deleted = 0";
    return DB::getInstance()->query($sql, [$this->id])->results();
  }

  public function getvoucherAmtArray()
  {
    $db = DB::getInstance();
    $sql = "SELECT 
      -- gl.id, gl.name,gl.code,
      -- SUM(CASE WHEN vgl.entry_type ='C' THEN vgl.amount_credit ELSE 0.0 END) AS totAmt,
      SUM(vgl.amount_credit) AS totAmt
      FROM voucher_gl_refs vgl
      -- LEFT JOIN gl_accounts gl ON gl.id = vgl.gl_account_id
      WHERE vgl.deleted = '0' AND vgl.voucher_id = ? AND vgl.entry_type= 'C' ";
    // $returnedData = $db->query($sql, [$this->id])->results();
    // H::dnd($returnedData);
    return $db->query($sql, [$this->id])->results();
  }

  public function getGlsForVouchersWithBgtlines()
  {
    $sql = "SELECT
      vgl.id,vgl.amount_debit,vgl.amount_credit, 
      gl_accounts.name
      FROM voucher_gl_refs AS vgl
      LEFT JOIN gl_accounts ON vgl.gl_account_id = gl_accounts.id
      WHERE vgl.entry_type = 'D' AND vgl.voucher_id = ? AND vgl.deleted = 0";
    return DB::getInstance()->query($sql, [$this->id])->results();
  }
  public function getTopDetails()
  {
    $sql = "SELECT 
      v.id,v.ref_no,v.valid_date,v.description,v.reviewed,v.approved,
      s.name as suppliername,
      u.username,u.signature,ur.username as reviewer,
      ur.signature as reviewer_signature,
      ua.username as approver,ua.signature as approver_signature,
      s.address as supplieraddress,
      b.name as branch,
      t.name as trxType
      FROM vouchers AS v
      LEFT JOIN suppliers s ON v.supplier_id = s.id 
      LEFT JOIN users u ON v.user_id = u.id 
      LEFT JOIN users as ur ON v.reviewed_by = ur.id 
      LEFT JOIN users as ua ON v.approved_by = ua.id
      LEFT JOIN branches as b ON b.id = v.branch_id
      LEFT JOIN trxtypes as t ON t.id = v.trx_type
      WHERE v.id = ? AND v.deleted = 0";
    // return DB::getInstance()->query($sql, [$this->id])->results();
    $returnedData = DB::getInstance()->query($sql, [$this->id])->results();

    // return DB::getInstance()->query($sql, [$this->id], Vouchers::class)->results();
    // $returnedData=DB::getInstance()->query($sql, [$this->id], Vouchers::class)->results();

    H::dnd($returnedData);
  }

  public function getDetails3ForPrint()
  {
    $sql = "SELECT 
    v.id,v.ref_no,v.valid_date,v.description,v.reviewed,v.approved,
    s.name as suppliername,
      u.username,u.signature,
      ur.username as reviewer,ur.signature as reviewer_signature,
      ua.username as approver,ua.signature as approver_signature,
      s.address as supplieraddress,
      pbr.id,pbr.code as budgetlinecode,
      budgetlines.name as budgetlinename,
      projects.name as projectname,projects.code as projectcode,
      b.name as branch,
      t.name as trxType,
    GROUP_CONCAT(DISTINCT gl.code,'-',gl.name SEPARATOR '::') AS glnames,
    GROUP_CONCAT(DISTINCT vgl.amount_debit SEPARATOR '::') AS amount_debits,
    GROUP_CONCAT(DISTINCT vbl.project_budgetline_ref_id) AS budget_lines,
              vbl.amount
FROM 
    vouchers v
      LEFT JOIN voucher_gl_refs vgl ON v.id = vgl.voucher_id
      LEFT JOIN voucher_budgetline_refs vbl ON v.id = vbl.voucher_id
      LEFT JOIN users u ON v.user_id = u.id 
      LEFT JOIN users as ur ON v.reviewed_by = ur.id 
      LEFT JOIN users as ua ON v.approved_by = ua.id
      LEFT JOIN suppliers s ON v.supplier_id = s.id 
      LEFT JOIN branches as b ON b.id = v.branch_id
      LEFT JOIN trxtypes as t ON t.id = v.trx_type
      LEFT JOIN gl_accounts gl ON vgl.gl_account_id = gl.id
      LEFT JOIN project_budgetline_refs pbr ON vbl.project_budgetline_ref_id = pbr.id
      LEFT JOIN projects ON pbr.project_id = projects.id
      LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
    WHERE vgl.entry_type = 'D' AND v.id = ? AND v.deleted = 0
GROUP BY v.id,vbl.id
ORDER BY vbl.id,v.id
";
    // return DB::getInstance()->query($sql, [$this->id])->results();
    // return DB::getInstance()->query($sql, [$this->id], Vouchers::class)->results();
    $returnedData = DB::getInstance()->query($sql, [$this->id])->results();
    // $returnedData=DB::getInstance()->query($sql, [$this->id], Vouchers::class)->results();
    // H::dnd($returnedData);
    return DB::getInstance()->query($sql, [$this->id])->results();
  }
  public function getDetailsForPrintORIGINAL()
  {
    $sql = "SELECT 
      v.id,v.ref_no,v.valid_date,v.description,v.reviewed,v.approved,
      s.name as suppliername,
      u.username,u.signature,ur.username as reviewer,
      ur.signature as reviewer_signature,
      ua.username as approver,ua.signature as approver_signature,
      s.address as supplieraddress,
      refs.amount,
      pbr.budgeted_amount,pbr.code as budgetlinecode, 
      budgetlines.name as budgetlinename,
      projects.code as projectcode,projects.name as projectname,
      vgl.amount_debit,vgl.amount_credit, 
      gl_accounts.name as glaccount,
      b.name as branch,
      t.name as trxType
      FROM vouchers AS v
      LEFT JOIN suppliers s ON v.supplier_id = s.id 
      LEFT JOIN voucher_budgetline_refs refs ON v.id = refs.voucher_id
      LEFT JOIN users u ON v.user_id = u.id 
      LEFT JOIN users as ur ON v.reviewed_by = ur.id 
      LEFT JOIN users as ua ON v.approved_by = ua.id
      LEFT JOIN branches as b ON b.id = v.branch_id
      LEFT JOIN trxtypes as t ON t.id = v.trx_type
      LEFT JOIN voucher_gl_refs vgl ON v.id = vgl.voucher_id
      LEFT JOIN gl_accounts ON vgl.gl_account_id = gl_accounts.id
      LEFT JOIN project_budgetline_refs pbr ON refs.project_budgetline_ref_id = pbr.id
      LEFT JOIN projects ON pbr.project_id = projects.id
      LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      WHERE vgl.entry_type = 'D' AND v.id = ? AND v.deleted = 0";
    return DB::getInstance()->query($sql, [$this->id])->results();
    // return DB::getInstance()->query($sql, [$this->id], Vouchers::class)->results();
    // $returnedData= DB::getInstance()->query($sql, [$this->id])->results();
    // $returnedData=DB::getInstance()->query($sql, [$this->id], Vouchers::class)->results();
    // H::dnd($returnedData);


  }
  public function getDetailsForPrintORIGINAL2()
  {
    $sql = "SELECT 
      v.id,v.ref_no,v.valid_date,v.description,v.reviewed,v.approved,
      s.name as suppliername,
      u.username,u.signature,ur.username as reviewer,
      ur.signature as reviewer_signature,
      ua.username as approver,ua.signature as approver_signature,
      s.address as supplieraddress,
      refs.amount,
      pbr.budgeted_amount,pbr.code as budgetlinecode, 
      budgetlines.name as budgetlinename,
      projects.code as projectcode,projects.name as projectname,
      vgl.amount_debit,vgl.amount_credit, 
      gl_accounts.name as glaccount,
      b.name as branch,
      t.name as trxType
      FROM vouchers AS v
      LEFT JOIN suppliers s ON v.supplier_id = s.id 
      LEFT JOIN voucher_budgetline_refs refs ON v.id = refs.voucher_id
      LEFT JOIN users u ON v.user_id = u.id 
      LEFT JOIN users as ur ON v.reviewed_by = ur.id 
      LEFT JOIN users as ua ON v.approved_by = ua.id
      LEFT JOIN branches as b ON b.id = v.branch_id
      LEFT JOIN trxtypes as t ON t.id = v.trx_type
      LEFT JOIN voucher_gl_refs vgl ON v.id = vgl.voucher_id
      LEFT JOIN gl_accounts ON vgl.gl_account_id = gl_accounts.id
      LEFT JOIN project_budgetline_refs pbr ON refs.project_budgetline_ref_id = pbr.id
      LEFT JOIN projects ON pbr.project_id = projects.id
      LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      WHERE vgl.entry_type = 'D' AND v.id = ? AND v.deleted = 0";
    return DB::getInstance()->query($sql, [$this->id])->results();
    // return DB::getInstance()->query($sql, [$this->id], Vouchers::class)->results();
    // $returnedData= DB::getInstance()->query($sql, [$this->id])->results();
    // $returnedData=DB::getInstance()->query($sql, [$this->id], Vouchers::class)->results();
    // H::dnd($returnedData);


  }
  public function getDetailsForPrint()
  {
    $db = DB::getInstance();
    $sql = "SELECT 
      v.id,v.ref_no,v.valid_date,v.description,v.reviewed,v.approved,
      s.name as suppliername,
      CONCAT(u.fname, ' ', u.lname) AS username,u.signature,
      CONCAT(ur.fname, ' ', ur.lname) as reviewer,ur.signature as reviewer_signature,
      CONCAT(ua.fname, ' ', ua.lname) as approver,ua.signature as approver_signature,
      u.designation,ur.designation as reviewer_designation,ua.designation as approver_designation,
      s.address as supplieraddress,
      pbr.id,pbr.code as budgetlinecode,
      budgetlines.name as budgetlinename,
      projects.name as projectname,projects.code as projectcode,
      b.name as branch,
      CONCAT(currencies.code,'(',currencies.symbol,')') as currency,
      countries.name as country,countries.logo,countries.short_name,countries.long_name,countries.address,countries.website,countries.phone,countries.email,
      t.name as trxType,
      SUM(vbl.amount) as amount FROM voucher_budgetline_refs vbl
      JOIN project_budgetline_refs pbr ON pbr.id = vbl.project_budgetline_ref_id
      JOIN projects ON pbr.project_id = projects.id
      JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      JOIN vouchers v ON v.id = vbl.voucher_id
      LEFT JOIN suppliers s ON v.supplier_id = s.id 
      -- LEFT JOIN voucher_budgetline_refs refs ON v.id = refs.voucher_id
      LEFT JOIN users u ON v.user_id = u.id 
      LEFT JOIN users as ur ON v.reviewed_by = ur.id 
      LEFT JOIN users as ua ON v.approved_by = ua.id
      LEFT JOIN branches as b ON b.id = v.branch_id
      LEFT JOIN countries ON v.country_id = countries.id
      LEFT JOIN currencies ON v.currency_id = currencies.id
      LEFT JOIN trxtypes as t ON t.id = v.trx_type
      WHERE pbr.deleted = '0' AND vbl.voucher_id = ?
      GROUP BY pbr.id, v.id,vbl.id
      ORDER BY pbr.code";
    $returnedData = $db->query($sql, [$this->id])->results();
    // H::dnd($returnedData);
    return $returnedData;
  }
  public function getDetailsForPrintByVoucherBGTlineRefs()
  {
    $db = DB::getInstance();
    $sql = "SELECT 
      pbr.id,pbr.budgeted_amount,pbr.code as budgetlinecode,
      budgetlines.name as budgetlinename,
      projects.name as projectname,projects.code as projectcode,
      SUM(vbl.amount) as amount,
      SUM(CASE WHEN vgl.entry_type='D' THEN vgl.amount_debit ELSE 0.0 END) AS amount_debit,
      SUM(CASE WHEN vgl.entry_type='C' THEN vgl.amount_credit ELSE 0.0 END) AS amount_credit
      FROM voucher_budgetline_refs vbl
      JOIN project_budgetline_refs pbr ON pbr.id = vbl.project_budgetline_ref_id
      JOIN projects ON pbr.project_id = projects.id
      JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      JOIN voucher_gl_refs vgl ON vbl.voucher_id= vgl.voucher_id
      WHERE pbr.deleted = '0' AND vbl.voucher_id = ?
      GROUP BY pbr.id
      ORDER BY pbr.code";
    $returnedData = $db->query($sql, [$this->id])->results();
    // H::dnd($returnedData);
    return $returnedData;
  }
  public function getDetailsForPrintByVoucherGlRefs()
  {
    $db = DB::getInstance();
    $sql = "SELECT 
      gl.id, gl.name,gl.code,
      SUM(CASE WHEN vgl.entry_type='D' THEN vgl.amount_debit ELSE 0.0 END) AS amount_debit,
      SUM(CASE WHEN vgl.entry_type='C' THEN vgl.amount_credit ELSE 0.0 END) AS amount_credit,
      SUM(refs.amount),
      FROM voucher_gl_refs vgl
      LEFT JOIN gl_accounts gl ON gl.id = vgl.gl_account_id
      LEFT JOIN vouchers v ON vgl.voucher_id= v.id
      LEFT JOIN voucher_budgetline_refs refs ON refs.voucher_id= v.id
       LEFT JOIN project_budgetline_refs pbr ON refs.project_budgetline_ref_id = pbr.id
      WHERE vgl.deleted = '0' AND vgl.voucher_id = ? AND vgl.entry_type= 'D'
      GROUP BY gl.id";
    $returnedData = $db->query($sql, [$this->id])->results();
    H::dnd($returnedData);
    return $returnedData;
  }



  public static function getProjectBudgetlineRefsByProjectId($projectId)
  {
    // if ($projectId == '') return [];
    $sql = "SELECT refs.id,refs.budgeted_amount,refs.code, budgetlines.name,projects.code as projectcode
              FROM project_budgetline_refs as refs
              JOIN budgetlines ON refs.budgetline_id = budgetlines.id
              JOIN projects ON refs.project_id = projects.id
              WHERE refs.project_id = ?";

    $results = DB::getInstance()->query($sql, [(int)$projectId])->results();
    // $results = DB::getInstance()->query($sql, [(int)$projectId], ProjectBudgetlineRefs::class)->results();
    $bgtlinesAry = ['' => '-Select BudgetlineRef-'];
    foreach ($results as $result) {
      $bgtlinesAry[$result->id] = $result->projectcode . '::' . $result->code . '::' . $result->name;
    }
    return $bgtlinesAry;
  }
  public function getProjectBudgetlineRefs()
  {
    if (!$this->hasBudgetlines()) {
      return [];
    }
    $sql = "SELECT refs.id,refs.budgeted_amount,refs.code, budgetlines.name,projects.code as projectcode
              FROM project_budgetline_refs as refs
              JOIN budgetlines ON refs.budgetline_id = budgetlines.id
              JOIN projects ON refs.project_id = projects.id
              WHERE refs.project_id = ?";
    $results = DB::getInstance()->query($sql, [$this->project_id])->results();
    // $results = DB::getInstance()->query($sql, [(int)$projectId], ProjectBudgetlineRefs::class)->results();
    $bgtlinesAry = ['' => '-Select BudgetlineRef-'];
    foreach ($results as $result) {
      $bgtlinesAry[$result->id] = $result->projectcode . '::' . $result->code . '::' . $result->name;
    }
    return $bgtlinesAry;
  }
  public function hasBudgetlines()
  {
    return $this->has_budgetlines === 1;
  }

  public static function getExcelData($start_date, $end_date)
  {
    $db = DB::getInstance();
    $sql = " SELECT 
      v.id,v.ref_no,v.cheque_no,v.valid_date,v.description,
      s.name as supplier,
      u.username,
      pbr.budgeted_amount,pbr.code as budgetlinecode, 
      budgetlines.name as budgetlinename,
      costcentres.name as costcentre,
      projects.code as projectcode,projects.name as projectname,
      b.name as branch,
      t.name as trxType,
          GROUP_CONCAT(DISTINCT gl.code,'-',gl.name SEPARATOR '::') AS glnames,
    GROUP_CONCAT(DISTINCT vgl.amount_debit SEPARATOR '::') AS amount_debits,
    GROUP_CONCAT(DISTINCT vbl.project_budgetline_ref_id) AS budget_lines,
              vbl.amount
      FROM vouchers AS v
      LEFT JOIN voucher_gl_refs vgl ON v.id = vgl.voucher_id
      LEFT JOIN voucher_budgetline_refs vbl ON v.id = vbl.voucher_id
      LEFT JOIN users u ON v.user_id = u.id 
      LEFT JOIN users as ur ON v.reviewed_by = ur.id 
      LEFT JOIN users as ua ON v.approved_by = ua.id
      LEFT JOIN suppliers s ON v.supplier_id = s.id 
      LEFT JOIN branches as b ON b.id = v.branch_id
      LEFT JOIN trxtypes as t ON t.id = v.trx_type
      LEFT JOIN gl_accounts gl ON vgl.gl_account_id = gl.id
      LEFT JOIN project_budgetline_refs pbr ON vbl.project_budgetline_ref_id = pbr.id
      LEFT JOIN projects ON pbr.project_id = projects.id
      LEFT JOIN costcentres ON pbr.costcentre_id = costcentres.id
      LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      WHERE vgl.entry_type = 'D' AND vbl.amount>0.00 AND v.valid_date >= ? AND v.valid_date <= ?  AND vbl.deleted = 0  AND vgl.deleted = 0 
      GROUP BY v.id,vbl.id
      ORDER BY v.valid_date DESC";
    // return $db->query($sql, [$start_date, $end_date], RequisitionItems::class)->results();
    return $db->query($sql, [$start_date, $end_date])->results();
  }

  public static function getExcelDataV2($start_date, $end_date)
  {
    $db = DB::getInstance();
    $sql = " SELECT 
      v.id,v.ref_no,v.cheque_no,v.valid_date,v.description,
      s.name as supplier,
      u.username,refs.amount,
      pbr.budgeted_amount,pbr.code as budgetlinecode, 
      budgetlines.name as budgetlinename,
      costcentres.name as costcentre,
      projects.code as projectcode,
      vgl.amount_debit,
      vgl.amount_credit, 
      gl_accounts.name as glaccount,
      t.name as trxType
      FROM vouchers AS v
      LEFT JOIN suppliers s ON v.supplier_id = s.id 
      LEFT JOIN voucher_budgetline_refs refs ON v.id = refs.voucher_id
      LEFT JOIN users u ON v.user_id = u.id 
      LEFT JOIN trxtypes as t ON t.id = v.trx_type
      LEFT JOIN voucher_gl_refs vgl ON v.id = vgl.voucher_id
      LEFT JOIN gl_accounts ON vgl.gl_account_id = gl_accounts.id
      LEFT JOIN project_budgetline_refs pbr ON refs.project_budgetline_ref_id = pbr.id
      LEFT JOIN projects ON pbr.project_id = projects.id
      LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      LEFT JOIN costcentres ON pbr.costcentre_id = costcentres.id
      WHERE vgl.entry_type = 'D' AND refs.amount>0.00 AND v.valid_date >= ? AND v.valid_date <= ?  AND refs.deleted = 0  AND vgl.deleted = 0 
      ORDER BY v.valid_date DESC";
    // return $db->query($sql, [$start_date, $end_date], RequisitionItems::class)->results();
    return $db->query($sql, [$start_date, $end_date])->results();
  }
  public static function itemCountUnApproved()
  {
    $db = DB::getInstance();
    $sql = "SELECT COUNT(*) AS total FROM vouchers WHERE approved = 0 AND deleted = 0";
    $results = $db->query($sql);
    $total = sizeof($results->results()) > 0 ? $results->results()[0]->total : 0;
    return $total;
  }
  public static function itemCountUnReviewed()
  {
    $db = DB::getInstance();
    $sql = "SELECT COUNT(*) AS total FROM vouchers WHERE reviewed = 0 AND deleted = 0";
    $results = $db->query($sql);
    $total = sizeof($results->results()) > 0 ? $results->results()[0]->total : 0;
    return $total;
  }
}
