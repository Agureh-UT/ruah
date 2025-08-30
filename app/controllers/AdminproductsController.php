<?php

namespace App\Controllers;

use Core\{Controller, H, Session, Router};
use App\Models\{Products, ProductImages, Users, Brands, Options, ProductOptionRefs};
use App\Lib\Utilities\Uploads;

class AdminproductsController extends Controller
{

  public function onConstruct()
  {
    $this->view->setLayout('admin');

    $this->currentUser = Users::currentUser();
  }
  public function indexAction()
  {
    $search = $this->request->get('search');
    $brand = $this->request->get('brand');
    $min_price = $this->request->get('min_price');
    $max_price = $this->request->get('max_price');
    $limit = (!empty($this->request->get('limit'))) ? $this->request->get('limit') : 5;
    // $limit = 10;
    $page = (!empty($this->request->get('p'))) ? $this->request->get('p') : 1;
    $offset = ($page - 1) * $limit;

    $options = [
      'search' => $search, 'min_price' => $min_price, 'max_price' => $max_price, 'brand' => $brand, 'limit' => $limit, 'offset' => $offset
    ];
    // $total = Products::findTotal($options);
    // $options = Products::mergeWithPagination($options);
    // $results = Products::featuredProductsreportWithJoins($options);
    // $results = Products::featuredProductsreportWithJoinsButWithoutProductImage($options);
    // $results = Products::fetchData2($options);
    $results = Products::featuredProductsOriginal($options);
    // $results= Products::featuredProducts($options);

    $products = $results['results'];
    $total = $results['total'];
    $this->view->products = $products;

    // H::dnd($total);
    $this->view->page = $page;
    $this->view->total =  $total;
    $this->view->limit =  $limit;
    $this->view->min_price = $min_price;
    $this->view->max_price = $max_price;
    $this->view->brand = $brand;
    $this->view->search = $search;
    $this->view->totalPages = ceil($total / $limit);
    $this->view->brandOptions = Brands::getOptionsForForm();
    $this->view->render('adminproducts/index');
  }

  public function detailsAction($product_id)
  {
    $product = Products::findById((int)$product_id);
    if (!$product) {
      Session::addMsg('danger', "Oops...that product isn't available.");
      Router::redirect('adminproducts/dashboard');
    }
    $options = $product->getOptions();
    $selectOptions = ['' => '- Choose an Option -'];
    foreach ($options as $option) {
      $selectOptions[$option->id] = $option->name . ' (' . $option->inventory . ' available)';
    }
    $this->view->selectOptions = $selectOptions;
    $this->view->product = $product;
    $this->view->images = $product->getImages();
    $this->view->render('adminproducts/details');
  }


  public function deleteAction()
  {
    $resp = ['success' => false, 'msg' => 'Something went wrong...'];
    if ($this->request->isPost()) {
      $id = $this->request->get('id');
      $product = Products::findByIdAndUserId($id, $this->currentUser->id);
      if ($product) {
        ProductImages::deleteImages($id);
        $product->delete();
        $resp = ['success' => true, 'msg' => 'Product Deleted.', 'model_id' => $id];
      }
    }
    $this->jsonResponse($resp);
  }

  public function toggleFeaturedAction()
  {
    $resp = ['success' => false, 'msg' => 'Something went wrong...'];
    if ($this->request->isPost()) {
      $id = $this->request->get('id');
      $product = Products::findByIdAndUserId($id, $this->currentUser->id);
      if ($product) {
        $product->featured = ($product->featured == 1) ? 0 : 1;
        $product->save();
        $msg = ($product->featured == 1) ? "Product Now Featured" : "Product No Longer Featured";
        $resp = ['success' => true, 'msg' => $msg, 'model_id' => $id, 'featured' => $product->featured];
      }
    }
    $this->jsonResponse($resp);
  }

  public function editAction($id)
  {
    $user = Users::currentUser();
    $product = ($id == 'new') ? new Products() : Products::findByIdAndUserId((int)$id, $user->id);
    // H::dnd($product);
    if (!$product) {
      Session::addMsg('danger', 'You do not have permission to edit that product');
      Router::redirect('adminproducts');
    }
    $images = ProductImages::findByProductId($product->id);
    // H::dnd($images);
    if ($this->request->isPost()) {
      $this->request->csrfCheck();
      $options = $_POST['options'];
      unset($_REQUEST['options']);
      $files = $_FILES['productImages'];
      // H::dnd($files);
      $isFiles = $files['tmp_name'][0] != '';
      if ($isFiles) {
        // $productImage = new ProductImages();
        $uploads = new Uploads($files);
        $uploads->runValidation();
        $imagesErrors = $uploads->validates();
        if (is_array($imagesErrors)) {
          $msg = "";
          foreach ($imagesErrors as $name => $message) {
            $msg .= $message . " ";
          }
          $product->addErrorMessage('productImages[]', trim($msg));
        }
      }

      $product->assign($this->request->get(), Products::blackList);
      $product->featured = ($this->request->get('featured') == 'on') ? 1 : 0;
      $product->has_options = ($this->request->get('has_options') == 'on') ? 1 : 0;
      $product->user_id = $this->currentUser->id;
      $product->save();
      if ($product->validationPassed()) {
        if ($isFiles) {
          //upload images
          ProductImages::uploadProductImages($product->id, $uploads);
        }
        $sortOrder = json_decode($_POST['images_sorted']);
        ProductImages::updateSortByProductId($product->id, $sortOrder);
        $inventory = 0;
        //save options
        if ($product->hasOptions()) {
          foreach ($options as $option_id) {
            $ref = ProductOptionRefs::findOrCreate($product->id, $option_id);
            $ref->inventory = $this->request->get("inventory_" . $option_id);
            $ref->save();
            $inventory += $ref->inventory;
          }
        } else {
          $inventory = $this->request->get('inventory');
        }
        $product->inventory = $inventory;
        $product->save();
        //redirect
        Session::addMsg('success', 'Product Saved!');
        Router::redirect('adminproducts');
      }
    }
    $this->view->options = Options::getOptionsByProductId($product->id);
    $this->view->header = ($id == 'new') ? "Add New Product" : "Edit " . $product->name;
    $this->view->brands = Brands::getOptionsForForm();
    $this->view->images = $images;
    $this->view->product = $product;
    $this->view->displayErrors = $product->getErrorMessages();
    $this->view->render('adminproducts/edit');
  }


  
  function deleteImageAction()
  {
    $resp = ['success' => false];
    if ($this->request->isPost()) {
      $user = Users::currentUser();
      $id = $this->request->get('image_id');
      $image = ProductImages::findById($id);
      $product = Products::findByIdAndUserId($image->product_id, $user->id);
      if ($product && $image) {
        ProductImages::deleteById($image->id);
        $resp = ['success' => true, 'model_id' => $image->id];
      }
    }
    $this->jsonResponse($resp);
  }

  function optionsAction()
  {
    $this->view->options = Options::find([
      'order' => 'name'
    ]);
    $this->view->render('adminproducts/options');
  }

  function editOptionAction($id)
  {
    $option = ($id == 'new') ? new Options() : Options::findById((int)$id);
    if ($this->request->isPost()) {
      $this->request->csrfCheck();
      $option->name = $this->request->get('name');
      if ($option->save()) {
        Session::addMsg('success', 'Option Saved!');
        Router::redirect('adminproducts/options');
      }
    }
    $this->view->option = $option;
    $this->view->errors = $option->getErrorMessages();
    $this->view->header = ($id == 'new') ? "Add Product Option" : "Edit Product Option";
    $this->view->render('adminproducts/editOption');
  }

  function deleteOptionAction()
  {
    $id = $this->request->get('id');
    $option = Options::findById((int)$id);
    $resp = ['success' => false, 'msg' => 'Something went wrong...'];
    if ($option) {
      $option->delete();
      $resp['success'] = true;
      $resp['msg'] = 'Option Deleted';
      $resp['model_id'] = $id;
    }
    $this->jsonResponse($resp);
  }

  function getOptionsForFormAction()
  {
    // You may use either REGEX or LIKE Operator
    $options = Options::find([
      'conditions' => 'name LIKE ?',
      'bind' => ['%' . $this->request->get('q') . '%']
    ]);
    // $options = Options::find([
    //   'conditions' => 'name REGEXP ?',
    //   'bind' => [$this->request->get('q')]
    // ]);
    $items = [];
    foreach ($options as $option) {
      $items[] = ['id' => $option->id, 'text' => $option->name];
    }
    $resp = ['items' => $items];
    $this->jsonResponse($resp);
  }

  public function reportsAction()
  {

    $pModel = new Products();
    $products = $pModel->featuredProductsreport();
    $this->view->products = $products;
    $this->view->render('adminproducts/reports');
  }
}
