<?php

namespace App\Models;

use App\Models\Brands;
use App\Models\ProductImages;
use Core\DB;
use Core\Model;
use Core\H;
use Core\Validators\NumericValidator;
use Core\Validators\RequiredValidator;

class Products extends Model
{

    public $id, $created_at, $updated_at, $user_id, $name, $price, $list, $shipping;
    public $body, $brand_id, $featured = 0, $has_options = 0, $inventory = 0, $deleted = 0;
    const blackList = ['id', 'deleted', 'featured', 'options', 'images_sorted'];
    protected static $_table = 'products';
    protected static $_softDelete = true;

    public function beforeSave()
    {
        $this->timeStamps();
    }

    public function validator()
    {
        $requiredFields = ['name' => 'Name', 'price' => 'Price', 'list' => 'List Price', 'shipping' => 'Shipping', 'body' => 'Body'];
        foreach ($requiredFields as $field => $display) {
            $this->runValidation(new RequiredValidator($this, ['field' => $field, 'msg' => $display . " is required."]));
        }
        $this->runValidation(new NumericValidator($this, ['field' => 'price', 'msg' => 'Price must be a number.']));
        $this->runValidation(new NumericValidator($this, ['field' => 'list', 'msg' => 'List Price must be a number.']));
        $this->runValidation(new NumericValidator($this, ['field' => 'shipping', 'msg' => 'Shipping must be a number.']));
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

    public function isChecked()
    {
        return $this->featured === 1;
    }

    public function hasOptions()
    {
        return $this->has_options === 1;
    }

    public function getOptions()
    {
        if (!$this->hasOptions()) {
            return [];
        }

        $sql = "
      SELECT options.id, options.name, refs.inventory
      FROM options
      JOIN product_option_refs as refs ON options.id = refs.option_id
      WHERE refs.product_id = ? AND refs.inventory > 0
      ";
        return DB::getInstance()->query($sql, [$this->id])->results();
    }
    public static function featuredProductsreportWithJoins($options)
    {
        self::$_softDelete = false;
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 5;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "products.deleted = 0 AND pi.sort = '0' AND pi.deleted = 0 AND products.inventory > 0";
        $hasFilters = self::hasFilters($options);
        $binds = [];

        if (array_key_exists('brand', $options) && !empty($options['brand'])) {
            $where .= " AND brands.id = ?";
            $binds[] = $options['brand'];
        }

        if (array_key_exists('min_price', $options) && !empty($options['min_price'])) {
            $where .= " AND products.price >= ?";
            $binds[] = $options['min_price'];
        }

        if (array_key_exists('max_price', $options) && !empty($options['max_price'])) {
            $where .= " AND products.price <= ?";
            $binds[] = $options['max_price'];
        }

        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (products.name LIKE ? OR brands.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
        }
        $params1 = [
            'columns' => "products.*, pi.url as url, brands.name as brand",
            // 'conditions' => "products.featured = 1 AND products.deleted = 0 AND  pi.sort = 0",
            'conditions' => $where,
            // 'bind' => [$brand_id,$product_name],
            'bind' => $binds,
            'joins' => [
                ['product_images', ' pi.product_id = products.id', 'pi', 'LEFT'],
                ['brands', 'brands.id = products.brand_id', 'brands', 'LEFT']
            ]
        ];
        $total = count(self::find($params1));

        $params2 = [
            'limit' => $limit,
            'offset' => $offset
        ];
        $paramsfinal = array_merge($params1, $params2);
        $results = self::find($paramsfinal);
        return ['results' => $results, 'total' => $total];

        // self::$_softDelete = false;
        // return self::find($params);
    }


    public static function featuredProductsreportWithJoinsButWithoutProductImage($options)
    {
        self::$_softDelete = false;
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 5;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "products.deleted = 0 AND products.inventory > 0";
        $hasFilters = self::hasFilters($options);
        $binds = [];

        if (array_key_exists('brand', $options) && !empty($options['brand'])) {
            $where .= " AND brands.id = ?";
            $binds[] = $options['brand'];
        }

        if (array_key_exists('min_price', $options) && !empty($options['min_price'])) {
            $where .= " AND products.price >= ?";
            $binds[] = $options['min_price'];
        }

        if (array_key_exists('max_price', $options) && !empty($options['max_price'])) {
            $where .= " AND products.price <= ?";
            $binds[] = $options['max_price'];
        }

        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (products.name LIKE ? OR brands.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
        }
        $params1 = [
            'columns' => "products.*, brands.name as brand",
            // 'conditions' => "products.featured = 1 AND products.deleted = 0 AND  pi.sort = 0",
            'conditions' => $where,
            // 'bind' => [$brand_id,$product_name],
            'bind' => $binds,
            'joins' => [
                ['brands', 'brands.id = products.brand_id', 'brands', 'LEFT']
            ]
        ];
        $total = count(self::find($params1));

        $params2 = [
            'limit' => $limit,
            'offset' => $offset
        ];
        $paramsfinal = array_merge($params1, $params2);
        $results = self::find($paramsfinal);
        return ['results' => $results, 'total' => $total];

        // self::$_softDelete = false;
        // return self::find($params);
    }


    public static function searchProducts($options)
    {
        $db = DB::getInstance();
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "products.deleted = 0 AND pi.sort = '0' AND pi.deleted = 0 AND products.inventory > 0";
        $hasFilters = self::hasFilters($options);
        $binds = [];

        if (array_key_exists('brand', $options) && !empty($options['brand'])) {
            $where .= " AND brands.id = ?";
            $binds[] = $options['brand'];
        }

        if (array_key_exists('min_price', $options) && !empty($options['min_price'])) {
            $where .= " AND products.price >= ?";
            $binds[] = $options['min_price'];
        }

        if (array_key_exists('max_price', $options) && !empty($options['max_price'])) {
            $where .= " AND products.price <= ?";
            $binds[] = $options['max_price'];
        }

        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (products.name LIKE ? OR brands.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
        }

        $sql = "SELECT products.*, pi.url as url, brands.name as brand FROM products
          JOIN product_images as pi
          ON products.id = pi.product_id
          JOIN brands
          ON products.brand_id = brands.id
          WHERE {$where}
        ";

        $group = ($hasFilters) ? " GROUP BY products.id ORDER BY products.name" : "GROUP BY products.id ORDER BY products.featured DESC";
        $pager = " Limit ? OFFSET ?";
        $binds[] = $limit;
        $binds[] = $offset;

        $total = $db->query($sql . $group, $binds)->count();
        $results = $db->query($sql . $group . $pager, $binds)->results();

        return ['results' => $results, 'total' => $total];
    }
//Improve the featuredProducts function below to use the new joinsRaw param under the _read method in DB.php. However do not use the _read method directly, instead use the Products::find() method to run the query instead of DB->query() method.
    public static function featuredProducts($options)
    {
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $hasFilters = self::hasFilters($options);
        
        // Build WHERE conditions efficiently using array approach
        $whereConditions = [
            "products.deleted = 0",
            "pi.sort = '0'",
            "pi.deleted = 0", 
            "products.inventory > 0"
        ];
        $binds = [];

        // Dynamic filter mapping for better performance and maintainability
        $filterMappings = [
            'brand' => ["brands.id = ?", $options['brand'] ?? null],
            'min_price' => ["products.price >= ?", $options['min_price'] ?? null],
            'max_price' => ["products.price <= ?", $options['max_price'] ?? null]
        ];

        foreach ($filterMappings as [$condition, $value]) {
            if (!empty($value)) {
                $whereConditions[] = $condition;
                $binds[] = $value;
            }
        }

        // Handle search filter (requires two parameters)
        if (!empty($options['search'])) {
            $whereConditions[] = "(products.name LIKE ? OR brands.name LIKE ?)";
            $searchTerm = "%" . $options['search'] . "%";
            $binds[] = $searchTerm;
            $binds[] = $searchTerm;
        }

        $whereClause = implode(" AND ", $whereConditions);
        
        // Reusable join configuration
        $joinsRaw = [
            'JOIN product_images as pi ON products.id = pi.product_id',
            'JOIN brands ON products.brand_id = brands.id'
        ];

        // Optimized GROUP BY clause (reusable)
        $groupByClause = "products.id, products.created_at, products.updated_at, products.user_id, products.name, products.price, products.list, products.shipping, products.body, products.brand_id, products.featured, products.has_options, products.inventory, products.deleted, pi.url, brands.name";

        // Optimized count query - only count distinct IDs for better performance
        $countParams = [
            'columns' => "COUNT(DISTINCT products.id) as total",
            'conditions' => $whereClause,
            'joinsRaw' => $joinsRaw,
            'bind' => $binds,
            'includeDeleted' => true
        ];
        
        $totalResult = self::find($countParams);
        $total = $totalResult ? $totalResult[0]->total : 0;

        // Main query with optimized configuration
        $params = [
            'columns' => "products.*, pi.url as url, brands.name as brand",
            'conditions' => $whereClause,
            'joinsRaw' => $joinsRaw,
            'group' => $groupByClause,
            'order' => $hasFilters ? "products.name" : "products.featured DESC",
            'limit' => $limit,
            'offset' => $offset,
            'bind' => $binds,
            'includeDeleted' => true
        ];

        $results = self::find($params);
        return ['results' => $results, 'total' => $total];
    }
    public static function featuredProductsOriginal($options)
    {
        $db = DB::getInstance();
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $hasFilters = self::hasFilters($options);
        
        // Build WHERE conditions and bindings efficiently
        $whereConditions = [
            "products.deleted = 0",
            "pi.sort = '0'", 
            "pi.deleted = 0",
            "products.inventory > 0"
        ];
        $binds = [];

        // Add filter conditions dynamically
        $filterMappings = [
            'brand' => ["brands.id = ?", $options['brand'] ?? null],
            'min_price' => ["products.price >= ?", $options['min_price'] ?? null],
            'max_price' => ["products.price <= ?", $options['max_price'] ?? null]
        ];

        foreach ($filterMappings as $key => [$condition, $value]) {
            if (!empty($value)) {
                $whereConditions[] = $condition;
                $binds[] = $value;
            }
        }

        // Handle search separately (requires two parameters)
        if (!empty($options['search'])) {
            $whereConditions[] = "(products.name LIKE ? OR brands.name LIKE ?)";
            $searchTerm = "%" . $options['search'] . "%";
            $binds[] = $searchTerm;
            $binds[] = $searchTerm;
        }

        $whereClause = implode(" AND ", $whereConditions);
        
        // Reusable query parts
        $joinClause = "FROM products
                       JOIN product_images pi ON products.id = pi.product_id 
                       JOIN brands ON products.brand_id = brands.id
                       WHERE {$whereClause}";
        
        $groupByClause = "GROUP BY products.id, products.created_at, products.updated_at, products.user_id, 
                                  products.name, products.price, products.list, products.shipping, products.body, 
                                  products.brand_id, products.featured, products.has_options, products.inventory, 
                                  products.deleted, pi.url, brands.name";

        $orderByClause = $hasFilters ? "ORDER BY products.name" : "ORDER BY products.featured DESC";

        // Optimized count query - only select what's needed for counting
        $countSql = "SELECT COUNT(*) as total FROM (
                        SELECT 1 {$joinClause} {$groupByClause}
                     ) as counted_products";
        
        $totalResult = $db->query($countSql, $binds)->first();
        $total = $totalResult ? $totalResult->total : 0;

        // Main results query
        $resultSql = "SELECT products.*, pi.url as url, brands.name as brand 
                      {$joinClause} 
                      {$groupByClause} 
                      {$orderByClause} 
                      LIMIT ? OFFSET ?";
        
        $resultBinds = array_merge($binds, [$limit, $offset]);
        $results = $db->query($resultSql, $resultBinds)->results();

        return ['results' => $results, 'total' => $total];
    }

    public static function fetchData2($options)
    {
        $db = DB::getInstance();
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "products.deleted = 0 AND pi.sort = 0 AND pi.deleted = 0";
        if (!self::hasFilters($options)) {
            $where .= " AND products.featured = '1'";
        }
        $binds = [];

        if (array_key_exists('brand', $options) && !empty($options['brand'])) {
            $where .= " AND brands.id = ?";
            $binds[] = $options['brand'];
        }

        if (array_key_exists('min_price', $options) && !empty($options['min_price'])) {
            $where .= " AND products.price >= ?";
            $binds[] = $options['min_price'];
        }

        if (array_key_exists('max_price', $options) && !empty($options['max_price'])) {
            $where .= " AND products.price <= ?";
            $binds[] = $options['max_price'];
        }

        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (products.name LIKE ? OR brands.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
        }


        $select = "SELECT COUNT(*) as total";

        $sql = " FROM products
                JOIN product_images as pi
                ON products.id = pi.product_id
                JOIN brands
                ON products.brand_id = brands.id
                WHERE {$where}
              ";
        $total = $db->query($select . $sql, $binds)->first()->total;

        $select = "SELECT products.*, pi.url as url, brands.name as brand";
        $pager = " Limit ? OFFSET ?";
        $binds[] = $limit;
        $binds[] = $offset;

        $results = $db->query($select . $sql . $pager, $binds)->results();

        return ['results' => $results, 'total' => $total];
    }

    public static function featuredProductsepisode_15_supplimental($options)
    {
        $db = DB::getInstance();
        $limit = (array_key_exists('limit', $options) && !empty($options['limit'])) ? $options['limit'] : 4;
        $offset = (array_key_exists('offset', $options) && !empty($options['offset'])) ? $options['offset'] : 0;
        $where = "products.deleted = 0 AND pi.sort = '0'";
        $hasFilters = self::hasFilters($options);
        $binds = [];

        if (array_key_exists('brand', $options) && !empty($options['brand'])) {
            $where .= " AND brands.id = ?";
            $binds[] = $options['brand'];
        }

        if (array_key_exists('min_price', $options) && !empty($options['min_price'])) {
            $where .= " AND products.price >= ?";
            $binds[] = $options['min_price'];
        }

        if (array_key_exists('max_price', $options) && !empty($options['max_price'])) {
            $where .= " AND products.price <= ?";
            $binds[] = $options['max_price'];
        }

        if (array_key_exists('search', $options) && !empty($options['search'])) {
            $where .= " AND (products.name LIKE ? OR brands.name LIKE ?)";
            $binds[] = "%" . $options['search'] . "%";
            $binds[] = "%" . $options['search'] . "%";
        }

        $sql = "SELECT products.*, pi.url as url, brands.name as brand FROM products
                JOIN product_images as pi
                ON products.id = pi.product_id
                JOIN brands
                ON products.brand_id = brands.id
                WHERE {$where}
              ";

        $group = ($hasFilters) ? " GROUP BY products.id ORDER BY products.name" : "GROUP BY products.id ORDER BY products.featured DESC";
        $pager = " Limit ? OFFSET ?";
        $binds[] = $limit;
        $binds[] = $offset;

        $total = $db->query($sql . $group, $binds)->count();
        $results = $db->query($sql . $group . $pager, $binds)->results();

        return ['results' => $results, 'total' => $total];
    }

    public static function hasFilters($options)
    {
        foreach ($options as $key => $value) {
            if (!empty($value) && $key != 'limit' && $key != 'offset') return true;
        }
        return false;
    }

    public function getBrandName()
    {
        if (empty($this->brand_id)) {
            return '';
        }

        $brand = Brands::findFirst([
            'conditions' => "id = ?",
            'bind' => [$this->brand_id],
        ]);
        return ($brand) ? $brand->name : '';
    }

    public function displayShipping()
    {
        return ($this->shipping == 0) ? "Free shipping" : "$" . $this->shipping;
    }

    public function getImages()
    {
        return ProductImages::find([
            'conditions' => "product_id = ?",
            'bind' => [$this->id],
            'order' => 'sort',
        ]);
    }

    public static function featuredProductsreport()
    {
        $sql = "SELECT products.*, pi.url as url, brands.name as brand
              FROM products
              JOIN product_images as pi
              ON products.id = pi.product_id
              JOIN brands
              ON products.brand_id = brands.id
              WHERE products.featured = '1' and products.deleted = '0' and pi.sort = '0'
              group by pi.product_id
              ";
        return DB::getInstance()->query($sql)->results();
    }
    //           public static function featuredProductsreportWithJoins($options){
    //     $params = [
    //             'columns' => "products.*, pi.url as url, brands.name as brand",
    //             'conditions' => "products.featured = 1 AND products.deleted = 0 AND  pi.sort = 0",
    //             // 'bind' => [$brand_id,$product_name],
    //             'joins' => [
    //                 ['product_images',' pi.product_id = products.id', 'pi', 'LEFT'],
    //                 ['brands', 'brands.id = products.brand_id', 'brands', 'LEFT']
    //             ],
    //             'group' => 'pi.product_id'
    //         ];
    //         self::$_softDelete = false;
    //         return self::find($params);
    // }

    // public static function getProductsByInvoiceId($invoice_id){
    //   if($invoice_id == 'new') return [];
    //   $sql = "SELECT products.id,products.name,products.price,products.inventory, items.qty
    //           FROM products
    //           JOIN invoice_items as items ON products.id = items.product_id
    //           WHERE items.invoice_id = ?";

    //   return DB::getInstance()->query($sql,[$invoice_id])->results();
    // }
    // public static function getProductsByInvoiceId($invoice_id)
    // {
    //     if ($invoice_id == 'new') {
    //         return [];
    //     }

    //     $sql = "SELECT products.*,items.qty,items.budgetline_id
    //           FROM products
    //           JOIN invoice_items as items ON products.id = items.product_id
    //           WHERE items.invoice_id = ?";

    //     return DB::getInstance()->query($sql, [$invoice_id], InvoiceItems::class)->results();
    //     // return DB::getInstance()->query($sql,[$invoice_id],Budgetlines::class)->results();
    //     // return DB::getInstance()->query($sql, [$invoice_id], Products::class)->results();
    //     // return DB::getInstance()->query($sql, [$invoice_id])->results();

    // }
    public static function findAllItemsByInvoiceId($invoice_id)
    {
        $sql = "SELECT items.*, p.name, p.price, p.inventory
      FROM invoice_items as items
      JOIN products as p ON p.id = items.product_id
      LEFT JOIN brands ON brands.id = p.brand_id
      WHERE items.invoice_id = ? AND items.deleted = 0";
        $db = DB::getInstance();
        return $db->query($sql, [(int) $invoice_id])->results();
    }
    public static function findByName($name)
    {
        $conditions = [
            'conditions' => "name = ?",
            'bind' => [$name],
        ];
        return self::findFirst($conditions);
    }

    public static function getOptionsForForm()
    {
        $params = [
            'order' => 'id'
        ];
        $products = self::find($params);
        $productsAry = ['' => '-Select Product-'];
        foreach ($products as $product) {
            $productsAry[$product->id] = $product->name;
        }
        return $productsAry;
    }
}
