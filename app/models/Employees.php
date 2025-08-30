<?php

namespace App\Models;

use Core\DB;
use Core\H;
use Core\Model;
use Core\Validators\NumericValidator;
use Core\Validators\EmailValidator;
use Core\Validators\RequiredValidator;
use Core\Validators\UniqueValidator;

class Employees extends Model
{

  public $id, $created_at, $updated_at, $user_id, $bsalary = 0.00, $code, $id_no, $pin_no, $shif_no, $ssf_no, $fname, $mname,
    $lname, $email, $gender, $dob, $bank_name, $bank_account, $hdate, $ldate, $branch_id, $sign_link, $phone,
    $department_id, $is_active = 1, $emp_type, $designation, $pay_tax, $deleted = 0;
  // const blackList = ['id', 'deleted', 'images_sorted'];
  protected static $_table = 'employees';
  protected static $_softDelete = true;

  public function beforeSave()
  {
    $this->timeStamps();
  }

  public function validator()
  {
    // $this->runValidation(new RequiredValidator($this, ['field' => 'fname', 'msg' => 'First Name is required.']));
    // $this->runValidation(new RequiredValidator($this, ['field' => 'lname', 'msg' => 'Last Name is required.']));
    // $this->runValidation(new RequiredValidator($this, ['field' => 'email', 'msg' => 'Email is required.']));

    $requiredFields = ['fname' => 'First Name', 'mname' => 'Middle Name', 'lname' => 'Last Name', 'email' => 'Email Address', 'gender' => 'Gender', 'phone' => 'Phone Number', 'branch_id' => 'Branch', 'department_id' => 'Department', 'emp_type' => 'Employee Type', 'designation' => 'Designation'];
    foreach ($requiredFields as $field => $display) {
      $this->runValidation(new RequiredValidator($this, ['field' => $field, 'msg' => $display . " is required."]));
    }
    $this->runValidation(new EmailValidator($this, ['field' => 'email', 'msg' => 'You must provide a valid email address']));
    $this->runValidation(new UniqueValidator($this, ['field' => ['code', 'deleted'], 'msg' => 'The employee with this Staff number already exists.']));
    $this->runValidation(new UniqueValidator($this, ['field' => ['bank_account', 'deleted'], 'msg' => 'The employee with this Bank account already exists.']));
    $this->runValidation(new NumericValidator($this, ['field' => 'bsalary', 'msg' => 'Basic Salary must be numeric']));
  }
  public static function fetchDataList($options)
  {
    $db = DB::getInstance();
    $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 10;
    $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
    $where = "employees.deleted = 0";
    $binds = [];
    if (array_key_exists('department', $options) && !empty($options['department'])) {
      $where .= " AND departments.id = ?";
      $binds[] = $options['department'];
    }

    if (array_key_exists('employment_types', $options) && !empty($options['employment_types'])) {
      $where .= " AND employment_types.id = ?";
      $binds[] = $options['employment_types'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND employees.hdate >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND employees.hdate <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (employees.fname LIKE ? OR departments.name LIKE ? OR employment_types.name LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }

    $select = "SELECT COUNT(*) as total";
    $sql = " FROM employees
              LEFT JOIN departments ON departments.id = employees.department_id
              LEFT JOIN employment_types ON employment_types.id = employees.emp_type
              LEFT JOIN users ON users.id = employees.user_id
              WHERE {$where} 
            ";
    $total = $db->query($select . $sql, $binds)->first()->total;

    $select = "SELECT employees.id,employees.code,employees.id_no,employees.pin_no,employees.shif_no,employees.ssf_no,employees.dob,employees.fname,employees.mname,employees.lname,employees.hdate,employees.gender,employees.bsalary,employees.is_active,employees.phone,employees.email,employees.designation,departments.name as department,employment_types.name as empType,users.username as createdBy";
    $pager = " Limit ? OFFSET ?";
    $binds[] = $limit;
    $binds[] = $offset;

    $results = $db->query($select . $sql . $pager, $binds)->results();

    return ['results' => $results, 'total' => $total];
  }
  public static function getExcelData($options)
  {
    $db = DB::getInstance();
    $where = "employees.deleted = 0";
    $binds = [];
    if (array_key_exists('department', $options) && !empty($options['department'])) {
      $where .= " AND departments.id = ?";
      $binds[] = $options['department'];
    }

    if (array_key_exists('employment_types', $options) && !empty($options['employment_types'])) {
      $where .= " AND employment_types.id = ?";
      $binds[] = $options['employment_types'];
    }

    if (array_key_exists('start_date', $options) && !empty($options['start_date'])) {
      $where .= " AND employees.hdate >= ?";
      $binds[] = $options['start_date'];
    }

    if (array_key_exists('end_date', $options) && !empty($options['end_date'])) {
      $where .= " AND employees.hdate <= ?";
      $binds[] = $options['end_date'];
    }

    if (array_key_exists('search', $options) && !empty($options['search'])) {
      $where .= " AND (employees.fname LIKE ? OR departments.name LIKE ? OR employment_types.name LIKE ?)";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
      $binds[] = "%" . $options['search'] . "%";
    }
    $sql = "SELECT employees.id,employees.code,
      employees.dob,employees.fname,employees.mname,employees.lname,employees.hdate,employees.gender,
      employees.bsalary,employees.is_active,employees.phone,employees.email,employees.designation,
      departments.name as department,employment_types.name as empType,users.username as createdBy 
      FROM employees
              LEFT JOIN departments ON departments.id = employees.department_id
              LEFT JOIN employment_types ON employment_types.id = employees.emp_type
              LEFT JOIN users ON users.id = employees.user_id
              WHERE {$where}";

    $results = $db->query($sql, $binds)->results();

    return $results;
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


  public static function getOptionsForForm()
  {
    $params = [
      'columns' => 'id, fname,lname',
      'order' => 'id',
    ];
    $employees = self::find($params);
    $employeessAry = ['' => '-Select-'];
    foreach ($employees as $employee) {
      $employeessAry[$employee->id] = $employee->fname . " " . $employee->lname;
    }
    return $employeessAry;
  }
  public static function findByIdAndUserId($id, $user_id)
  {
    $conditions = [
      'conditions' => "id = ? AND user_id = ?",
      'bind' => [(int) $id, (int) $user_id],
    ];
    return self::findFirst($conditions);
  }

  // public function isChecked()
  // {
  //   return $this->featured === 1;
  // }


  public function getImages()
  {
    return EmployeeDocuments::find([
      'conditions' => "employee_id = ?",
      'bind' => [$this->id],
      'order' => 'sort',
    ]);
  }

  public function getDocuments()
  {
    return EmployeeDocuments::find([
      'conditions' => "employee_id = ?",
      'bind' => [$this->id],
      'order' => 'sort',
    ]);
  }
  public static function findByCode($code)
  {
    $conditions = [
      'conditions' => "code = ?",
      'bind' => [$code],
    ];
    return self::findFirst($conditions);
  }

  public function displayName()
  {
    return trim($this->fname . ' ' . $this->lname);
  }


  public static function findEmployeesWithAssignedProjects($project_id='')
  {
    if($project_id==''){
      $db = DB::getInstance();
      $sql = "SELECT e.id,e.code,e.fname,e.bsalary
      FROM project_employees AS pe
      LEFT JOIN employees AS e ON pe.employee_id = e.id
      WHERE  e.is_active = 1 AND e.deleted = 0 
      GROUP BY pe.employee_id";
      return $db->query($sql)->results();
    }else{
    $db = DB::getInstance();
    $sql = "SELECT e.id,e.code,e.fname,e.bsalary
    FROM project_employees AS pe
    LEFT JOIN employees AS e ON pe.employee_id = e.id
    WHERE pe.project_id = ? AND e.is_active = 1 AND e.deleted = 0 
    GROUP BY pe.employee_id";
    return $db->query($sql, [(int) $project_id])->results();
  }
  }



  // public static function findAssignedEmployeesByProjectId($project_id)
  // {
  //   $db = DB::getInstance();
  //     $sql = "SELECT p.id,p.code,p.name,e.id as employeeId,CONCAT(e.fname,' ',e.lname,'::',e.code) as staffName,pe.monthly_salary,pe.project_id,pe.project_budgetline_ref_id,pe.rate,pe.tax_auth_id
  //   FROM projects AS p
  //   JOIN project_employees AS pe ON p.id = pe.project_id
  //   JOIN employees e ON pe.employee_id=e.id
  //     WHERE p.id = ? AND p.deleted = 0 AND p.is_active = 1";
  //     return $db->query($sql, [(int)$project_id])->results();
  // }

  public static function findAssignedEmployeesByProjectId($project_id)
  {
    $db = DB::getInstance();
    $sql = "SELECT 
      e.id,CONCAT(e.fname,' ',e.lname) as staffName,
      pe.monthly_salary,
      pe.project_id,
      pe.project_budgetline_ref_id,
      pe.rate,
      pe.tax_auth_id,
      p.id as projId,
      t.name as taxAuth,
      CONCAT(pbr.code,'::',b.name) as budgetline
    FROM employees AS e
    JOIN project_employees pe ON e.id = pe.employee_id
    JOIN projects p ON pe.project_id=p.id
    JOIN tax_auths as t ON t.id = pe.tax_auth_id
    JOIN project_budgetline_refs as pbr ON pbr.id = pe.project_budgetline_ref_id
    JOIN budgetlines as b ON b.id = pbr.budgetline_id
      WHERE pe.project_id = ? AND e.is_active = 1 AND p.is_active = 1 AND p.deleted = 0 AND e.deleted = 0 ";
    return $db->query($sql, [(int)$project_id])->results();
  }

  public static function findProjectSalariesByEmployeeId($employee_id)
  {
    $db = DB::getInstance();
    $sql = "SELECT 
    e.id AS employee_id,
    CONCAT(e.fname, ' ', e.lname) AS staff_name,
    SUM(pe.monthly_salary * (pe.rate/100)) AS total_project_salaries,
        SUM(pe.rate) AS total_project_rates,
    COUNT(DISTINCT pe.project_id) AS number_of_projects
    FROM employees e
    JOIN project_employees pe ON e.id = pe.employee_id
    JOIN projects p ON pe.project_id = p.id
    WHERE e.id = ? AND e.is_active = 1 AND p.is_active = 1 AND p.deleted = 0 AND e.deleted = 0
    -- WHERE pe.project_id = ? AND e.is_active = 1 AND p.is_active = 1 AND p.deleted = 0 AND e.deleted = 0 
    AND e.is_active = 1 
    AND p.is_active = 1 
    AND p.deleted = 0 
    AND e.deleted = 0
GROUP BY 
    e.id";
    // H::dnd($db->query($sql, [(int)$employee_id])->first());
    return $db->query($sql, [(int)$employee_id])->first();
  }

  public static function findProjectSalaries($employee_id, $project_id)
  {
    $db = DB::getInstance();
    $sql = "SELECT 
    e.id AS employee_id,
    CONCAT(e.fname, ' ', e.lname) AS staff_name,
    SUM(pe.monthly_salary * (pe.rate/100)) AS total_project_salaries,
        SUM(pe.rate) AS total_project_rates,
    COUNT(DISTINCT pe.project_id) AS number_of_projects
    FROM employees e
    JOIN project_employees pe ON e.id = pe.employee_id
    JOIN projects p ON pe.project_id = p.id
    WHERE e.id = ? AND p.id = ?
    AND e.is_active = 1 
    AND p.is_active = 1 
    AND p.deleted = 0 
    AND e.deleted = 0
GROUP BY 
    e.id";
    // H::dnd($db->query($sql, [(int)$employee_id])->first());
    return $db->query($sql, [(int)$employee_id,(int)$project_id])->first();
  }



  // findEmployeesInPayrollDetailsByProjectIdAndPayrollId
  public static function findEmployeesInPayrollDetailsByProjectIdAndPayrollId($project_id,$payroll_id)
  {
    $db = DB::getInstance();
    $sql = "SELECT 
        DISTINCT e.id,
        CONCAT(e.fname,' ',e.lname) as staffName,
        pd.monthly_salary,
        pd.project_id,
        pd.project_budgetline_ref_id,
        pd.rate,
        pd.tax_auth_id,
        p.id as projId,
        t.name as taxAuth,
        CONCAT(pbr.code,'::',b.name) as budgetline
        FROM employees AS e
        JOIN payroll_details pd ON e.id = pd.employee_id
        JOIN projects p ON pd.project_id=p.id
        JOIN tax_auths as t ON t.id = pd.tax_auth_id
        JOIN project_budgetline_refs as pbr ON pbr.id = pd.project_budgetline_ref_id
        JOIN budgetlines as b ON b.id = pbr.budgetline_id
        WHERE pd.project_id = ? AND pd.payroll_id = ?";
            // WHERE pd.project_id = ? AND e.is_active = 1 AND p.is_active = 1 AND p.deleted = 0";
       return $db->query($sql, [(int)$project_id,(int)$payroll_id])->results();
  }

  public static function findEmployeesInPayrollDetails(int $month,int $year)
  {
    $db = DB::getInstance();
    $sql = "SELECT 
        DISTINCT e.id,
        pd.monthly_salary,
        CONCAT(e.fname,' ',e.lname) as staffName,
        SUM(DISTINCT pd.rate) AS total_rate,
        SUM(pd.monthly_salary*(pd.rate/100)) AS taxable_amount
        FROM employees AS e
        JOIN payroll_details pd ON e.id = pd.employee_id
        -- WHERE e.is_active = 1 AND e.deleted = 0 AND pd.period_month = ? AND pd.period_year = ?
        WHERE pd.period_month = ? AND pd.period_year = ?
        GROUP BY e.id,pd.monthly_salary";
        // -- GROUP BY pd.employee_id,pd.monthly_salary";
        
    return $db->query($sql, [(int)$month, (int)$year])->results();
  }
}
