<?php
namespace App\Models;
use App\Models\Budgetlines;
use Core\DB;
use Core\Model;
use Core\Validators\RequiredValidator;

class PurchaseOrderItems extends Model
{

    public $id, $created_at, $updated_at,$item_id, $purchase_order_id,$project_id, $project_budgetline_ref_id, $qty=0,$price, $si_unit_id ,$valid_date,$currency_id, $deleted = 0;


    protected static $_table = 'purchase_order_items';
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
//include project_budgetline_ref_id for it to  be a unique combination and to avoid double inserts for those 3 combinations
    public static function findOrCreate($purchase_order_id, $item_id)
    {
        $item = self::findByUniqueFields($purchase_order_id, $item_id);
        if (!$item) {
            $item = new self();
            $item->$purchase_order_id = (int) $purchase_order_id;
            $item->item_id = (int) $item_id;
            // $item->save();
        }
        return $item;
    }

    public static function findByUniqueFields($purchase_order_id, $item_id)
    {
        return self::findFirst([
            'conditions' => "purchase_order_id = ? AND item_id = ?",
            'bind' => [$purchase_order_id, $item_id]
        ]);
    }


    public static function findByPoIdOnly($purchase_order_id)
    {
        return self::find([
            'conditions' => "purchase_order_id = ?",
            'bind' => [$purchase_order_id]
        ]);
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

    public static function deleteItems($purchase_order_id)
    {
        $items = self::find([
            'conditions' => "purchase_order_id = ?",
            'bind' => [$purchase_order_id]
        ]);
        foreach ($items as $item) {
            $item->delete();
        }
    }
}