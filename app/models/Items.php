<?php

namespace App\Models;

use App\Models\Brands;
use App\Models\ProductImages;
use Core\DB;
use Core\Model;
use Core\H;
use Core\Validators\NumericValidator;
use Core\Validators\RequiredValidator;
use Core\Validators\UniqueValidator;

class Items extends Model
{

    public $id, $created_at, $updated_at, $user_id, $name, $unit_cost=0.00;
    public $body, $category_id, $inventory = 0.00, $deleted = 0;
    const blackList = ['id', 'deleted'];
    protected static $_table = 'items';
    protected static $_softDelete = true;

    public function beforeSave()
    {
        $this->timeStamps();
    }

    public function validator()
    {
        $requiredFields = ['name' => 'Name', 'unit_cost' => 'Unit Cost'];
        foreach ($requiredFields as $field => $display) {
            $this->runValidation(new RequiredValidator($this, ['field' => $field, 'msg' => $display . " is required."]));
        }
        $this->runValidation(new NumericValidator($this, ['field' => 'unit_cost', 'msg' => 'Price must be a number.']));
        $this->runValidation(new UniqueValidator($this, ['field' => ['name', 'deleted'], 'msg' => 'That  Name already exists.']));
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

    public static function findByIdAndUserId($id, $user_id)
    {
        $conditions = [
            'conditions' => "id = ? AND user_id = ?",
            'bind' => [(int) $id, (int) $user_id],
        ];
        return self::findFirst($conditions);
    }


    public static function fetchData($options)
    {
        $db = DB::getInstance();
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "items.deleted = 0";
        $binds = [];

        if (array_key_exists('item_category', $options) && !empty($options['item_category'])) {
            $where .= " AND item_categories.id = ?";
            $binds[] = $options['item_category'];
        }

        if (array_key_exists('min_price', $options) && !empty($options['min_price'])) {
            $where .= " AND items.unit_cost >= ?";
            $binds[] = $options['min_price'];
        }

        if (array_key_exists('max_price', $options) && !empty($options['max_price'])) {
            $where .= " AND items.unit_cost <= ?";
            $binds[] = $options['max_price'];
        }

        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (items.name LIKE ? OR item_categories.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
        }


        $select = "SELECT COUNT(*) as total";

        $sql = " FROM items
                JOIN item_categories
                ON items.category_id = item_categories.id
                WHERE {$where} ORDER BY items.id
              ";
        $total = $db->query($select . $sql, $binds)->first()->total;

        $select = "SELECT items.*, item_categories.name as item_category";
        $pager = " Limit ? OFFSET ?";
        $binds[] = $limit;
        $binds[] = $offset;

        $results = $db->query($select . $sql . $pager, $binds)->results();

        return ['results' => $results, 'total' => $total];
    }



    public function getCategoryName()
    {
        if (empty($this->category_id)) {
            return '';
        }

        $item_category = Brands::findFirst([
            'conditions' => "id = ?",
            'bind' => [$this->category_id],
        ]);
        return ($item_category) ? $item_category->name : '';
    }

    public static function getOptionsForForm()
    {
        $params = [
            'columns' => 'id, name',
            'order' => 'id'
        ];

        $datalists = self::find($params);
        $dataAry = ['' => '-Select New-'];
        foreach ($datalists as $data) {
            $dataAry[$data->id] = $data->name;
        }
        return $dataAry;
    }
}
