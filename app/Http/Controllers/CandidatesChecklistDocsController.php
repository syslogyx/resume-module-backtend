<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Response;
use DateTime;
use App\CandidatesChecklistDocs;
use App\BackgroundChecklist;
use ZipArchive;
use Carbon;

class CandidatesChecklistDocsController extends BaseController
{
	/*
	* To get background check pdf file from db server
	*/
	public function downloadBackgroundCheckForm(){
	  $file = public_path('/background_check_form/BGCForm_BA_Revised_Ver7.0.pdf');
	  $headers = array('Content-Type: application/pdf');
	  return Response::download($file, 'BGCForm_BA_Revised_Ver7.0.pdf',$headers);
	}
	  
	/*
	* To get sample background check pdf file from db server
	*/
	public function downloadSampleBackgroundForm(){
	  $file = public_path('/background_check_form/TCS_BGC_FORM_SAMPLE.pdf');
	  $headers = array('Content-Type: application/pdf');
	  return Response::download($file, 'TCS_BGC_FORM_SAMPLE.pdf',$headers);
	}
	  
	/*
	* To save Filled background check pdf file form on server
	*/
	public function uploadBackgroundForm(Request $request){
		$object = new CandidatesChecklistDocs();
		DB::beginTransaction();
		try { 
			// $files = $request->file('file_name');			
			$fileArray = [];
			$posted_data=[];
			// if($request->hasfile('file_name'))
			// {
				foreach($request->file('file_name') as $file){ 
					$fileArray['file_name'] = $file->getClientOriginalName();	 
					// $fileExtension = $file->getClientOriginalExtension();
					// $fileArray['file_name'] = time().'.'.$fileExtension;
					$fileArray['candidate_id']= $request['candidate_id'];
					$fileArray['timestamp']= $request['timestamp'];
					$fileArray['bg_checklist_id']=$request['bg_checklist_id'];
					$destinationPath = public_path('/uploaded_backgroud_doc');

					$file->move($destinationPath, $fileArray['file_name']);
					// $file->move($destinationPath, $name);  
				    $fileArray['path']=$destinationPath; 
				    $fileArray["created_at"] = new DateTime();
		      		$fileArray["updated_at"] =  new DateTime();
					array_push($posted_data, $fileArray);
				}
				if ($object->validate($posted_data)) {
					$model = CandidatesChecklistDocs::insert($posted_data);
					DB::commit();
					if($model){
						return response()->json(['status_code' => 200, 'message' => 'Document uploaded successfully', 'data' => $model]);  ;
			        }else{
			          	return response()->json(['status_code' => 401, 'message' => 'Unable to upload files.']);
			        }
			    } else {
	                DB::rollback();
	                return response()->json(['status_code' => 404, 'message' => 'Something went wrong.','error' => $object->errors()]);
	            }
			// }else{
			// 	DB::rollback();
			// 	return response()->json(['status_code' => 404, 'message' => 'Please Select atleast one file.']);
			// }
		} catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }  
	  
	}

	public function downloadDocsInZipFile(Request $request){
        $candidateId = $request->candidate_id;
        $documentsFileNames = CandidatesChecklistDocs::where('candidate_id',$candidateId)->pluck('file_name');
        // return $documentsFileNames;
        $public_dir=public_path().'/uploads';
        $filepath = public_path().'/uploaded_backgroud_doc/';
      
        $zipFileName = Carbon\Carbon::now().'.zip';
   
        $zip = new ZipArchive;
        if ($zip->open($public_dir . '/' . $zipFileName, ZipArchive::CREATE) === TRUE)
        {  
            foreach($documentsFileNames as $file)
            {
                if (file_exists($filepath.'/'.$file) && is_file($filepath.'/'.$file)){
                    $zip->addFile($filepath.'/'.$file,basename($filepath.'/'.$file)); 
                }
                // else{
                //     return ['status'=>'file does not exist'];
                // }
            }
            $zip->close();   
        }
        $headers = array(
            'Content-Type' => 'application/octet-stream',
        );
        $filetopath=$public_dir.'/'.$zipFileName;
        if(file_exists($filetopath)){
            return response()->download($filetopath,$zipFileName,$headers);
        }
        return ['status'=>'file does not exist'];   
    }
}
