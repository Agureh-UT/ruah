<?php
namespace App\Models;
use Core\DB;
use Core\Model;
use App\Models\GlAccounts;
use Core\Validators\RequiredValidator;

class VoucherGlRefs extends Model
{

    public $id, $created_at, $updated_at, $voucher_id, $gl_account_id,$has_budgetlines=0,$entry_type, $currency_id, $amount_debit=0.00, $amount_credit=0.00, $valid_date, $deleted = 0;


    protected static $_table = 'voucher_gl_refs';
    protected static $_softDelete = true;

    public function beforeSave()
    {
        $this->timeStamps();
    }

    public function validator()
    {
        
        $this->runValidation(new RequiredValidator($this, ['field' => 'gl_account_id', 'msg' => 'GL account is required.']));
        $this->runValidation(new RequiredValidator($this, ['field' => 'entry_type', 'msg' => 'Entry type is required.']));
        $this->runValidation(new RequiredValidator($this, ['field' => 'amount_debit', 'msg' => 'Debit Amount is required.']));
        $this->runValidation(new RequiredValidator($this, ['field' => 'amount_credit', 'msg' => 'Credit Amount is required.']));
      

    }
       public function getGlAmountBalance()
    {
        if (empty($this->gl_account_id)) {
            return '';
        }

        $Gl_account = GlAccounts::findFirst([
            'conditions' => "id = ?",
            'bind' => [$this->gl_account_id],
        ]);
        return ($Gl_account) ? $Gl_account->amount : '';
    }

public function getGlName()
    {
        if (empty($this->gl_account_id)) {
            return '';
        }

        $Gl_account = GlAccounts::findFirst([
            'conditions' => "id = ?",
            'bind' => [$this->gl_account_id],
        ]);
        return ($Gl_account) ? $Gl_account->name : '';
    }
    public static function findOrCreate($voucher_id, $gl_account_id)
    {
        $item = self::findByUniqueFields($voucher_id, $gl_account_id);
        if (!$item) {
            $item = new self();
            $item->$voucher_id = (int) $voucher_id;
            $item->gl_account_id = (int) $gl_account_id;
            // $item->save();
        }
        return $item;
    }

    public static function findByUniqueFields($voucher_id, $gl_account_id)
    {
        return self::findFirst([
            'conditions' => "voucher_id = ? AND gl_account_id = ?",
            'bind' => [$voucher_id, $gl_account_id]
        ]);
    }
    public static function findByTrxAndGlaccountId($voucher_id, $gl_account_id)
    {
        return self::findFirst([
            'conditions' => "voucher_id = ? AND gl_account_id = ?",
            'bind' => [$voucher_id, $gl_account_id]
        ]);
    }

    public static function findCreditEntries($voucher_id)
    {
        return self::findFirst([
            'conditions' => "voucher_id = ? AND entry_type = 'C'",
            'bind' => [$voucher_id]
        ]);
    }

    public static function findByVoucherIdOnly($voucher_id)
    {
        return self::find([
            'conditions' => "voucher_id = ?",
            'bind' => [$voucher_id]
        ]);
    }

    public static function SumDebitEntries($id)
    {

        $gl_account_id = $id;
        $db = DB::getInstance();
        $sql = "SELECT SUM(amount_debit) as amount_debit,SUM(amount_credit) as amount_credit FROM voucher_gl_refs WHERE gl_account_id = ? AND deleted = 0";
        $result = $db->query($sql, [(int) $gl_account_id])->first();
        if (empty($result->amount_debit)) {
            return number_format(0.00, 2);
        }

        return $result->amount_debit;

    }
    public static function SumCreditEntries($id)
    {
        $gl_account_id = $id;
        $db = DB::getInstance();
        $sql = "SELECT SUM(amount_credit) as amount_credit FROM voucher_gl_refs WHERE gl_account_id = ? AND deleted = 0";
        $result = $db->query($sql, [(int) $gl_account_id])->first();
        if (empty($result->amount_credit)) {
            return number_format(0.00, 2);
        }

        return $result->amount_credit;

    }


    public function hasBudgetlines()
    {
        return $this->has_budgetlines === 1;
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