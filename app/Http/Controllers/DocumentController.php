<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Storage;

use App\Document;
use Config;

class DocumentController extends BaseController {

    public function upload(Request $request) {

        if ($request->hasFile('file')) {
            $file = $request->file('file');

            // $storage_path = 'uploads/' . date('Y') . '/' . date('m');
            // $file_name = str_random(12) . time() . "." . $file->getClientOriginalExtension();
            // $path = Storage::putFileAs($storage_path, $request->file('file'), $file_name); 
            // $posted_data["file_name"] = $file_name;
            // $posted_data["path"] =  $storage_path;


            $seperator = Config::get("constants.dir_seperator");
            $storage_path = $seperator .'uploads'.$seperator . date('Y') . $seperator . date('m');
            $file_name = str_random(12) . time() . "." . $file->getClientOriginalExtension();
            $path = Storage::putFileAs($storage_path, $request->file('file'), $file_name);
<<<<<<< HEAD

            $posted_data["file_name"] = $file_name;
            $posted_data["path"] =  str_replace($seperator, "/", $storage_path);
          
=======
            //$path = $request->file;
            //$file


    $posted_data["file_name"] = $file_name;
            //$posted_data["file_name"] = $request->file->store("");
            $posted_data["path"] =  $storage_path;
            $document = new Document();
>>>>>>> fbfd55465d6faf71fa8f2acdd50109abbcf2d396


            $document = new Document();

            if ($document->validate($posted_data)) {
                $model = Document::create($posted_data);
                return $this->dispatchResponse(200, "File Upload Successfully...!!", $model);
            } else {
                throw new \Dingo\Api\Exception\StoreResourceFailedException('Unable to add document.', $document->errors());
            }
        } else {
            throw new \Dingo\Api\Exception\StoreResourceFailedException('Unable to upload file, File is missing!');
        }
    }

}

