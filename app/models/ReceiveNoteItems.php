<?php
namespace App\Models;
use App\Models\Budgetlines;
use Core\DB;
use Core\Model;
use Core\Validators\RequiredValidator;

class ReceiveNoteItems extends Model
{

    public $id, $created_at, $updated_at,$item_id, $receive_note_id,$project_id, $project_budgetline_ref_id, $qty=0,$price, $si_unit_id ,$valid_date, $receiver_comment,$currency_id, $deleted = 0;


    protected static $_table = 'receive_note_items';
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
        $this->runValidation(new RequiredValidator($this, ['field' => 'receiver_comment', 'msg' => 'Condition/Comment  is required.']));
      

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

    public static function findOrCreate($receive_note_id, $item_id)
    {
        $item = self::findByUniqueFields($receive_note_id, $item_id);
        if (!$item) {
            $item = new self();
            $item->$receive_note_id = (int) $receive_note_id;
            $item->item_id = (int) $item_id;
            // $item->save();
        }
        return $item;
    }

    public static function findByUniqueFields($receive_note_id, $item_id)
    {
        return self::findFirst([
            'conditions' => "receive_note_id = ? AND item_id = ?",
            'bind' => [$receive_note_id, $item_id]
        ]);
    }


    public static function findByRnIdOnly($receive_note_id)
    {
        return self::find([
            'conditions' => "receive_note_id = ?",
            'bind' => [$receive_note_id]
        ]);
    }

    //Get receive note items by receive_note_id grouped by project_budgetline_ref_id and SELECT receive_note_items.project_id, receive_note_items.project_budgetline_ref_id, SUM(receive_note_items.qty*receive_note_items.price) AS totalAmount, pbr.gl_account_id,pbr.id AS pbr_id FROM receive_note_items
    //LEFT JOIN project_budgetline_refs AS pbr ON receive_note_items.project_budgetline_ref_id = pbr.id
     public static function findByRnIdGrouped($receive_note_id) {
        $sql = "SELECT receive_note_items.project_id, receive_note_items.project_budgetline_ref_id, SUM(receive_note_items.qty*receive_note_items.price) AS totalAmount, pbr.gl_account_id
                FROM receive_note_items
                LEFT JOIN project_budgetline_refs AS pbr ON receive_note_items.project_budgetline_ref_id = pbr.id
                WHERE receive_note_items.receive_note_id = ?
                GROUP BY receive_note_items.project_budgetline_ref_id, receive_note_items.project_id";
        return DB::getInstance()->query($sql, [$receive_note_id])->results();
     }


    // public static function findByreqIdOnly($id){
    //     if($id == 'new') return [];
    //     $sql = "SELECT items.id,items.name,refs.qty,refs.price,
    //             FROM items
    //             JOIN receive_note_items as refs ON items.id = refs.item_id
    //             WHERE refs.receive_note_id = ?";
  
    //     return DB::getInstance()->query($sql,[$id])->results();
    //   }
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

    public static function deleteItems($receive_note_id)
    {
        $items = self::find([
            'conditions' => "receive_note_id = ?",
            'bind' => [$receive_note_id]
        ]);
        foreach ($items as $item) {
            $item->delete();
        }
    }
    
}