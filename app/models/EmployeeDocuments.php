<?php

namespace App\Models;

use Core\Model;
use Core\H;

class EmployeeDocuments extends Model
{
  public $id, $url, $employee_id,$doc_type_id, $name,$extension, $sort, $deleted = 0;
  protected static $_table = 'employee_documents';
  protected static $_softDelete = true;



  public static function uploadImages($employee_id, $uploads)
  {
    $lastImage = self::findFirst([
      'conditions' =>  "employee_id = ?",
      'bind' => [$employee_id],
      'order' => 'sort DESC'
    ]);
    $lastSort = (!$lastImage) ? 0 : $lastImage->sort;
    $path = 'uploads' . DS . 'staff_images' . DS . 'staff_' . $employee_id . DS;
    foreach ($uploads->getFiles() as $file) {
      $parts = explode('.', $file['name']);
      $ext = end($parts);
      $hash = sha1(time() . $employee_id . $file['tmp_name']);
      // $docName = $hash . '.' . $ext;

      switch ($lastSort) {
        case 0:
          $docName = "signature";
          $ext = $ext;
          $docNameWithExt = $docName . '.' . $ext;
          break;
        case 1:
          $docName = "cv";
          $ext = $ext;
          $docNameWithExt = $docName . '.' . $ext;
          break;
      }
      $image = new self();
      $image->url = $path . $docName . '.' . $ext;
      $image->name = $docName;
      $image->extension = $ext;
      $image->employee_id = $employee_id;
      $image->sort = $lastSort;
      if ($image->save()) {
        // $uploads->upload($path, $docName.'.'.$ext, $file['tmp_name']);
        $uploads->upload($path, $docNameWithExt, $file['tmp_name']);
        $lastSort++;
      }
    }
  }

  public static function deleteImages($employee_id, $unlink = false)
  {
    $images = self::find([
      'conditions' => "employee_id = ?",
      'bind' => [$employee_id]
    ]);
    foreach ($images as $image) {
      $image->delete();
    }
    if ($unlink) {
      $dirname = FILES_ROOT . DS . 'uploads' . DS . 'staff_images' . DS . 'staff_' . $employee_id;
      array_map('unlink', glob("$dirname/*.*"));
      rmdir($dirname);
    }
  }

  public static function deleteById($id)
  {
    $image = self::findById($id);
    $deleted = false;
    if ($image) {
      $employee_id = $image->employee_id;
      unlink(FILES_ROOT . DS . 'uploads' . DS . 'staff_images' . DS . 'staff_' . $image->employee_id . DS . $image->name);
      $deleted = $image->delete();
      if ($deleted) {
        self::updateSortByEmployeeId($employee_id);
      }
      return $deleted;
    }
  }

  public static function findByEmployeeId($employee_id)
  {
    return self::find([
      'conditions' => "employee_id = ?",
      'bind' => [$employee_id],
      'order' => 'sort'
    ]);
  }

  public static function updateSortByEmployeeId($employee_id, $sortOrder = [])
  {
    $images = self::findByEmployeeId($employee_id);
    $i = 0;
    foreach ($images as $image) {
      $val = 'image_' . $image->id;
      $sort = (in_array($val, $sortOrder)) ? array_search($val, $sortOrder) : $i;
      $image->sort = $sort;
      $image->save();
      $i++;
    }
  }
}
