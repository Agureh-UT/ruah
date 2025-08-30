<?php

namespace App\Lib\Utilities;

use Core\H;

class Fileuploads
{

  private $_errors = [], $_files = [], $_maxAllowedSize = 5242880;
  // private $_allowedImageTypes = [IMAGETYPE_GIF, IMAGETYPE_JPEG, IMAGETYPE_PNG];
  private $_allowedImageTypes = ['jpg' => 'image/jpeg', 'png' => 'image/png', 'gif' => 'image/gif', 'pdf' => 'application/pdf'];

  public function __construct($files)
  {
    $this->_files = self::restructureFiles($files);
  }

  public function runValidation()
  {
    $this->validateSize();
    $this->validateImageType();
  }

  public function validates()
  {
    return (empty($this->_errors)) ? true : $this->_errors;
  }

  //this is function to change when uploading to another server. Amazon s3 calls the path the $bucket
  public function upload($bucket, $name, $tmp)
  {
    if (!file_exists($bucket)) {
      mkdir($bucket);
    }
    $resp = move_uploaded_file($tmp, FILES_ROOT . DS . $bucket . $name);
  }

  public function getFiles()
  {
    return $this->_files;
  }

  protected function validateImageType()
  {
    foreach ($this->_files as $file) {
      $finfo = new \finfo(FILEINFO_MIME_TYPE);
      $type = $finfo->file($file['tmp_name']);
      // checking file type
      if (!in_array($type, $this->_allowedImageTypes)) {
        $name = $file['name'];
        $msg = $name . " is not an allowed file type. Please use a jpeg, gif, png or pdf.";
        $this->addErrorMessage($name, $msg);
      }
    }
  }

  protected function validateSize()
  {
    foreach ($this->_files as $file) {
      $name = $file['name'];
      if ($file['size'] > $this->_maxAllowedSize) {
        $msg = $name . " is over the max allowed size of 5mb.";
        $this->addErrorMessage($name, $msg);
      }
    }
  }
  //addErrorMessage does not return anything it just adds to the errors[] property in the object

  protected function addErrorMessage($name, $message)
  {
    if (array_key_exists($name, $this->_errors)) {
      $this->_errors[$name] .= $this->_errors[$name] . " " . $message;
    } else {
      $this->_errors[$name] = $message;
    }
  }

  public static function restructureFiles($files)
  {
    $structured = [];
    foreach ($files['tmp_name'] as $key => $val) {
      $structured[] = [
        'tmp_name' => $files['tmp_name'][$key], 'name' => $files['name'][$key],
        'size' => $files['size'][$key], 'error' => $files['error'][$key], 'type' => $files['type'][$key]
      ];
    }
    return $structured;
  }
}
