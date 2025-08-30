<?php

namespace App\Models;

use Core\DB;
use Core\H;
use Core\Model;
use App\Models\{Budgetlines, Costcentres, Projects, Clients};
use Core\Validators\{RequiredValidator, NumericValidator, UniqueValidator};

class ProjectBudgetlineRefs extends Model
{

    public $id, $created_at, $updated_at, $project_id,$code, $client_id, $budgetline_id, $user_id, $costcentre_id, $budgeted_amount,$gl_account_id, $deleted = 0;


    protected static $_table = 'project_budgetline_refs';
    protected static $_softDelete = true;

    public function beforeSave()
    {
        $this->timeStamps();
    }

    public function validator()
    {
      $this->runValidation(new RequiredValidator($this, ['field' => 'code', 'msg' => 'Budgetline code is required.']));
      $this->runValidation(new RequiredValidator($this, ['field' => 'client_id', 'msg' => 'Client is required.']));
      $this->runValidation(new RequiredValidator($this, ['field' => 'budgetline_id', 'msg' => 'Budgetline is required.']));
      $this->runValidation(new RequiredValidator($this, ['field' => 'costcentre_id', 'msg' => 'Costcenter is required.']));
      $this->runValidation(new RequiredValidator($this, ['field' => 'budgeted_amount', 'msg' => 'Budgeted Amount is required.']));
      $this->runValidation(new UniqueValidator($this, ['field' => ['code', 'deleted', 'budgetline_id', 'project_id', 'costcentre_id', 'client_id'], 'msg' => 'That Budgetline already exists for this project']));
    //   $this->runValidation(new UniqueValidator($this, ['field' => ['name', 'deleted', 'client_id'], 'msg' => 'That costcenter already exists for that donor/client']));

    }
    public static function findOrCreate($project_id, $budgetline_id)
    {
        $item = self::findByUniqueFields($project_id, $budgetline_id);
        if (!$item) {
            $item = new self();
            $item->$project_id = (int) $project_id;
            $item->budgetline_id = (int) $budgetline_id;
            // $item->save();
        }
        return $item;
    }

    public static function findByUniqueFields($project_id, $budgetline_id)
    {
        return self::findFirst([
            'conditions' => "project_id = ? AND budgetline_id = ?",
            'bind' => [$project_id, $budgetline_id]
        ]);
    }


    public static function findByProjectIdOnly($project_id)
    {
        return self::find([
            'conditions' => "project_id = ?",
            'bind' => [$project_id]
        ]);
    }

    public static function getOptionsForForm()
    {
        $params = [
            'columns' => 'id, code, name',
            'order' => 'id',
        ];

        $budgetlines = self::find($params);
        $budgetlinesAry = ['' => '-Select Budgetline-'];
        foreach ($budgetlines as $budgetline) {
            $budgetlinesAry[$budgetline->id] = $budgetline->code . '::' . $budgetline->name;
        }
        return $budgetlinesAry;
    }





    public function getBgtlineName()
    {
        if (empty($this->budgetline_id)) {
            return '';
        }

        $Budgetline = Budgetlines::findFirst([
            'conditions' => "id = ?",
            'bind' => [$this->budgetline_id],
        ]);
        return ($Budgetline) ? $Budgetline->code . '::' . $Budgetline->name : '';
    }

    public static function getGlAccount($gl_account_id)
    {
        if (empty($gl_account_id)) {
            return '';
        }

        $Glaccount = GlAccounts::findFirst([
            'conditions' => "id = ?",
            'bind' => [$gl_account_id],
        ]);
        return $Glaccount;
    }

    public static function getBgtlinesByClientId($clientId)
    {
        //  if ($this->project_id == '') return [];
        //  if ($projectId == '') return [];
        // if (empty($projectId)) {
        //     return [];
        // }
        $sql = "SELECT budgetlines.id, budgetlines.name,clients.name as clientName
                FROM budgetlines
                JOIN clients ON budgetlines.client_id = clients.id
                WHERE budgetlines.client_id = ?";
        $results = DB::getInstance()->query($sql, [$clientId])->results();
        // $results = DB::getInstance()->query($sql, [(int)$clientId], Budgetlines::class)->results();
        $bgtlinesAry = ['' => '-Select Budgetline-'];
        foreach ($results as $result) {
            $bgtlinesAry[$result->id] = $result->clientName  . '::' . $result->name;
        }
        return $bgtlinesAry;
    }
    public static function getDetailsForPrint($project_id)
    {
        $db = DB::getInstance();
        $sql = "SELECT pbr.id,pbr.code,pbr.budgeted_amount,budgetlines.name as budgetlineName,
        projects.name as projectName,projects.code as projectCode,projects.start_date,projects.end_date,projects.id as project_id,
        SUM(vbl.amount) as actual_amount
        FROM voucher_budgetline_refs vbl
        RIGHT JOIN project_budgetline_refs pbr 
           ON pbr.id = vbl.project_budgetline_ref_id
        JOIN projects
          ON pbr.project_id = projects.id
        JOIN budgetlines
          ON pbr.budgetline_id = budgetlines.id
        WHERE pbr.deleted = '0' AND pbr.project_id = ?
        GROUP BY pbr.id
        ORDER BY pbr.code";
        return $db->query($sql, [(int)$project_id])->results();
    }
    public static function getCostcentresByClientId($clientId)
    {
        //  if ($this->project_id == '') return [];
        //  if ($projectId == '') return [];
        // if (empty($projectId)) {
        //     return [];
        // }
        $sql = "SELECT costcentres.id,costcentres.name,clients.name as clientName
                FROM costcentres
                JOIN clients ON costcentres.client_id = clients.id
                WHERE costcentres.client_id = ?";
        $results = DB::getInstance()->query($sql, [$clientId])->results();
        // $results = DB::getInstance()->query($sql, [(int)$clientId], Budgetlines::class)->results();
        $CoscentreAry = ['' => '-Select CostCenter-'];
        foreach ($results as $result) {
            $CoscentreAry[$result->id] = $result->clientName . '::' . $result->name;
        }
        return $CoscentreAry;
    }

    public static function getProjectBudgetlineRefs($projectId)
    {
        //  if ($this->project_id == '') return [];
        //    if ($projectId == '') return [];
        //   if (empty($this->project_id)) {
        //       return [];
        //   }
        $sql = "SELECT pbr.id,pbr.budgeted_amount,pbr.code, budgetlines.name,projects.code as projectcode
                FROM project_budgetline_refs as pbr
                JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
                JOIN projects ON pbr.project_id = projects.id
                WHERE pbr.project_id = ?";
        // $results = DB::getInstance()->query($sql, [$this->project_id])->results();
        $results = DB::getInstance()->query($sql, [(int)$projectId])->results();
        // $results = DB::getInstance()->query($sql, [(int)$projectId], ProjectBudgetlineRefs::class)->results();
        $bgtlinesAry = ['' => '-Select BudgetlineRef-'];
        foreach ($results as $result) {
            $bgtlinesAry[$result->id] = $result->code . '::' . $result->name . '::' . $result->projectcode;
        }
        return $bgtlinesAry;
    }
    public static function getPbrs()
    {
        $sql = "SELECT pbr.id,pbr.budgeted_amount,pbr.project_id,pbr.budgetline_id,pbr.code as budgetlineCode, budgetlines.name as budgetlineName,projects.code as projectCode
                FROM project_budgetline_refs as pbr
                JOIN projects ON pbr.project_id = projects.id
                JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
                WHERE projects.deleted = 0
                ORDER BY pbr.project_id,pbr.budgetline_id";    
                //  WHERE pbr.project_id = ?";
        // return DB::getInstance()->query($sql,[],ProjectBudgetlineRefs::class)->results();
        // return DB::getInstance()->query($sql)->results();
        $Results =DB::getInstance()->query($sql)->results();
        $bgtlinesAry = [];
        foreach ($Results as $Result) {
            $bgtlinesAry[$Result->project_id]=self::getProjectBudgetlineRefs($Result->project_id);
        }
        return $bgtlinesAry;
    }
    public static function getPbrsOld()
    {
        $sql = "SELECT pbr.id,pbr.budgeted_amount,pbr.project_id,pbr.budgetline_id,pbr.code as budgetlineCode, budgetlines.name as budgetlineName,projects.code as projectCode
                FROM project_budgetline_refs as pbr
                JOIN projects ON pbr.project_id = projects.id
                JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
                WHERE projects.deleted = 0
                ORDER BY pbr.project_id,pbr.budgetline_id";    
                //  WHERE pbr.project_id = ?";
        return DB::getInstance()->query($sql,[],ProjectBudgetlineRefs::class)->results();
    }
    public static function fetchPbrs()
    {
        $sql = "SELECT 
                pbr.id,pbr.budgeted_amount,pbr.code as budgetlineCode,
                budgetlines.name as budgetlineName,
                projects.code as projectCode
                FROM project_budgetline_refs as pbr
                LEFT JOIN projects ON pbr.project_id = projects.id
                LEFT JOIN budgetlines ON pbr.budgetline_id = budgetlines.id
                ORDER BY pbr.id";    
                //  WHERE pbr.project_id = ?";
                return DB::getInstance()->query($sql)->results();
        // return DB::getInstance()->query($sql,[],ProjectBudgetlineRefs::class)->results();
    }
    public static function deleteItems($project_id)
    {
        $items = self::find([
            'conditions' => "project_id = ?",
            'bind' => [$project_id]
        ]);
        foreach ($items as $item) {
            $item->delete();
        }
    }
    // public static function getPBRsForDelete($pbr_id)
    // {
    //     $db = DB::getInstance();
    //     $sql = "SELECT pbr.id,pbr.code,budgetlines.name as budgetlineName,
    //     projects.name as projectName,projects.code as projectCode,projects.id as project_id,
    //     vbl.project_budgetline_ref_id as vblrefID,vbl.voucher_id as voucherID,rbl.project_budgetline_ref_id as rblrefID,rbl.requisition_id as requisitionID
    //     FROM project_budgetline_refs pbr
    //     RIGHT JOIN voucher_budgetline_refs vbl 
    //      ON vbl.project_budgetline_ref_id = pbr.id
    //     RIGHT JOIN requisition_items rbl 
    //      ON rbl.project_budgetline_ref_id = pbr.id
    //     JOIN projects
    //       ON pbr.project_id = projects.id
    //     JOIN budgetlines
    //       ON pbr.budgetline_id = budgetlines.id
    //     WHERE pbr.deleted = 0 AND pbr.id = ?";
    //     return $db->query($sql, [(int)$pbr_id])->results();

    // }

    public static function getPBRsForDelete($pbr_id)
    {
        $db = DB::getInstance();
        $sql = "SELECT pbr.id,pbr.code,budgetlines.name as budgetlineName,
        projects.name as projectName,projects.code as projectCode,projects.id as project_id,
        vbl.project_budgetline_ref_id as vblrefID,vbl.voucher_id as voucherID
        FROM project_budgetline_refs pbr
        RIGHT JOIN voucher_budgetline_refs vbl 
         ON vbl.project_budgetline_ref_id = pbr.id
        JOIN projects
          ON pbr.project_id = projects.id
        JOIN budgetlines
          ON pbr.budgetline_id = budgetlines.id
        WHERE pbr.deleted = 0 AND pbr.id = ?";
        return $db->query($sql, [(int)$pbr_id])->results();

    }
    public static function deleteSingleItem($PbrID)
    {
        $items = self::find([
            'conditions' => "project_id = ?",
            'bind' => [$PbrID]
        ]);
        foreach ($items as $item) {
            $item->delete();
        }
    }
}