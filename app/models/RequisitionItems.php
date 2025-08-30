<?php

namespace App\Models;

use Core\DB;
use Core\Model;
use App\Models\Items;
use App\Models\Budgetlines;
use App\Models\ProjectBudgetlineRefs;
use Core\Validators\RequiredValidator;

class RequisitionItems extends Model
{

    public $id, $created_at, $updated_at, $item_id, $requisition_id, $project_id, $project_budgetline_ref_id, $qty = 0, $price, $si_unit_id, $valid_date,$currency_id,$deleted = 0;
    protected static $_table = 'requisition_items';
    protected static $_softDelete = true;

    public function beforeSave()
    {
        $this->timeStamps();
    }
    public function validator()
    {

        $this->runValidation(new RequiredValidator($this, ['field' => 'item_id', 'msg' => 'Product is required.']));
        $this->runValidation(new RequiredValidator($this, ['field' => 'project_id', 'msg' => 'Project is required.']));
        $this->runValidation(new RequiredValidator($this, ['field' => 'project_budgetline_ref_id', 'msg' => 'Budgetline is required.']));
        $this->runValidation(new RequiredValidator($this, ['field' => 'qty', 'msg' => 'Quantity is required.']));
        $this->runValidation(new RequiredValidator($this, ['field' => 'si_unit_id', 'msg' => 'Unit  is required.']));
    }

    public function getItemprice()
    {
        if (empty($this->item_id)) {
            return '';
        }

        $Item = Items::findFirst([
            'conditions' => "id = ?",
            'bind' => [$this->item_id],
        ]);
        return ($Item) ? $Item->price : '';
    }

    public function getBudgetlinedetails()
    {
        if (empty($this->budgetline_id)) {
            return '';
        }

        $budgetline = Budgetlines::findFirst([
            'conditions' => "id = ?",
            'bind' => [$this->budgetline_id],
        ]);
        return ($budgetline) ? $budgetline->code . '::' . $budgetline->name : '';
    }


    public static function findOrCreate($requsition_id, $item_id)
    {
        $item = self::findByUniqueFields($requsition_id, $item_id);
        if (!$item) {
            $item = new self();
            $item->$requsition_id = (int) $requsition_id;
            $item->item_id = (int) $item_id;
            // $item->save();
        }
        return $item;
    }

    public static function findByUniqueFields($requsition_id, $item_id)
    {
        return self::findFirst([
            'conditions' => "requsition_id = ? AND item_id = ?",
            'bind' => [$requsition_id, $item_id]
        ]);
    }
 

    public static function findByreqIdOnly($requisition_id)
    {
        return self::find([
            'conditions' => "requisition_id = ?",
            'bind' => [$requisition_id]
        ]);
    }
    public static function getSrfProjectBudgetlineRefsBySrfNo($requisition_id)
    {
        $db = DB::getInstance();
        $sql = "SELECT items.*,b.code as budgetlinecode, b.name as budgetlinename,p.name as productname
      FROM requisition_items as items
      JOIN items as p ON p.id = items.item_id
      JOIN budgetlines as b ON b.id = items.budgetline_id
      WHERE items.requisition_id = ? AND items.deleted = 0";

        return $db->query($sql, [(int)$requisition_id], RequisitionItems::class)->results();
    }
    public function getProjectBudgetlineRefs()
    {
        //  if ($this->project_id == '') return [];
        // if ($projectId == '') return [];
        if (empty($this->project_id)) {
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
    public static function deleteItems($requisition_id)
    {
        $items = self::find([
            'conditions' => "requisition_id = ?",
            'bind' => [$requisition_id]
        ]);
        foreach ($items as $item) {
            $item->delete();
        }
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
            $bgtlinesAry[$result->id] = $result->code . '::' . $result->name . '::' . $result->projectcode;
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
            return '';
        }

        $project_budgetline_ref_id = ProjectBudgetlineRefs::findById($this->project_budgetline_ref_id);

        $Budgetline = Budgetlines::findFirst([
            'conditions' => "id = ?",
            'bind' => [$project_budgetline_ref_id->budgetline_id],
        ]);
        return ($Budgetline) ? $Budgetline->budgeted_amount : '';
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
}
