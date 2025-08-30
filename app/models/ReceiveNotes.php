<?php

namespace App\Models;

use Core\H;
use Core\DB;
use Core\Model;
use App\Models\Companies;
use Core\Validators\RequiredValidator;

class ReceiveNotes extends Model
{

    public $id, $created_at, $updated_at, $ref_no, $user_id, $branch_id, $department_id, $supplier_id, $document_id, $valid_date, $reviewed_by, $description, $reviewed = 0, $approved = 0, $approved_by, $vendor_ref, $vendor_dn, $country_id, $currency_id, $deleted = 0;

    const blackList = ['id', 'deleted', 'ref_no'];
    protected static $_table = 'receive_notes';
    protected static $_softDelete = true;

    public function beforeSave()
    {
        $this->timeStamps();
    }
    public function validator()
    {
        $requiredFields = ['ref_no' => 'Ref No.', 'valid_date' => 'Valid Date', 'branch_id' => 'Branch', 'department_id' => 'Department', 'supplier_id' => 'Supplier', 'description' => 'Description', 'vendor_ref' => 'Vendor Invoice No/Delivery Note'];
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

    public static function getOptionsForForm()
    {
        $params = [
            'columns' => 'id, ref_no',
            'order' => 'id',
        ];
        $reqs = self::find($params);
        $reqsAry = ['' => '-Select Reecive No-'];
        foreach ($reqs as $req) {
            $reqsAry[$req->id] = $req->ref_no;
        }
        return $reqsAry;
    }


    public static function findAllItemsByRnId($receive_note_id)
    {
        $db = DB::getInstance();
        $sql = "SELECT rn_items.*,pbr.code as budgetlinecode, b.name as budgetlinename,p.name as productname
      FROM receive_note_items as rn_items
      JOIN items as p ON p.id = rn_items.item_id
      JOIN project_budgetline_refs as pbr ON pbr.id = rn_items.project_budgetline_ref_id
      JOIN budgetlines as b ON b.id = pbr.budgetline_id
      WHERE rn_items.receive_note_id = ? AND rn_items.deleted = 0";

        return $db->query($sql, [(int)$receive_note_id], PurchaseOrderItems::class)->results();
    }

    public static function getExcelData($start_date, $end_date)
    {
        $db = DB::getInstance();
        $sql = "SELECT receive_note_items.created_at as created_at, qty, receive_note_items.price, (qty*receive_note_items.price) as total,rn.ref_no,rn.id as po_id, s.name as supplier,u.username,pbr.code as budgetlinecode, b.name as budgetlinename,p.name as productname,receive_note_items.valid_date as valid_date
        FROM receive_note_items
        JOIN receive_notes as rn ON rn.id = receive_note_items.receive_note_id
        JOIN items as p ON p.id = receive_note_items.item_id
        JOIN project_budgetline_refs as pbr ON pbr.id = receive_note_items.project_budgetline_ref_id
        JOIN budgetlines as b ON b.id = pbr.budgetline_id
        LEFT JOIN suppliers as s ON s.id = rn.supplier_id
        LEFT JOIN users as u ON u.id = rn.user_id
        WHERE receive_note_items.valid_date >= ? AND receive_note_items.valid_date <= ?
        ORDER BY receive_note_items.valid_date DESC";
        // return $db->query($sql, [$start_date, $end_date], RequisitionItems::class)->results();
        return $db->query($sql, [$start_date, $end_date])->results();
    }
    public function getDetailsForPrint2()
    {
        $sql = "
      SELECT 
      rn.id,rn.ref_no,rn.valid_date,rn.description,rn.reviewed,rn.approved,s.name as suppliername,u.username,u.signature,ur.username as reviewer,ur.signature as reviewer_signature,ua.username as approver,ua.signature as approver_signature,s.address as supplieraddress,refs.amount,pbr.budgeted_amount,pbr.code as budgetlinecode, budgetlines.name as budgetlinename,projects.code as projectcode
      FROM receive_notes AS rn
      LEFT JOIN receive_note_items rn_items ON rn_items.purchase_order_id = rn.id
      LEFT JOIN suppliers s ON rn.supplier_id = s.id 
      LEFT JOIN users u ON rn.user_id = u.id 
      LEFT JOIN users as ur ON rn.reviewed_by = ur.id 
      LEFT JOIN users as ua ON rn.approved_by = ua.id
      LEFT JOIN project_budgetline_refs as pbr ON receive_note_items.project_budgetline_ref_id = pbr.id 
      LEFT JOIN projects ON pbr.project_id = projects.id
      LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      WHERE rn.id = ? AND rn.deleted = 0";
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
        $where = "receive_notes.deleted = 0";
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
            $where .= " AND receive_notes.valid_date >= ?";
            $binds[] = $options['start_date'];
        }

        if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
            $where .= " AND receive_notes.valid_date <= ?";
            $binds[] = $options['end_date'];
        }

        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (receive_notes.ref_no LIKE ? OR s.name LIKE ? OR b.name LIKE ? OR po.ref_no LIKE ? OR receive_notes.description LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
        }

        $select = "SELECT COUNT(*) as total";

        $sql = " FROM receive_notes
              LEFT JOIN users as u ON u.id = receive_notes.user_id
              LEFT JOIN suppliers as s ON s.id = receive_notes.supplier_id
              LEFT JOIN branches as b ON b.id = receive_notes.branch_id
              LEFT JOIN purchase_orders as po ON po.id = receive_notes.document_id
              WHERE {$where} ORDER BY receive_notes.id DESC
            ";
        $total = $db->query($select . $sql, $binds)->first()->total;

        $select = "SELECT receive_notes.*, u.username as username,s.name as supplier,b.name as branch,po.ref_no as po_no,po.id as po_id";
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
        $where = "receive_notes.deleted = 0 AND receive_notes.reviewed = 0";
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
            $where .= " AND receive_notes.valid_date >= ?";
            $binds[] = $options['start_date'];
        }

        if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
            $where .= " AND receive_notes.valid_date <= ?";
            $binds[] = $options['end_date'];
        }

        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (receive_notes.ref_no LIKE ? OR s.name LIKE ? OR b.name LIKE ? OR po.ref_no LIKE ? OR receive_notes.description LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
        }

        $select = "SELECT COUNT(*) as total";

        $sql = " FROM receive_notes
              LEFT JOIN users as u ON u.id = receive_notes.user_id
              LEFT JOIN suppliers as s ON s.id = receive_notes.supplier_id
              LEFT JOIN branches as b ON b.id = receive_notes.branch_id
              LEFT JOIN purchase_orders as po ON po.id = receive_notes.document_id
              WHERE {$where} ORDER BY receive_notes.id DESC
            ";
        $total = $db->query($select . $sql, $binds)->first()->total;

        $select = "SELECT receive_notes.*, u.username as username,s.name as supplier,b.name as branch,po.ref_no as po_no,po.id as po_id";
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
        $where = "receive_notes.deleted = 0 AND receive_notes.approved = 0";
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
            $where .= " AND receive_notes.valid_date >= ?";
            $binds[] = $options['start_date'];
        }

        if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
            $where .= " AND receive_notes.valid_date <= ?";
            $binds[] = $options['end_date'];
        }

        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (receive_notes.ref_no LIKE ? OR s.name LIKE ? OR b.name LIKE ? OR po.ref_no LIKE ? OR receive_notes.description LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
        }

        $select = "SELECT COUNT(*) as total";

        $sql = " FROM receive_notes
              LEFT JOIN users as u ON u.id = receive_notes.user_id
              LEFT JOIN suppliers as s ON s.id = receive_notes.supplier_id
              LEFT JOIN branches as b ON b.id = receive_notes.branch_id
              LEFT JOIN purchase_orders as po ON po.id = receive_notes.document_id
              WHERE {$where} ORDER BY receive_notes.id DESC
            ";
        $total = $db->query($select . $sql, $binds)->first()->total;

        $select = "SELECT receive_notes.*, u.username as username,s.name as supplier,b.name as branch,po.ref_no as po_no,po.id as po_id";
        $pager = " Limit ? OFFSET ?";
        $binds[] = $limit;
        $binds[] = $offset;

        $results = $db->query($select . $sql . $pager, $binds)->results();

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
            $lastRN = self::findFirst([
                'order' => 'ref_no DESC'
            ]);
            
            if ($lastRN) {
                $item->ref_no = $lastRN->ref_no + 1;
            } else {
                $company = Companies::findById(1);
                $item->ref_no = $company ? $company->rn_no : 1;
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
        $sql = "SELECT rn.id,rn.description,rn.created_at,rn.updated_at,
      receive_note_items.qty, receive_note_items.price,si_units.name as si_unit,
      (receive_note_items.qty*receive_note_items.price) as line_subtotal,
      receive_note_items.receiver_comment,rn.ref_no,s.name as suppliername,
      s.address as supplieraddress,p.name as product_name,
      rn.valid_date as valid_date,rn.reviewed,rn.approved,CONCAT(u.fname, ' ', u.lname) AS username,
      u.signature,CONCAT(ur.fname, ' ', ur.lname) as reviewer,ur.signature as reviewer_signature,
      CONCAT(ua.fname, ' ', ua.lname) as approver,ua.signature as approver_signature,pbr.code as budgetlinecode, 
      budgetlines.name as budgetlinename,projects.code as projectcode,
      projects.name as projectname,b.name as branch,d.name as department,
      CONCAT(currencies.code,'(',currencies.symbol,')') as currency,
      countries.name as country,countries.logo,countries.short_name,countries.long_name,countries.address,countries.website,countries.phone,countries.email,
      u.designation,ur.designation as reviewer_designation,ua.designation as approver_designation
      FROM receive_notes as rn 
      LEFT JOIN receive_note_items ON receive_note_items.receive_note_id = rn.id
      LEFT JOIN si_units ON si_units.id = receive_note_items.si_unit_id
      LEFT JOIN items as p ON p.id = receive_note_items.item_id
      LEFT JOIN suppliers as s ON s.id = rn.supplier_id
      LEFT JOIN branches as b ON b.id = rn.branch_id
      LEFT JOIN departments as d ON d.id = rn.department_id
      LEFT JOIN users as u ON u.id = rn.user_id
      LEFT JOIN users as ur ON rn.reviewed_by = ur.id 
      LEFT JOIN users as ua ON rn.approved_by = ua.id
      LEFT JOIN countries ON rn.country_id = countries.id
      LEFT JOIN currencies ON rn.currency_id = currencies.id
      LEFT JOIN project_budgetline_refs as pbr ON receive_note_items.project_budgetline_ref_id = pbr.id 
      LEFT JOIN projects ON pbr.project_id = projects.id
      LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
      WHERE rn.id = ? AND rn.deleted = 0
      ORDER BY rn.ref_no";
        //   H::dnd(DB::getInstance()->query($sql, [$this->id])->results()); 
        return DB::getInstance()->query($sql, [$this->id])->results();
    }

    public static function itemCountCurrentPurchaseOrder($id = "")
    {
        if ($id == "") {
            return 0;
        }
        $receive_note_id = $id;
        $db = DB::getInstance();
        $sql = "SELECT SUM(qty) as qty FROM receive_note_items WHERE receive_note_id = ? AND deleted = 0";
        $result = $db->query($sql, [(int)$receive_note_id])->first();
        return $result->qty;
    }

    public static function itemCountUnprocessedPOs()
    {
        $db = DB::getInstance();
        $sql = "SELECT COUNT(*) AS total FROM receive_notes WHERE reviewed = 0 AND approved = 0 AND deleted = 0";
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