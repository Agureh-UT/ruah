<?php

namespace App\Models;

use Core\H;

class Upload
{
    public $file, $field, $errors = [];
    public $size, $tmp, $ext;
    // public $maxSize = 2097152;
    public $maxSize = 2000000;
    // public $maxSize = 5242880;

    public $allowedFileTypes = ['jpg' => 'image/jpeg', 'png' => 'image/png', 'gif' => 'image/gif', 'pdf' => 'application/pdf'];
    // public $allowedFileTypes = ['jpg' => 'image/jpeg', 'png' => 'image/png'];
    public $required = true;

    public function __construct($field)
    {
        $this->field = $field;
        $this->checkInitialError();
        // H::dnd($this->checkInitialError(),true);
        $this->file = $_FILES[$field];
        $this->size = $this->file['size'];
        $this->tmp = $this->file['tmp_name'];
        $this->ext = pathinfo($this->file['name'], PATHINFO_EXTENSION);
        // $this->ext = pathinfo($this->file['tmp_name'], PATHINFO_EXTENSION);
        // $this->ext = pathinfo($this->file['full_path'], PATHINFO_EXTENSION);
        
        
    }

    public function validate()
    {
        $this->errors = [];
        if (empty($this->tmp) && $this->required) {
            $this->errors[$this->field] =  "File is required";
        }
        //check size
        if (!empty($this->tmp) && $this->size > $this->maxSize) {
            // $this->errors[$this->field] = "Exceeded file size limit of " . $this->formatBytes($this->maxSize);
            $this->errors[$this->field] = "Exceeded file size limit of 2MBs";
        }

        //check if allowed type
        if (!empty($this->tmp) && empty($this->errors)) {
            $finfo = new \finfo(FILEINFO_MIME_TYPE);
            $type = $finfo->file($this->tmp);
            // if (array_search($type, $this->allowedFileTypes) === false) {
            if (!in_array($type, $this->allowedFileTypes)) {
                $this->errors[$this->field] = "Not an allowed file type. Must be " . implode(', ', array_keys($this->allowedFileTypes));
            }
        }

        return $this->errors;
    }

    public function upload($fileName)
    {
        $test = move_uploaded_file($this->tmp, $fileName);
        return $test;
    }

    //this is function to change when uploading to another server. Amazon s3 calls the path the $bucket
    public function uploadFile($bucket, $name)
    {
        if (!file_exists($bucket)) {
            mkdir($bucket);
        }
        $resp = move_uploaded_file($this->tmp, FILES_ROOT . DS . $bucket . $name);
        return $resp;
    }

    public function formatBytesOld($bytes, $precision = 2)
    {
        $units = ['B', 'KB', 'MB', 'GB', 'TB'];
        $bytes = max($bytes, 0);
        $pow = floor(($bytes ? log($bytes) : 0) / log(1024));
        $pow = min($pow, count($units) - 1);
        return round($bytes, $precision) . $units[$pow];
    }
    public function formatBytes($bytes, $precision = 2)
    {
        $units = ['B', 'KB', 'MB', 'GB', 'TB'];
        $bytes = max($bytes, 0);
        $pow = floor(($bytes ? log($bytes) : 0) / log(1024));
        $pow = min($pow, count($units) - 1);
        $bytes = $bytes / pow(1024, $pow); // Without this you'll get a wrong size number
        return round($bytes, $precision) . ' ' . $units[$pow];
    }
    private function checkInitialError()
    {
        if (!isset($_FILES[$this->field]) || is_array($_FILES[$this->field]['error'])) {
            throw new \RuntimeException("Something is wrong with the file.");
        }
    }
}
