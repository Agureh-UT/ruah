<?php

namespace App\Models;

use Core\DB;
use Core\Model;
use App\Models\Budgetlines;
use App\Models\ProjectBudgetlineRefs;
use Core\Validators\RequiredValidator;



class VoucherBudgetlineRefs extends Model
{

    public $id, $created_at, $updated_at, $voucher_id, $project_id, $project_budgetline_ref_id, $currency_id, $amount=0.00, $deleted = 0;

    protected static $_softDelete = true;
    protected static $_table = 'voucher_budgetline_refs';
    

    public function beforeSave()
    {
        $this->timeStamps();
    }

    public function validator()
    {
        
        // $this->runValidation(new RequiredValidator($this, ['field' => 'voucher_id', 'msg' => 'Voucher is required to be entered first.']));
        $this->runValidation(new RequiredValidator($this, ['field' => 'project_id', 'msg' => 'Project is required.']));
        $this->runValidation(new RequiredValidator($this, ['field' => 'project_budgetline_ref_id', 'msg' => 'Budgetline is required.']));
        $this->runValidation(new RequiredValidator($this, ['field' => 'amount', 'msg' => 'Amount is required.']));
      

    }
    public static function findOrCreate($voucher_id, $project_budgetline_ref_id)
    {
        $item = self::findByUniqueFields($voucher_id, $project_budgetline_ref_id);
        if (!$item) {
            $item = new self();
            $item->$voucher_id = (int) $voucher_id;
            $item->project_budgetline_ref_id = (int) $project_budgetline_ref_id;
            // $item->save();
        }
        return $item;
    }

    public static function findByUniqueFields($voucher_id, $project_budgetline_ref_id)
    {
        return self::findFirst([
            'conditions' => "voucher_id = ? AND project_budgetline_ref_id = ?",
            'bind' => [$voucher_id, $project_budgetline_ref_id]
        ]);
    }


    public static function findByVoucherIdOnly($voucher_id)
    {
        return self::find([
            'conditions' => "voucher_id = ?",
            'bind' => [$voucher_id]
        ]);
    }
    public static function getVoucherBudgetlineRefsByVoucherId($voucher_id){
        // if($voucher_id == 'new') return [];
        $sql = "
        SELECT refs.id,refs.project_id,refs.project_budgetline_ref_id,refs.amount,pbr.budgeted_amount,pbr.code, budgetlines.name,projects.code as projectcode
        FROM voucher_budgetline_refs AS refs
        LEFT JOIN project_budgetline_refs pbr ON refs.project_budgetline_ref_id = pbr.id
        LEFT JOIN projects ON pbr.project_id = projects.id
        LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
        WHERE refs.voucher_id = ? AND pbr.deleted = 0 AND refs.deleted = 0";
        // return DB::getInstance()->query($sql,[(int)$voucher_id])->results();
        return DB::getInstance()->query($sql, [(int)$voucher_id], VoucherBudgetlineRefs::class)->results();
        
      }
    
      public function getProjectBudgetlineRefs()
      {
         if ($this->project_id == '') return [];
         // if ($projectId == '') return [];
        // if (empty($this->project_id)) {
        //     return [];
        // }
        $sql = "SELECT refs.id,refs.budgeted_amount,refs.code, budgetlines.name,projects.code as projectcode
                  FROM project_budgetline_refs as refs
                  JOIN budgetlines ON refs.budgetline_id = budgetlines.id
                  JOIN projects ON refs.project_id = projects.id
                  WHERE refs.project_id = ?";
          $results = DB::getInstance()->query($sql, [$this->project_id])->results();
        // $results = DB::getInstance()->query($sql, [(int)$projectId], ProjectBudgetlineRefs::class)->results();
        $bgtlinesAry = ['' => '-Select BudgetlineRef-'];
        foreach ($results as $result) {
          $bgtlinesAry[$result->id] = $result->code . '::' .$result->name . '::' . $result->projectcode;
        }
        return $bgtlinesAry;
      }
    
      public static function getProjectBudgetlineRefsByProjectId($projectId)
      {
        //  if ($this->project_id == '') return [];
        //  if ($projectId == '') return [];
        if (empty($projectId)) {
            return [];
        }
        $sql = "SELECT refs.id,refs.budgeted_amount,refs.code, budgetlines.name,projects.code as projectcode
                  FROM project_budgetline_refs as refs
                  JOIN budgetlines ON refs.budgetline_id = budgetlines.id
                  JOIN projects ON refs.project_id = projects.id
                  WHERE refs.project_id = ?";
        //   $results = DB::getInstance()->query($sql, [$projectId])->results();
        $results = DB::getInstance()->query($sql, [(int)$projectId], ProjectBudgetlineRefs::class)->results();
        $bgtlinesAry = ['' => '-Select BudgetlineRef-'];
        foreach ($results as $result) {
            $bgtlinesAry[$result->id] = $result->code . '::' .$result->name . '::' . $result->projectcode;
            
        }
        return $bgtlinesAry;
      }
    public function getBgtlineName()
    {
        if (empty($this->project_budgetline_ref_id)) {
            return '';
        }

        $project_budgetline_ref_id = ProjectBudgetlineRefs::findById($this->project_budgetline_ref_id);

        $Budgetline = Budgetlines::findFirst([
            'conditions' => "id = ?",
            'bind' => [$project_budgetline_ref_id->budgetline_id],
        ]);
        return ($Budgetline) ? $Budgetline->code . '::' . $Budgetline->name : '';
    }

    public function getBgtlineAmountBalance1()
    {
        if (empty($this->project_budgetline_ref_id)) {
            return 0.00;
        }

        $project_budgetline_ref_id = ProjectBudgetlineRefs::findById($this->project_budgetline_ref_id);

        // $Budgetline = Budgetlines::findFirst([
        //     'conditions' => "id = ?",
        //     'bind' => [$project_budgetline_ref_id->budgetline_id],
        // ]);
        return ($project_budgetline_ref_id) ? $project_budgetline_ref_id->budgeted_amount : 0.00;
    }
    public function getBgtlineAmountBalance2()
    {
        if (empty($this->project_budgetline_ref_id)) {
            return '';
        }

        $project_budgetline_ref = ProjectBudgetlineRefs::findFirst([
            'conditions' => "id = ?",
            'bind' => [$this->project_budgetline_ref_id],
        ]);
        return ($project_budgetline_ref) ? $project_budgetline_ref->budgeted_amount : '';
        
    }

    public static function getBgtlineAmountBalance($project_budgetline_ref_id)
    {
        if (empty($project_budgetline_ref_id)) {
            return '';
        }
        $project_budgetline_ref = ProjectBudgetlineRefs::findFirst([
            'conditions' => "id = ?",
            'bind' => [$project_budgetline_ref_id],
        ]);
        return ($project_budgetline_ref) ? $project_budgetline_ref->budgeted_amount : '';
    }

    public static function SumVoucherBudgetlineRefsEntriesAmount($id)
    {

        $pbr_id = $id;
        $db = DB::getInstance();
        $sql = "SELECT SUM(amount) as actual_amount FROM voucher_budgetline_refs WHERE project_budgetline_ref_id = ? AND deleted = 0";
        $result = $db->query($sql, [(int) $pbr_id])->first();
        if (empty($result->actual_amount)) {
            return number_format(0.00, 2);
        }

        return $result->actual_amount;

    }
    public static function deleteItems($voucher_id)
    {
        $items = self::find([
            'conditions' => "voucher_id = ?",
            'bind' => [$voucher_id]
        ]);
        foreach ($items as $item) {
            $item->delete();
        }
    }
}
